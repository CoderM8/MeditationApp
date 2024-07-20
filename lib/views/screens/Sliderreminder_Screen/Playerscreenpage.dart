import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';

class PlayerScreenPage extends StatefulWidget {
  PlayerScreenPage({Key? key}) : super(key: key);

  @override
  State<PlayerScreenPage> createState() => _PlayerScreenPageState();
}

class _PlayerScreenPageState extends State<PlayerScreenPage> {
  double _currentSliderValue = 20;
  Duration position = new Duration();
  Duration musicLength = new Duration();
  RxBool playButton = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: Image.asset("assets/images/Playerscreenforreminder.jpg",
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                            // Navigator.of(context, rootNavigator: true).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return BottomNavigator();
                            //     },
                            //   ),
                            // );
                          },
                          child: SvgPicture.asset(
                              'assets/icons/close'
                              '.svg',
                              height: 22.h,
                              width: 22.w),
                        ),
                        SizedBox(width: 105.w),
                        Text(
                          "DAY 1",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 101.w),
                        SvgPicture.asset('assets/icons/share.svg',
                            height: 26.h, width: 26.w),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.0.w, top: 86.h, right: 30.w),
                    child: Column(
                      children: [
                        Text(
                          "LONELY",
                          style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Before you start",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                        SizedBox(height: 172.h),
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
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w,
                                                right: 12.w,
                                                top: 12.h,
                                                bottom: 12.h),
                                            child: InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                  'assets/icons/backward.svg'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 27.w),
                                      InkWell(
                                        onTap: () {
                                          playButton.value = !playButton.value;
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
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
                                            ),
                                            StreamBuilder(
                                                stream: playButton.stream,
                                                builder: (context, snapshot) {
                                                  return playButton.value
                                                      ? SvgPicture.asset(
                                                          'assets/icons/pause.svg')
                                                      : Icon(Icons.play_arrow,
                                                          size: 50.0);
                                                }),
                                          ],
                                        ),
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
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w,
                                                right: 12.w,
                                                top: 12.h,
                                                bottom: 12.h),
                                            child: InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                  'assets/icons/forward.svg'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 170.h),
                                Container(
                                  height: 3.h,
                                  width: 323.w,
                                  child: Slider(
                                    autofocus: true,
                                    value: _currentSliderValue,
                                    min: 0,
                                    max: 100,
                                    divisions: 5,
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(
                                        () {
                                          _currentSliderValue = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  width: 323.0.w,
                                  height: 8.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                BorderRadius.circular(20.r),
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
                                                        width: 25.w),
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
                                    SizedBox(width: 70.w),
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
                                                  'assets/icons/EllipseBLACK.png'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.h.w),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: SvgPicture.asset(
                                                    'assets/images/Vectordownlod.svg'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15.w),
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
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.h.w),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: SvgPicture.asset(
                                                    'assets/icons/heart'
                                                    '.svg'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
