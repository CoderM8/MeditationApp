import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/authentication_constant/authentication_constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/main.dart';
import 'package:meditation/services/authentication_service.dart';
import 'package:meditation/services/local_storage_service.dart';
import 'package:meditation/services/toast_service.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_screen.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';
import 'package:meditation/views/utils/textwidget.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../generated/l10n.dart';
import 'sign_up_screen.dart';

class SignInFirstScreen extends StatefulWidget {
  const SignInFirstScreen({Key? key}) : super(key: key);

  @override
  _SignInFirstScreenState createState() => _SignInFirstScreenState();
}

class _SignInFirstScreenState extends State<SignInFirstScreen> {
  RxBool isGoogle = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h,
        width: 375.w,
        child: Stack(
          children: [
            /// =================== Background Image ===================
            Positioned.fill(
              child: Container(
                child: Image.asset(signInAndSignUpBackImage, fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 100.h),

                /// =================== Meditation ===================
                Center(
                  child: Styles.regular(S.of(context).meditation, ff: 'regular', fs: 50.sp, c: Constant.whiteColor),
                ),

                /// =================== Create Your Account ===================
                SizedBox(height: 190.h),
                TextButton(
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Styles.regular(S.of(context).yourAccount, c: Constant.whiteColor, fs: 20.sp)),

                /// =================== Sign Up with Email ===================
                SizedBox(height: 31.h),
                InkWell(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    width: 300.w,
                    height: 50.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                    child: Row(
                      children: [
                        SvgPicture.asset(emailBlackIcon, height: 20.h, width: 20.w),
                        SizedBox(width: 10),
                        Text(S.of(context).signUpWithEmail, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),

                /*/// =================== Continue with Facebook ===================
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                  ),
                ),*/

                /// =================== Continue with Google ===================
                SizedBox(height: 10.h),
                // if (isGoogle.value == true)
                InkWell(
                  onTap: () {
                    Authentication().googleSignIn().then((value) async {
                      showLoader(context);
                      await AuthenticationServices()
                          .userGoogleRegistration(email: value!.user!.email!, image: value.user!.photoURL!, name: value.user!.displayName!, password: '', phone: '', authId: value.user!.uid)
                          .then(
                        (value) async {
                          if (value != null) {
                            ToastService().toast(value.relaxMeditation[0].msg);
                            await LocalStorageServices().setString(value.relaxMeditation[0].userId.toString(), 'login');
                            localStorageUserId = await LocalStorageServices().box.read('login');
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
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: SignInWithAppleButton(
                          height: 50.h,
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
                                    await LocalStorageServices().box.write('login', value.relaxMeditation[0].userId.toString());
                                    localStorageUserId = await LocalStorageServices().box.read('login');
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

                /// =================== HAve an Account? ===================
                SizedBox(height: 120.h),
                InkWell(
                  onTap: () => Get.to(() => SignInScreen()),
                  child: RichText(
                    text: TextSpan(
                      text: S.of(context).haveAnAccount,
                      style: TextStyle(fontSize: 16.sp, color: Constant.whiteColor),
                      children: <TextSpan>[
                        TextSpan(text: S.of(context).signInText, style: TextStyle(fontSize: 16.sp, decoration: TextDecoration.underline, color: Constant.whiteColor)),
                      ],
                    ),
                  ),
                ),

                /// =================== By Using Meditation... ===================
                SizedBox(height: 25.h),
                Center(
                  child: Styles.regular(S.of(context).byUsingMeditation, fs: 12.sp, c: Constant.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
