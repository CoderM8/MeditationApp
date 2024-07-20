import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meditation/views/screens/Dailymeditation_PlayScreen/Dailymeditationplaypage.dart';

class DailyMeditationChoose extends StatelessWidget {
  const DailyMeditationChoose({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0.w),
                    child: Row(
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
                  ),
                  SizedBox(height: 204.h),
                  Container(
                    child: Text(
                      "Choose duration",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.0.w, top: 8.h, right: 60.w),
                    child: Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 59.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white10,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/icons/Rectanglechoose.png'),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 7.0.w, top: 7.h),
                                  child: Container(
                                    height: 45.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white10,
                                      // shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/icons/Rectangle 49.png'),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0.h.w),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(DailyMeditationPlayPage());
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/watch.svg',
                                                height: 14.h,
                                                width: 14.w),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0.w),
                                              child: Text(
                                                "8 minutes",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Padding(
                                  padding: EdgeInsets.only(top: 7.h),
                                  child: Container(
                                    height: 45.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white10,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/icons/Rectangle 49.png'),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0.h.w),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(DailyMeditationPlayPage());
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/watch.svg',
                                                height: 14.h,
                                                width: 14.w),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0.h.w),
                                              child: Text(
                                                "10 minutes",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 41.h),
                  Column(
                    children: [
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
                        "hello",
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
