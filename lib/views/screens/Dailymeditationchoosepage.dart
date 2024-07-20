import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'Dailymeditationplaypage.dart';

class Dailymeditationchoose extends StatelessWidget {
  final String? categoryImage;
  final String? categoryName;
  final String? mp3Description;
  final String? mp3Url;
  final bool? isFavourite;
  final String? mp3Title;
  final String? id;

  const Dailymeditationchoose(
      {Key? key,
      this.mp3Description,
      this.categoryName,
      this.mp3Url,
      this.isFavourite,
      this.mp3Title,
      this.categoryImage,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: CachedNetworkImage(
              imageUrl: categoryImage ?? '',
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              memCacheHeight: 500,
            ),
          ),
          Column(
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
              SizedBox(
                height: 204,
              ),
              Container(
                child: Text("Choose duration",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  GlassContainer(
                    borderRadius: BorderRadius.circular(30.r),
                    height: 70.h,
                    width: 300.w,
                    borderColor: Colors.transparent,
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.40),
                        Colors.white.withOpacity(0.10)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.39, 1.0],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // songListModel.clear();
                            Get.to(() => Dailymeditationplaypage(
                                  mp3Title: mp3Title,
                                  categoryImage: categoryImage,
                                  time: Duration(minutes: 8),
                                  categoryName: categoryName,
                                  id: id,
                                  isFavourite: isFavourite,
                                  mp3Description: mp3Description,
                                  mp3Url: mp3Url,
                                ));
                          },
                          child: GlassContainer(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(30.r),
                            height: 45.h,
                            width: 130.w,
                            borderColor: Colors.transparent,
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.40),
                                Colors.white.withOpacity(0.10)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderGradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.60),
                                Colors.white.withOpacity(0.10),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.39, 1.0],
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Vectorwhoch.svg',
                                    height: 14,
                                    width: 14,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("8 minutes",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            // songListModel.clear();
                            Get.to(() => Dailymeditationplaypage(
                                  mp3Title: mp3Title,
                                  categoryImage: categoryImage,
                                  time: Duration(minutes: 10),
                                  categoryName: categoryName,
                                  isFavourite: isFavourite,
                                  mp3Description: mp3Description,
                                  id: id,
                                  mp3Url: mp3Url,
                                ));
                          },
                          child: GlassContainer(
                            borderRadius: BorderRadius.circular(30.r),
                            height: 45.h,
                            width: 130.w,
                            borderColor: Colors.transparent,
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.40),
                                Colors.white.withOpacity(0.10)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderGradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.60),
                                Colors.white.withOpacity(0.10),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.39, 1.0],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Vectorwhoch.svg',
                                    height: 14,
                                    width: 14,
                                    // height: 26.h,
                                    // width: 26.w,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("10 minutes",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 41.h),
              Padding(
                padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w),
                child: Column(
                  children: [
                    Text(
                      "Your Daily meditation",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white70),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      categoryName ?? '',
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.center,
                      mp3Description ?? '',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white70),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
