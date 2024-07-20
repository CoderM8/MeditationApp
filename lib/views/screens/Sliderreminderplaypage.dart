import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sliderreminderplaypage extends StatefulWidget {
  const Sliderreminderplaypage({Key? key}) : super(key: key);

  @override
  _SliderreminderplaypageState createState() => _SliderreminderplaypageState();
}

class _SliderreminderplaypageState extends State<Sliderreminderplaypage> {
  // double _currentSliderValue = 20;

  Duration position = new Duration();

  Duration musicLength = new Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/images/martin-sanchez-MD6E2Sv__iA-unsplash 1.jpg",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context, rootNavigator: true).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return Dailymeditationchoose();
                            //     },
                            //   ),
                            // );
                          },
                          child: SvgPicture.asset(
                            'assets/images/Vector.svg',
                            height: 13.98.h,
                            width: 24.w,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 226),
                        Stack(
                          children: [
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20), color: Colors.white10,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/Groupreminder.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 10, right: 8),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context, rootNavigator: true).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return bottom_navigatorpage();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/Vectorhart.svg',
                                      // height: 15.h,
                                      // width: 25.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20), color: Colors.white10,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/Groupreminder.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 10, right: 8),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context, rootNavigator: true).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return bottom_navigatorpage();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/Vectorhart.svg',
                                      // height: 15.h,
                                      // width: 25.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Stack(
                          children: [
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20), color: Colors.white10,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/Groupreminder.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 10, right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.of(context, rootNavigator: true).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       return bottom_navigatorpage();
                                  //     },
                                  //   ),
                                  // );
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/Vectorhart.svg',
                                  // height: 15.h,
                                  // width: 25.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20), color: Colors.white10,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/Groupreminder.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 10, right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.of(context, rootNavigator: true).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       return bottom_navigatorpage();
                                  //     },
                                  //   ),
                                  // );
                                },
                                child: SvgPicture.asset(
                                  'assets/images/Vectordownlod.svg',
                                  // height: 15.h,
                                  // width: 25.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
