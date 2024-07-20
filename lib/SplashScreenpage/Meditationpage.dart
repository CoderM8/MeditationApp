import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../views/utils/textwidget.dart';

class Meditationpage extends StatelessWidget {
  const Meditationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/images/Home Screen.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(
                          width: 134.w,
                        ),
                        Styles.regular(
                          "Meditation",
                          ff: 'regular',
                          fs: 40.sp,
                          c: Colors.white,
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(
                            'assets/images/Group 158.svg',
                            height: 26.h,
                            width: 26.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27.h),
                    Container(
                      child: texttitle('Learn to meditate'),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 179.h,
                      width: 431.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: Container(
                                    height: 160.h,
                                    width: 137.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/GroupLearn.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      child: Text(
                                        'Train Your Mind',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      child: texttitle('Reduce Stress and Anxiety'),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 179.h,
                      width: 431.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: Container(
                                    height: 160.h,
                                    width: 137.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/GroupReduce.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      child: Text(
                                        'Train Your Mind',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      child: texttitle('Kick Start Your Day'),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 179.h,
                      width: 431.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: Container(
                                    height: 160.h,
                                    width: 137.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/GroupKickStae.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      child: Text(
                                        'Train Your Mind',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget texttitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
