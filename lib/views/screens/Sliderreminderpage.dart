import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sliderreminderpage extends StatelessWidget {
  const Sliderreminderpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/images/Sliderreminder.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
