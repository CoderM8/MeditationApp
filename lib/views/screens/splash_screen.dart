import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constant/constant.dart';
import '../utils/textwidget.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => OnboardingScreen());
    });
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 326.h),
            child: Center(
                child: Styles.regular("LOGO", fs: 50.sp, fw: FontWeight.bold)),
          ),
          SizedBox(
            height: 23.h,
          ),
          Center(
            child: Styles.regular("Take a deep Breath",
                fs: 20.sp, c: Constant.titleColor),
          )
        ],
      ),
    );
  }
}
