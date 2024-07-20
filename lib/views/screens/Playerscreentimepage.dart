import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/constant.dart';

class PlayerScreenTimePage extends StatelessWidget {
  const PlayerScreenTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                  "assets/images/Player screenforremindertime.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 812.h,
            width: 375.w,
            child: Padding(
              padding: EdgeInsets.only(top: 356.0.h, left: 112.w, right: 112.w),
              child: Column(
                children: [
                  Text(
                    "00:30",
                    style: TextStyle(
                        color: Constant.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
