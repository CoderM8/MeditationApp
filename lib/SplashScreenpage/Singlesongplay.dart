import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Singlesongplay extends StatefulWidget {
  const Singlesongplay({Key? key}) : super(key: key);

  @override
  State<Singlesongplay> createState() => _SinglesongplayState();
}

class _SinglesongplayState extends State<Singlesongplay> {
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
              child: Image.asset(
                "assets/images/Singlesongplayerscreenplay.jpg",
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
                    padding: const EdgeInsets.only(left: 30.0),
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
                            'assets/icons/Vectorrong.svg',
                            height: 22.h,
                            width: 22.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 39, right: 30),
                    child: Column(
                      children: [
                        Text(
                          "Suggestion meditation",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "LONELY",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 188.h),
                        Stack(
                          children: <Widget>[
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
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
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 12,
                                                top: 12,
                                                bottom: 12),
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
                                                'assets/icons/Group 340.svg',
                                                // height: 26.h,
                                                // width: 26.w,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 27,
                                      ),
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
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30,
                                                right: 31,
                                                top: 26,
                                                bottom: 26),
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
                                                'assets/icons/pause.svg',
                                                // height: 26.h,
                                                // width: 26.w,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 27,
                                      ),
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
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 12,
                                                top: 12,
                                                bottom: 12),
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
                                                'assets/icons/Group 341.svg',
                                                // height: 26.h,
                                                // width: 26.w,
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
                                  height: 3,
                                  width: 323,
                                  child: Slider(
                                    value: _currentSliderValue,
                                    min: 0,
                                    max: 100,
                                    divisions: 5,
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  width: 323.0,
                                  height: 8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                        style: TextStyle(
                                            fontSize: 8.0, color: Colors.white),
                                      ),
                                      SizedBox(width: 270.w),
                                      Text(
                                        "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                        style: TextStyle(
                                            fontSize: 8.0, color: Colors.white),
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
                                          padding: const EdgeInsets.only(
                                              left: 11,
                                              // right: 12,
                                              top: 10,
                                              bottom: 9),
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
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/Vectormusic.svg',
                                                      height: 15.h,
                                                      width: 25.w,
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(
                                                      'Background Sounds',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 110),
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
                                                  'assets/icons/Rectangle2.png'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
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
                                  ],
                                )
                              ],
                            )
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
