import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/common_text_widget.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/model/homemodel/home_section_model.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

class ForNowWidget extends StatelessWidget {
  final String? selectedId;

  ForNowWidget({Key? key, this.selectedId}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// =================== For Now ===================
        Container(
          padding: EdgeInsets.only(left: 10.0.w),
          width: 490.w,
          child: CommonTextWidget(
              title: 'For Now',
              textColor: Constant.whiteColor,
              fontSize: 18.sp),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
          height: 175.h,
          child: FutureBuilder<HomeSectionModel?>(
            future: homeController.homeSectionData(id: '2'),
            builder: (context, sectionSnapshot) {
              if (sectionSnapshot.hasData ||
                  sectionSnapshot.connectionState == ConnectionState.done) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: sectionSnapshot.data?.relaxMeditation?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () async {
                            showLoader(context);
                            songListModel.clear();
                            for (int i = 0;
                                i <
                                    (sectionSnapshot
                                            .data?.relaxMeditation?.length ??
                                        0);
                                i++) {
                              songListModel.add(
                                SongListModel(
                                    id: sectionSnapshot
                                            .data?.relaxMeditation?[i].cid
                                            .toString() ??
                                        '',
                                    image: sectionSnapshot.data
                                            ?.relaxMeditation?[i].mp3Image ??
                                        '',
                                    title: sectionSnapshot.data
                                            ?.relaxMeditation?[i].mp3Title ??
                                        '',
                                    url: sectionSnapshot
                                            .data?.relaxMeditation?[i].mp3Url ??
                                        ''),
                              );
                            }
                            await selectSong(index: index)
                                .whenComplete(() => hideLoader(context));
                            Get.to(
                              () => SongScreen(
                                id: sectionSnapshot
                                        .data?.relaxMeditation?[index].id ??
                                    '',
                                categoryName: sectionSnapshot
                                        .data
                                        ?.relaxMeditation?[index]
                                        .categoryName ??
                                    '',
                              ),
                              transition: Transition.native,
                            );
                          },
                          child: Container(
                            height: 170.h,
                            width: 210.63.w,
                            decoration: BoxDecoration(
                              color: Constant.kTransparent,
                              borderRadius: BorderRadius.circular(10.r),

                              /// =================== Network Image ===================
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.low,
                                image: CachedNetworkImageProvider(
                                  maxHeight: 500,
                                  maxWidth: 500,
                                  sectionSnapshot.data?.relaxMeditation?[index]
                                          .mp3Image ??
                                      '',
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                  right: 12.w, left: 12.w, bottom: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  /// =================== Text ===================
                                  Container(
                                    height: 30.h,
                                    width: 127.5.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.sp),
                                        color: Colors.white24),
                                    child: Center(
                                      child: Text(
                                        '${sectionSnapshot.data?.relaxMeditation?[index].categoryName}',
                                        style: TextStyle(
                                            color: Constant.whiteColor,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ),

                                  /// =================== Play Icon ===================
                                  SvgPicture.asset(homePlayIcon,
                                      height: 30.h, width: 30.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10.w);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
