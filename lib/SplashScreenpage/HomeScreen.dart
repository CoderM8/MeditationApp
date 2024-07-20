import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:glass_kit/glass_kit.dart';

import '../views/utils/textwidget.dart';

class Homescreen extends StatefulWidget {
  //Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  double _height = 100;
  bool _visible = false;
  bool _visibles = false;
  bool _visiblest = true;
  List<String> reportList = [
    "Anxious",
    "Tired",
    "Peaceful",
    "Sad",
    "Stressed",
    "Ummotivated",
    "Hopeful",
    "Inadequate",
    "Lonely",
    "i’m in pain",
    "Happy",
    "annoyed",
    "Loving",
    "Eating",
  ];

  List<String> morereportList = [
    "On The way",
    "Trying to wake up",
    "Walking",
    "Getting ready to exercise",
    "Eating",
    "Nothing",
    "Learning mindfulness",
    "Trying to sleep",
  ];
  String? selectedReportList;
  bool isReadmore = false;

  final List itemsname = [
    "Breathe",
    "Relaxing Sounds",
    "Check-Ins",
    "Breathe",
    "Relaxing Sounds",
    "Check-Ins",
    "Breathe",
    "Relaxing Sounds",
    "Check-Ins"
  ];
  final List img = [
    'assets/images/Group 161.jpg',
    'assets/images/Home Screen.jpg'
  ];
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  final List ForNow = [
    'assets/images/onboarding1.svg',
    'assets/images/onboarding1.svg',
    'assets/images/onboarding1.svg',
    'assets/images/onboarding1.svg'
  ];
  final List Quick = [
    'assets/images/Rectangle 22.jpg'
        'assets/images/Rectangle 22.jpg'
        'assets/images/Rectangle 22.jpg'
        'assets/images/Rectangle 22.jpg'
        'assets/images/Rectangle 22.jpg'
        'assets/images/Rectangle 22.jpg'
  ];

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
          Column(
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: AnimatedContainer(
                  height: _height,

                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topRight,
                  //     end: Alignment.bottomLeft,
                  //     // stops: [0.1, 0.5, 0.7, 0.9],
                  //     colors: [
                  //       Colors.purple,
                  //       Colors.deepPurple,
                  //     ],
                  //   ),
                  // ),
                  duration: Duration(seconds: 2),
                  child: GlassContainer(
                    color: Colors.transparent,
                    blur: 5,
                    height: Get.height,
                    width: Get.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, right: 27.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Group 64.svg',
                                height: 26.h,
                                width: 26.w,
                              ),
                              SizedBox(
                                width: 75.w,
                              ),
                              Styles.regular(
                                "Meditation",
                                ff: 'regular',
                                fs: 40.sp,
                                c: Colors.white,
                              ),
                              SizedBox(
                                width: 38.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _visibles = false;
                                    _height = _height > 100 ? 100 : 500;
                                    _visible = !_visible;
                                  });
                                },
                                child: SvgPicture.asset(
                                  color: Colors.yellow,
                                  'assets/icons/Group 63.svg',
                                  height: 26.h,
                                  width: 26.w,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset(
                                'assets/icons/Group 65.svg',
                                height: 26.h,
                                width: 26.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Visibility(
                            visible: _visible,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                MultiSelectChip(
                                  reportList,
                                  onSelectionChanged: (selectedList) {
                                    setState(
                                      () {
                                        selectedReportList = selectedList;
                                      },
                                    );
                                  },
                                ),
                                //  Text(selectedReportList.toString()),
                                SizedBox(height: 19.h),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 133, left: 133),
                                      child: Visibility(
                                        visible: _visiblest,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _visiblest = _visible == true
                                                  ? true
                                                  : false;
                                              _visibles =
                                                  _height > 500 ? false : true;
                                              _height =
                                                  _height == 650 ? 500 : 650;
                                            });
                                          },
                                          child: Container(
                                            height: 31.h,
                                            width: 69.w,
                                            //color: Colors.white,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(115),
                                                color: Colors.white),
                                            child: Align(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 11,
                                                    left: 13,
                                                    bottom: 10),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      (isReadmore
                                                          ? 'Read Less'
                                                          : ' More'),
                                                      style: TextStyle(
                                                          fontSize: 10.sp),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Icon(
                                                      Icons.expand_more,
                                                      size: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Visibility(
                            visible: _visibles,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                MultiSelectChip(
                                  morereportList,
                                  onSelectionChanged: (selectedList) {
                                    setState(
                                      () {
                                        selectedReportList = selectedList;
                                      },
                                    );
                                  },
                                ),
                                // Text(selectedReportList.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // AnimatedPadding(
          //     duration: Duration(seconds: 2),
          //     padding: EdgeInsets.only(top: _height)),
          // SizedBox(height: 125.h),

          AnimatedPadding(
            padding: EdgeInsets.only(top: _height),
            duration: Duration(seconds: 2),
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 125.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                            // padding: const EdgeInsets.only(top: 125, left: 20),
                            child: texttitle('Good Morning Vocsy Designer')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 157.h,
                              width: 375.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                      height: 120.h,
                                      // width: 157.w,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/images/onboarding1.svg',
                                          height: 120.h,
                                          width: 157.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 30.h,
                              // width: 500.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: itemsname.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 26,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Image.asset(
                                        'assets/images/Ellipse 6.jpg',
                                        height: 17,
                                        width: 17,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${itemsname[index]}',
                                        style: TextStyle(
                                            fontSize: 8, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 30.h,
                              // width: 500.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: itemsname.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 26,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Image.asset(
                                        'assets/images/Ellipse 6.jpg',
                                        height: 17,
                                        width: 17,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${itemsname[index]}',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Container(
                                width: 490.w, child: texttitle('For Now')),
                            SizedBox(height: 10.h),
                            Container(
                              height: 157.h,
                              // width: 501.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ForNow.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Card(
                                      child: Container(
                                        height: 144.h,
                                        width: 185.w,
                                        child: Center(
                                          child: SvgPicture.asset(
                                            '${ForNow[index]}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              height: 10,
                              //  width: 460,
                              child: Row(
                                children: [
                                  texttitle('Recommended Collection'),
                                  SizedBox(width: 155.w),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.white60),
                                        ),
                                        SizedBox(width: 5.w),
                                        Icon(Icons.arrow_forward_ios,
                                            size: 8, color: Colors.white60),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              height: 103.h,
                              // width: 500.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ForNow.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                      height: 103.h,
                                      width: 157.w,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/Group 108.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              height: 10,
                              // width: 460,
                              child: Row(
                                children: [
                                  texttitle('Quick & Easy'),
                                  SizedBox(width: 216.w),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.white60),
                                        ),
                                        SizedBox(width: 5.w),
                                        Icon(Icons.arrow_forward_ios,
                                            size: 8, color: Colors.white60),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 140.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          child: Container(
                                            height: 113.h,
                                            width: 91.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SvgPicture.asset(
                                                'assets/images/onboarding1.svg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 8.h,
                                              child: Text(
                                                'Train Your Mind',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              height: 10.h,
                                              child: Text(
                                                'WisdomLeBorn James',
                                                style: TextStyle(
                                                    fontSize: 6,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: 134.h,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: ForNow.length,
                            //     itemBuilder: (context, index) {
                            //       return Container(
                            //         height: 134.h,
                            //         width: 91.w,
                            //         child: Card(
                            //           child: Column(
                            //             children: [
                            //               Container(
                            //                 height: 113.h,
                            //                 width: 91.w,
                            //                 decoration: BoxDecoration(
                            //                   borderRadius:
                            //                       BorderRadius.circular(5.r),
                            //                 ),
                            //                 child: SvgPicture.asset(
                            //                   '${ForNow[index]}',
                            //                   fit: BoxFit.cover,
                            //                 ),
                            //               ),
                            //               Container(
                            //                 color: Colors.transparent,
                            //                 height: 8.h,
                            //                 width: 64.w,
                            //                 child: Container(
                            //                   height: 17.h,
                            //                   width: 77.w,
                            //                   child: Text(
                            //                     'Calming Anxiety',
                            //                     style: TextStyle(
                            //                         fontSize: 8,
                            //                         color: Colors.black),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 24.h),
                            Container(
                              height: 10,
                              // width: 460,
                              child: Row(
                                children: [
                                  texttitle('Mental Fitness'),
                                  SizedBox(width: 216.w),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.white60),
                                        ),
                                        SizedBox(width: 5.w),
                                        Icon(Icons.arrow_forward_ios,
                                            size: 8, color: Colors.white60),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 140.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          child: Container(
                                            height: 113.h,
                                            width: 91.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SvgPicture.asset(
                                                  'assets/images/onboarding1.svg',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 8.h,
                                              child: Text(
                                                'Train Your Mind',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              height: 10.h,
                                              child: Text(
                                                'WisdomLeBorn James',
                                                style: TextStyle(
                                                    fontSize: 6,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget texttitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 10),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 1 / 5;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}

class MultiSelectChip extends StatefulWidget {
  MultiSelectChip(this.reportList, {required this.onSelectionChanged});

  final List<String> reportList;
  final Function(String) onSelectionChanged;

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        // color: Colors.transparent,
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          // disabledColor: Colors.transparent,
          // selectedColor: Colors.transparent,
          // backgroundColor: Colors.transparent,
          selectedShadowColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          label: Text(item),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              widget.onSelectionChanged(selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

// CarouselSlider(
//   options: CarouselOptions(
//       height: 200,
//       // autoPlay: true,
//       enlargeCenterPage: true),
//   items: img.map((item) {
//     print("===================aa===========MUJHE MARRO MAT");
//     return Builder(builder: (BuildContext context) {
//       return InkWell(
//         onTap: () {
//           print("===================aa===========MUJHE MARRO MAT");
//         },
//         child: Container(
//           height: 100.h,
//           width: 500.w,
//           color: Colors.blue,
//           margin: EdgeInsets.symmetric(
//               horizontal: 5, vertical: 14),
//           child: Container(
//             height: 157.h,
//             width: 120.w,
//             color: Colors.white,
//           ),
//         ),
//       );
//     });
//   }).toList(),
// ),
