// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/controller_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/Music_model/relaxing_sound_music_model.dart'
    as relaxing_sound;
import 'package:meditation/views/utils/textwidget.dart';
import 'Relaxing_sound_screen2.dart';

class RelaxingSound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: SvgPicture.asset("assets/icons/breath6.svg",
                    fit: BoxFit.cover),
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset('assets/images/Breath.svg',
                  fit: BoxFit.cover),
            ),
            RefreshIndicator(
              onRefresh: () async {
                kHomeController.relaxingSoundMusicApi();
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h, left: 20.w),
                          child:
                              SvgPicture.asset("assets/icons/backbutton.svg"),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 33.h),
                        child: Styles.regular("Relaxing Sounds",
                            c: Constant.whiteColor, fs: 24.sp),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Styles.regular("Choose your duration",
                          c: Colors.grey, fs: 14.sp),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Expanded(
                    child: StreamBuilder<List<relaxing_sound.RelaxMeditation?>>(
                        stream: kHomeController.relaxingSoundMusicList.stream,
                        builder: (context, snapshot) {
                          return GridView.builder(
                            shrinkWrap: true,
                            itemCount:
                                kHomeController.relaxingSoundMusicList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, childAspectRatio: 0.8),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Color(0xFF002D38),
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        borderSide: BorderSide.none),
                                    context: context,
                                    builder: (context) {
                                      return RelaxingSoundSecond();
                                    },
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  maxHeight: 500,
                                                  maxWidth: 500,
                                                  kHomeController
                                                          .relaxingSoundMusicList[
                                                              index]
                                                          ?.relaxsoundImage ??
                                                      ''),
                                              filterQuality: FilterQuality.low,
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                        kHomeController
                                                .relaxingSoundMusicList[index]
                                                ?.relaxsoundName ??
                                            '',
                                        softWrap: true,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
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
