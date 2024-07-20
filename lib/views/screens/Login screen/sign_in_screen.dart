import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/authentication_controller/login_controller.dart';
import 'package:meditation/constant/authentication_constant/authentication_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/main.dart';
import 'package:meditation/services/authentication_service.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/services/toast_service.dart';
import 'package:meditation/views/screens/Login%20screen/Forgotpasswordpage.dart';
import 'package:meditation/views/screens/Login%20screen/sign_up_screen.dart';
import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';
import 'package:meditation/views/utils/button_page.dart';
import 'package:meditation/views/utils/textwidget.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../generated/l10n.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authController = Get.put(LoginController(), permanent: true);
  RxBool isGoogle = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// =================== Skip Button ===================
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            isSkip.value = true;
            Get.to(() => BottomNavigator());
          },
          child: Text(
            S.of(context).skip,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          elevation: 10,
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              /// =================== Background Image ===================
              Positioned.fill(
                child: Image.asset(signInAndSignUpBackImage, fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// =================== Meditation ===================
                    SizedBox(height: 100.h),
                    Styles.regular(S.of(context).meditation, ff: 'regular', fs: 50.sp, c: Colors.white),

                    /// =================== SignIn to Your Account ===================
                    SizedBox(height: 18.h),
                    Center(
                      child: Text(
                        S.of(context).signInAccount,
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /// =================== Enter Email ===================
                          SizedBox(height: 34.h),
                          TextFieldModel(
                            controller: emailTextController,
                            password: false,
                            svg: emailIcon,
                            width: 20.w,
                            height: 16.h,
                            hint: S.of(context).enterEmail,
                            keyBoardType: TextInputType.emailAddress,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Enter Valid Email';
                              } else {
                                return '';
                              }
                            },
                          ),

                          /// =================== Enter Password ===================
                          SizedBox(height: 20.h),
                          Center(
                            child: TextFieldModel(
                                controller: passwordTextController,
                                password: true,
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  }
                                  if (value.length <= 0) {
                                    return 'Password is too short!';
                                  }
                                  return '';
                                },
                                svg: passwordIcon,
                                width: 16.w,
                                height: 20.h,
                                hint: S.of(context).enterPassword),
                          ),
                        ],
                      ),
                    ),

                    /// =================== Forgot Password ===================
                    SizedBox(height: 20.h),
                    TextButton(
                        onPressed: () {
                          Get.to(() => ForgotPasswordPage());
                        },
                        child: Styles.regular(S.of(context).forgotPassword, fs: 16.sp, c: Constant.whiteColor)),

                    /// =================== LogIn Button ===================
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () async {
                        showLoader(context);
                        await authController.login(email: emailTextController.text, password: passwordTextController.text).then(
                          (value) {
                            hideLoader(context);
                            // snackBar(title: 'successful', message: 'Enter  Your Email');
                            if (value?.relaxMeditation[0].success.contains('1') == true) {
                              String email = value?.relaxMeditation[0].email ?? '';
                              String uid = value?.relaxMeditation[0].userId ?? '';
                              print('User Id ======$uid');
                              LocalStorageServices.box.write('email', email);
                              LocalStorageServices.box.write('uid', uid);
                              snackBar(message: 'Login Successfully', title: '');
                              Get.to(() => BottomNavigator());
                              Get.snackbar('Login Successful', value?.relaxMeditation[0].msg ?? '');
                            } else {}
                          },
                        );
                      },
                      child: ButtonPage(title: S.of(context).logIn),
                    ),

                    /// =================== OR ===================
                    SizedBox(height: 41.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Divider(
                          color: Constant.whiteColor,
                          thickness: 2,
                          endIndent: 5,
                        )),
                        Text('OR', style: TextStyle(color: Constant.whiteColor)),
                        Flexible(child: Divider(indent: 5, color: Constant.whiteColor, thickness: 2)),
                      ],
                    ),

                    /*/// =================== Continue with Facebook ===================
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      width: 300.w,
                      height: 50.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                      child: Row(
                        children: [
                          SvgPicture.asset(FacebookImage, height: 20.h, width: 20.w),
                          SizedBox(width: 10),
                          Text(continueWithFacebook, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),*/

                    /// =================== Continue with Google ===================
                    SizedBox(height: 10.h),
                    if (isGoogle.value == true)
                      InkWell(
                        onTap: () {
                          Authentication().googleSignIn().then((value) async {
                            showLoader(context);
                            print("This is Value Of Auth :: ${value!.user!.email}");
                            await AuthenticationServices()
                                .userGoogleRegistration(email: value.user!.email!, image: value.user!.photoURL!, name: value.user!.displayName!, password: '', phone: '', authId: value.user!.uid)
                                .then(
                              (value) async {
                                hideLoader(context);
                                if (value != null) {
                                  ToastService().toast(value.relaxMeditation[0].msg);
                                  await LocalStorageServices.box.write('login', value.relaxMeditation[0].userId.toString());
                                  localStorageUserId = await LocalStorageServices.box.read('login');
                                }
                              },
                            );
                            ToastService().toast('You are registered now.');
                            Get.offAll(() => BottomNavigator(tab: 0));
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                          child: Row(
                            children: [
                              SvgPicture.asset(googleImage, height: 20.h, width: 20.w),
                              SizedBox(width: 10),
                              Text(S.of(context).continueWithGoogle, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),

                    /// =================== Continue with Apple ===================
                    SizedBox(height: 10.h),
                    Platform.isIOS
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SignInWithAppleButton(
                              height: 45.h,
                              style: SignInWithAppleButtonStyle.white,
                              borderRadius: BorderRadius.circular(30),
                              onPressed: () {
                                Authentication().signInWithApple().then((value) async {
                                  showLoader(context);
                                  print("This is Value Of Auth :: ${value!.user!.email?.split('@')}");
                                  await AuthenticationServices()
                                      .userAppleRegistration(email: value.user!.email!, image: '', name: value.user!.email!.split('@').first, password: '', phone: '', authId: value.user!.uid)
                                      .then(
                                    (value) async {
                                      hideLoader(context);
                                      if (value != null) {
                                        ToastService().toast(value.relaxMeditation[0].msg);
                                        await LocalStorageServices.box.write('login', value.relaxMeditation[0].userId.toString());
                                        localStorageUserId = await LocalStorageServices.box.read('login');
                                      }
                                    },
                                  );
                                  ToastService().toast('You are registered now.');
                                  Get.offAll(() => BottomNavigator(tab: 0));
                                });
                              },
                            ),
                          )
                        : SizedBox(),

                    /// =================== Need an Account? ===================
                    SizedBox(height: 25.h),
                    InkWell(
                      onTap: () => Get.to(() => SignUpScreen()),
                      child: RichText(
                        text: TextSpan(
                          text: S.of(context).needAnAccount,
                          style: TextStyle(fontSize: 16.sp, color: Constant.whiteColor),
                          children: <TextSpan>[
                            TextSpan(text: S.of(context).signUpText, style: TextStyle(fontSize: 16.sp, decoration: TextDecoration.underline, color: Constant.whiteColor)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  snackBar({title, message}) {
    return Get.snackbar(title, message);
  }
}
