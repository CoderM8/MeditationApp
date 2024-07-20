// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/Sliderreminder_Screen/Playerscreenpage.dart';

class SliderReminderPlayPage extends StatefulWidget {
  final String? id;
  SliderReminderPlayPage(this.id);
  @override
  _SliderReminderPlayPageState createState() => _SliderReminderPlayPageState();
}

class _SliderReminderPlayPageState extends State<SliderReminderPlayPage> {
  Duration position = new Duration();
  Duration musicLength = new Duration();

  final List lonely = [
    "Before you start",
    "Is meditation for me?",
    "Is there any scientific proof that prove the benefits of meditation.",
    "Before you start",
    "Before you start Sounds",
    "Before you start",
    "Before you start",
    "Before you start",
    "Before you start",
    "Is there any scientific proof that prove the benefits of meditation."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// =================== Background Image ===================
          Container(
            height: 812.h,
            width: 375.w,
            child: Image.asset("assets/images/Playerscreenforreminder.jpg",
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  primary: true,
                  pinned: true,
                  expandedHeight: 254.h,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  collapsedHeight: 1,
                  toolbarHeight: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 30.h),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 30.0.w, right: 20.0.w),
                              child: Row(
                                children: [
                                  // Container(
                                  //   height: 13.98.h,
                                  //   width: 24.w,
                                  //   child: InkWell(
                                  //     onTap: () {
                                  //       Navigator.of(context, rootNavigator: true).push(
                                  //         MaterialPageRoute(
                                  //           builder: (context) {
                                  //             return BottomNavigator();
                                  //           },
                                  //         ),
                                  //       );
                                  //     },
                                  //     child: SvgPicture.asset('assets/images/email_black.svg', height: 13.98.h, width: 24.w, color: Colors.white),
                                  //   ),
                                  // ),
                                  // BackButton(color: Colors.white),
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/backbutton.svg',
                                        height: 35.h,
                                        width: 35.w,
                                      )),
                                  // SizedBox(width: 226.w),
                                  Spacer(),
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Groupreminder.png'),
                                      ),
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            'assets/icons/unfilled_heart.svg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Groupreminder.png'),
                                      ),
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            'assets/images/Vectordownlod.svg'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// =================== Play Button ===================
                        Padding(
                          padding: EdgeInsets.only(left: 149.w, top: 68.h),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PlayerScreenPage();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 78.h,
                              width: 78.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white38),
                              child: Icon(Icons.play_arrow_rounded,
                                  color: Constant.whiteColor, size: 50),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 126.w, top: 158.h, right: 126.w),
                              child: Text(
                                "LONELY",
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 31.w, top: 12.h, right: 30.w),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 35.h),
                        height: 812.h,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff06576A),
                            // border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.r),
                              topRight: Radius.circular(50.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 71.0.h,
                            ),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: lonely.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                          child: Icon(
                                              index == 0 || index == 1
                                                  ? Icons.check
                                                  : Icons.arrow_right_outlined,
                                              color: Colors.black54,
                                              size: 40.sp)),
                                    ),
                                    title: Text(
                                      lonely[index],
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                    trailing: Text(
                                      '2 min',
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 375.w,
                        child: Column(
                          children: [
                            Container(
                              height: 70.h,
                              width: 299.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2.w),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 15.w),
                                  Text(
                                    "11 Sessions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(width: 50.w),
                                  Text("9%"),
                                  // Text(""),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
