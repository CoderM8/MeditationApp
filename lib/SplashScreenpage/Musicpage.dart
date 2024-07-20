import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../views/utils/textwidget.dart';

class Musicpage extends StatelessWidget {
  const Musicpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 111),
                      child: Styles.regular(
                        "Relaxing Sound",
                        fw: FontWeight.bold,
                        fs: 20.sp,
                        c: Colors.white,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Column(
                      children: [
                        Container(
                          height: 75.h,
                          width: 431.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 75.h,
                                          width: 75.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13, right: 13, top: 33),
                                          child: Text(
                                            'Crunchy shore',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 75.h,
                          width: 431.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 75.h,
                                          width: 75.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13, right: 13, top: 33),
                                          child: Text(
                                            'Crunchy shore',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Container(
                      child: Text(
                        "Music",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Container(
                      height: 26.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsname.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          margin: EdgeInsets.only(right: 15),
                          height: 26,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.white60, width: 1),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 9, right: 9),
                            child: Center(
                              child: Text(
                                '${itemsname[index]}',
                                style:
                                    TextStyle(fontSize: 8, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Container(
                      height: 129.h,
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
                                    height: 105.h,
                                    width: 105.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SvgPicture.asset(
                                          'assets/images/onboarding1.svg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 9.h,
                                      child: Text(
                                        'Train Your Mind',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      height: 6.h,
                                      child: Text(
                                        'WisdomLeBorn James',
                                        style: TextStyle(
                                            fontSize: 6, color: Colors.white),
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
                    SizedBox(height: 12.h),
                    Container(
                      height: 129.h,
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
                                    height: 105.h,
                                    width: 105.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SvgPicture.asset(
                                          'assets/images/onboarding1.svg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 9.h,
                                      child: Text(
                                        'Train Your Mind',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      height: 6.h,
                                      child: Text(
                                        'WisdomLeBorn James',
                                        style: TextStyle(
                                            fontSize: 6, color: Colors.white),
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
                    SizedBox(height: 12.h),
                    Container(
                      height: 129.h,
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
                                    height: 105.h,
                                    width: 105.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SvgPicture.asset(
                                          'assets/images/onboarding1.svg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 9.h,
                                      child: Text(
                                        'Train Your Mind',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      height: 6.h,
                                      child: Text(
                                        'WisdomLeBorn James',
                                        style: TextStyle(
                                            fontSize: 6, color: Colors.white),
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
                    SizedBox(height: 12.h),
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
