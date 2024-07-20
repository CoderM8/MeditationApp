import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../Controller/bottom_navigator_controller.dart';

class GlassmorphismBottomNavigation extends StatelessWidget {
  const GlassmorphismBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigatorController _bottomNavigatorController =
        Get.put(BottomNavigatorController());
    return GlassmorphicContainer(
      blur: 100,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFFFFF).withOpacity(0.08),
          Color(0xFFFFFFFF).withOpacity(0.08),
        ],
        stops: [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFFFFF).withOpacity(0.05),
          Color((0xFFFFFFFF)).withOpacity(0.05),
        ],
      ),
      border: 1,
      height: 60.h,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      borderRadius: 0.sp,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// =================== Home ===================
          Obx(
            () {
              return InkWell(
                onTap: () {
                  _bottomNavigatorController.index.value = 0;
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/home.png',
                        height: 22.h,
                        color: _bottomNavigatorController.index.value == 0
                            ? Color(0xffFFFFFF)
                            : Color(0x1fFFFFFF),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: _bottomNavigatorController.index.value == 0
                                ? Color(0xffFFFFFF)
                                : Color(0x1fFFFFFF),
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          /// =================== Meditation ===================
          SizedBox(width: 30.w),
          Obx(
            () {
              return InkWell(
                onTap: () {
                  _bottomNavigatorController.index.value = 1;
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/meditation.png',
                        height: 22.h,
                        color: _bottomNavigatorController.index.value == 1
                            ? Color(0xffFFFFFF)
                            : Color(0x1fFFFFFF),
                      ),
                      Text(
                        'Meditation',
                        style: TextStyle(
                            color: _bottomNavigatorController.index.value == 1
                                ? Color(0xffFFFFFF)
                                : Color(0x1fFFFFFF),
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          /// =================== Sleep ===================
          SizedBox(width: 30.w),
          Obx(
            () {
              return InkWell(
                onTap: () {
                  _bottomNavigatorController.index.value = 2;
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/sleep.png',
                        height: 22.h,
                        color: _bottomNavigatorController.index.value == 2
                            ? Color(0xffFFFFFF)
                            : Color(0x1fFFFFFF),
                      ),
                      Text(
                        'Sleep',
                        style: TextStyle(
                            color: _bottomNavigatorController.index.value == 2
                                ? Color(0xffFFFFFF)
                                : Color(0x1fFFFFFF),
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          /// =================== Music ===================
          SizedBox(width: 30.w),
          Obx(
            () {
              return InkWell(
                onTap: () {
                  _bottomNavigatorController.index.value = 3;
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/music.png',
                        height: 22.h,
                        color: _bottomNavigatorController.index.value == 3
                            ? Color(0xffFFFFFF)
                            : Color(0x1fFFFFFF),
                      ),
                      Text(
                        'Music',
                        style: TextStyle(
                            color: _bottomNavigatorController.index.value == 3
                                ? Color(0xffFFFFFF)
                                : Color(0x1fFFFFFF),
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          /// =================== Profile ===================
          SizedBox(width: 30.w),
          Obx(
            () {
              return InkWell(
                onTap: () {
                  _bottomNavigatorController.index.value = 4;
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/profile.png',
                        height: 22.h,
                        color: _bottomNavigatorController.index.value == 4
                            ? Color(0xffFFFFFF)
                            : Color(0x1fFFFFFF),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: _bottomNavigatorController.index.value == 4
                                ? Color(0xffFFFFFF)
                                : Color(0x1fFFFFFF),
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
