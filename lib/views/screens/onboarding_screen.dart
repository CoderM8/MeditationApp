import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// import 'package:kinjal/model/constant.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Constant.backgroundcolor,
      body: Column(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/onboarding1.svg',
              height: 233.86.h,
              width: 298.22.w,
            ),
          )
        ],
      ),
    );
  }
}
