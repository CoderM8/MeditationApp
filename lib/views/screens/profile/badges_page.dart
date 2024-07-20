import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meditation/constant/constant.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lime,
        child: Stack(
          children: [
            Column(
              children: [
                GlassmorphicContainer(
                  height: 60.h,
                  width: 400.w,
                  blur: 70,
                  borderRadius: 0,
                  border: 5,
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFFFFF).withOpacity(0.05),
                      Color((0xFFFFFFFF)).withOpacity(0.05),
                    ],
                  ),
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFFFFF).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20.sp, color: Colors.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Badges',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Constant.titleColor),
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                Container(
                  height: 710.h,
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
                  child: ListView.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      height: 100.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Get.to(BottomSheetBody());
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                size: 25.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: Colors.black, thickness: 3);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
