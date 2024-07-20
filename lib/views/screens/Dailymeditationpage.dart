import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Dailymeditationchoosepage.dart';

class Dailymeditationpage extends StatelessWidget {
  final String? categoryImage;
  final String? categoryName;
  final String? mp3Description;
  final String? mp3Url;
  final bool? isFavourite;
  final String? mp3Title;
  final String? id;

  Dailymeditationpage(
      {Key? key,
      this.categoryImage,
      this.categoryName,
      this.isFavourite,
      this.mp3Description,
      this.mp3Url,
      this.mp3Title,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
                child: CachedNetworkImage(
              memCacheHeight: 500,
              imageUrl: categoryImage ?? '',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            )),
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
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 168, right: 30),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Dailymeditationchoose(
                                  mp3Url: mp3Url,
                                  mp3Description: mp3Description,
                                  isFavourite: isFavourite,
                                  categoryName: categoryName,
                                  categoryImage: categoryImage,
                                  id: id,
                                  mp3Title: mp3Title,
                                ));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                height: 90.h,
                                width: 90.w,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.5),
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                  ),
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/Vectorpay.svg',
                                // height: 26.h,
                                // width: 26.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0.w, left: 20.0.w),
                    child: Column(
                      children: [
                        Text(
                          "8 minutes - 10 minutes",
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                        SizedBox(height: 38.h),
                        Text(
                          "Your Daily meditation",
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          categoryName ?? '',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          textAlign: TextAlign.center,
                          mp3Description ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
