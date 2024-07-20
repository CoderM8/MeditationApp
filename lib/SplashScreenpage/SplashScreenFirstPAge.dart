import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constant/constant.dart';
import '../views/utils/textwidget.dart';
import 'Loginpage.dart';

class SplashScreenFirstpage extends StatefulWidget {
  //const SplashScreenFirstpage({Key? key}) : super(key: key);

  @override
  _SplashScreenFirstpageState createState() => _SplashScreenFirstpageState();
}

class _SplashScreenFirstpageState extends State<SplashScreenFirstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: Image.asset(
                    "assets/images/Login.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 155.h,
                  ),
                  Center(
                      child: Styles.regular(
                    "Meditation",
                    ff: 'regular',
                    fs: 50.sp,
                    c: Colors.white,
                  )),
                  SizedBox(
                    height: 206.h,
                  ),
                  Container(
                    child: Center(
                        child: Styles.regular("Creat your account",
                            c: Colors.white, fs: 20.sp)),
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  TextFieldPage(
                    svg: "assets/icons/Vector.svg",
                    width: 20.w,
                    height: 16.h,
                    hint: "Sign up with Email",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldPage(
                    svg: "assets/icons/Group 47.svg",
                    hint: "Continue with facebook",
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldPage(
                    svg: "assets/icons/Group 50.svg",
                    hint: "Continue with Google",
                    width: 19.99.w,
                    height: 20.4.h,
                  ),
                  SizedBox(
                    height: 52.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.to(
                        Loginpage(),
                      ),
                      child: Styles.regular(
                        "Have an account ? Log in",
                        fs: 16.sp,
                        c: Constant.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                    child: Styles.regular(
                        "By using meditation you gree to our Terms",
                        fs: 12.sp,
                        c: Constant.whiteColor),
                  ),
                  // SizedBox(
                  //   height: 40.h,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
