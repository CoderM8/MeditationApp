import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meditation/views/screens/Dailymeditation_PlayScreen/Dailymeditationchoosepage.dart';

class DailyMeditationPage extends StatelessWidget {
  const DailyMeditationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset("assets/images/Dailymeditation.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,
                            color: Colors.white, size: 24.sp),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.0.w, top: 168.h, right: 30.w),
                    child: Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Get.to(() => DailyMeditationChoose());
                              },
                              child: Container(
                                height: 90.h,
                                width: 90.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/icons/Groupdeliy.png'),
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/play.svg',
                                      height: 40.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    children: [
                      Text(
                        "8 minutes - 10 minutes",
                        style:
                            TextStyle(fontSize: 18.sp, color: Colors.white70),
                      ),
                      SizedBox(height: 38.h),
                      Text(
                        "Your Daily meditation",
                        style:
                            TextStyle(fontSize: 20.sp, color: Colors.white70),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "BODY SCAN",
                        style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Hello",
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
