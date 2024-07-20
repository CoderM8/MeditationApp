// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/authentication_controller/signup_controller.dart';
import 'package:meditation/constant/authentication_constant/authentication_constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/main.dart';
import 'package:meditation/services/authentication_service.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/services/toast_service.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_screen.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';
import 'package:meditation/views/utils/button_page.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey_1 = GlobalKey<FormState>();
  final SignupController signupController = Get.put(SignupController());
  RxBool isGoogle = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(signInAndSignUpBackImage),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Stack(
              children: [
                /// =================== Background Image ===================
                // Positioned(
                //   child: Image.asset(signInAndSignUpBackImage, ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// =================== Meditation String ===================
                      SizedBox(height: 90.h),
                      Styles.regular(S.of(context).meditation,
                          ff: 'regular', fs: 50.sp, c: Colors.white),

                      /// =================== Create an Account ===================
                      Center(
                        child: Column(
                          children: [
                            Text(S.of(context).createAnAccount,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp)),
                          ],
                        ),
                      ),

                      Form(
                        key:formKey_1,
                        child: Column(
                          children: [
                            /// =================== Name TextField ===================
                            SizedBox(height: 25.h),
                            TextFieldModel(
                                controller: signupController.userController,
                                password: false,
                                svg: personIcon,
                                hint: S.of(context).enterName,
                                height: 20.h,
                                width: 14.76.w),

                            /// =================== Enter Email ===================
                            SizedBox(height: 17.h),
                            TextFieldModel(
                              controller: signupController.emailController,
                              svg: emailIcon,
                              hint: S.of(context).enterEmail,
                              height: 20.h,
                              width: 16.w,
                              password: false,
                              keyBoardType: TextInputType.emailAddress,
                              valid: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Email';
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
                            SizedBox(height: 17.h),
                            TextFieldModel(
                              svg: passwordIcon,
                              hint: S.of(context).enterPassword,
                              height: 20.h,
                              width: 16.w,
                              controller: signupController.passwordController,
                              password: true,
                              valid: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter a Password';
                                }
                                if (value.length <= 5) {
                                  return 'Password is too short!';
                                }
                                return '';
                              },
                            ),

                            /// =================== Confirm Password ===================
                            SizedBox(height: 17.h),
                            TextFieldModel(
                                svg: passwordIcon,
                                hint: "Conform Password",
                                height: 20.h,
                                width: 16.w,
                                password: false),
                          ],
                        ),
                      ),

                      /// =================== SignUp Button ===================
                      SizedBox(height: 27.h),
                      InkWell(
                        onTap: () async {
                          LocalStorageServices.box.write(
                              'UserName ', signupController.userController.text);
                          showLoader(context);
                          await signupController
                              .signupControl(
                                  context: context,
                                  emailController:
                                      signupController.emailController.text,
                                  passwordController:
                                      signupController.passwordController.text,
                                  userController:
                                      signupController.userController.text,
                                  type: 'Normal')
                              .then((value) {
                                hideLoader(context);
                            if (value != null) {
                              if (value.relaxMeditation?.first.success == '1') {
                                snackBar(
                                    title: 'successful',
                                    message: value.relaxMeditation?[0].msg,
                                    backgroundColor:
                                        Colors.greenAccent.withOpacity(0.5));
                                Get.to(() => SignInScreen());
                              } else {
                                snackBar(
                                    title: 'Error',
                                    message: value.relaxMeditation?[0].msg,
                                    backgroundColor: Colors.red.withOpacity(0.5));
                              }
                            } else {
                              snackBar(
                                  title: 'Something went Wrong',
                                  message: 'Please Try again',
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(0.5));
                            }
                          });
                        },
                        child: ButtonPage(title: S.of(context).signUpButton),
                      ),

                      /// =================== OR ===================
                      SizedBox(height: 27.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Divider(
                            color: Constant.whiteColor,
                            thickness: 2,
                            endIndent: 5,
                          )),
                          Text('OR',
                              style: TextStyle(color: Constant.whiteColor)),
                          Flexible(
                              child: Divider(
                            color: Constant.whiteColor,
                            thickness: 2,
                            indent: 5,
                          )),
                        ],
                      ),

                      /*/// =================== Continue With Facebook ===================
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        width: 320.w,
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

                      /// =================== Continue With Google ===================
                      SizedBox(height: 20.h),
                      if (isGoogle.value == true)
                        InkWell(
                          onTap: () {
                            showLoader(context);
                            Authentication().googleSignIn().then((value) async {
                              showLoader(context);
                              await AuthenticationServices()
                                  .userGoogleRegistration(
                                      email: value!.user!.email!,
                                      image: value.user!.photoURL!,
                                      name: value.user!.displayName!,
                                      password: '',
                                      phone: '',
                                      authId: value.user!.uid)
                                  .then(
                                (value) async {
                                  hideLoader(context);
                                  if (value != null) {
                                    ToastService()
                                        .toast(value.relaxMeditation[0].msg);
                                    await LocalStorageServices.box.write(
                                        'login',
                                        value.relaxMeditation[0].userId
                                            .toString());
                                    localStorageUserId =
                                        await LocalStorageServices.box
                                            .read('login');
                                  }
                                },
                              );
                              hideLoader(context);
                              ToastService().toast('You are registered now.');
                              Get.offAll(() => BottomNavigator(tab: 0));
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            width: 320.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SvgPicture.asset(googleImage,
                                    height: 20.h, width: 20.w),
                                SizedBox(width: 10),
                                Text(S.of(context).continueWithGoogle,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),

                      /// =================== Have An Account ===================
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: () => Get.to(SignInScreen()),
                        child: RichText(
                          text: TextSpan(
                            text: "Have an account?",
                            style: TextStyle(
                                fontSize: 16.sp, color: Constant.whiteColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " Log in",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      decoration: TextDecoration.underline,
                                      color: Constant.whiteColor)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }

  snackBar({String? title, String? message, Color? backgroundColor}) {
    return Get.snackbar(title ?? '', message ?? '',
        backgroundColor: backgroundColor,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        animationDuration: Duration(seconds: 1));
  }
}
