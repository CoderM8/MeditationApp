import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/views/screens/Dailymeditation_PlayScreen/Dailymeditationchoosepage.dart';

class DailyMeditationPlayPage extends StatefulWidget {
  DailyMeditationPlayPage({Key? key}) : super(key: key);

  @override
  State<DailyMeditationPlayPage> createState() =>
      _DailyMeditationPlayPageState();
}

class _DailyMeditationPlayPageState extends State<DailyMeditationPlayPage> {
  double _currentSliderValue = 20;
  Duration position = new Duration();
  Duration musicLength = new Duration();

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
          Container(
            height: 812.h,
            width: 375.w,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 32.0.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DailyMeditationChoose();
                              },
                            ),
                          );
                        },
                        child: SvgPicture.asset('assets/icons/close.svg',
                            height: 22.h, width: 22.w),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 30.0.w, top: 39.h, right: 30.w),
                  child: Column(
                    children: [
                      Text(
                        "Your Daily meditation",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "BODY SCAN",
                        style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 188.h),
                      Stack(
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30.0.w),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/icons/Group1.png'),
                                            ),
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                  'assets/icons/backward.svg'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 27.w),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 90.h,
                                          width: 90.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/icons/Group1.png'),
                                            ),
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                  'assets/icons/pause.svg'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 27.w),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/icons/Group1.png'),
                                            ),
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                  'assets/icons/forward.svg'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 218.h),
                              Container(
                                height: 3.h,
                                width: 323.w,
                                child: Slider(
                                  value: _currentSliderValue,
                                  min: 0,
                                  max: 100,
                                  divisions: 5,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Container(
                                width: 323.0.w,
                                height: 8.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                      style: TextStyle(
                                          fontSize: 8.0.sp,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 270.w),
                                    Text(
                                      "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                      style: TextStyle(
                                          fontSize: 8.0.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 53.h),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 34.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white10,
                                          // shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/icons/Rectangle2.png'),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 11.w,
                                            // right: 12,
                                            top: 10.h,
                                            bottom: 9.h),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/music.svg',
                                                    height: 15.h,
                                                    width: 25.w,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    'Background Sounds',
                                                    style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 110.w),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 34.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/icons/Group 64.png'),
                                          ),
                                        ),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                              'assets/icons/heart.svg',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
