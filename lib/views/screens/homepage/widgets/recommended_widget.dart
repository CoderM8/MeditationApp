import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/common_text_widget.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/homemodel/home_section_model.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

class RecommendedWidget extends StatelessWidget {
  final String? selectedId;

  RecommendedWidget({Key? key, this.selectedId}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          height: 28.h,
          child: Row(
            children: [
              /// =================== Recommended Collection  & See all ===================
              CommonTextWidget(
                  title: 'Recommended Collection',
                  fontSize: 18.sp,
                  textColor: Constant.whiteColor),
              Spacer(),
              // InkWell(
              //   onTap: () {
              //     log('id :: ${selectedId??''}');
              //     Get.to(()=>
              //       SeeAll(
              //         id: selectedId??'',
              //         appBarTitle: Text(
              //           'Recommended Collection',
              //           style: TextStyle(color: Constant.whiteColor, fontSize: 16.sp),
              //         ),
              //       ),
              //     );
              //   },
              //   child: Row(
              //     children: [
              //       Text(
              //         'See all',
              //         style: TextStyle(fontSize: 14.sp, color: Colors.white60),
              //       ),
              //       SizedBox(width: 5.w),
              //       Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.white60),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          height: 230.h,
          width: MediaQuery.sizeOf(context).width,
          child: FutureBuilder<HomeSectionModel?>(
            future: homeController.homeSectionData(id: '3'),
            builder: (context, sectionSnapshot) {
              if (sectionSnapshot.hasData ||
                  sectionSnapshot.connectionState == ConnectionState.done) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: sectionSnapshot.data?.relaxMeditation?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 175.h,
                      width: 180.w,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  showLoader(context);
                                  songListModel.clear();
                                  for (int i = 0;
                                      i <
                                          (sectionSnapshot.data?.relaxMeditation
                                                  ?.length ??
                                              0);
                                      i++) {
                                    songListModel.add(
                                      SongListModel(
                                          id: sectionSnapshot
                                                  .data?.relaxMeditation?[i].cid
                                                  .toString() ??
                                              '',
                                          image: sectionSnapshot
                                                  .data
                                                  ?.relaxMeditation?[i]
                                                  .mp3Image ??
                                              '',
                                          title: sectionSnapshot
                                                  .data
                                                  ?.relaxMeditation?[i]
                                                  .mp3Title ??
                                              '',
                                          url: sectionSnapshot
                                                  .data
                                                  ?.relaxMeditation?[i]
                                                  .mp3Url ??
                                              ''),
                                    );
                                  }
                                  await selectSong(index: index)
                                      .whenComplete(() => hideLoader(context));
                                  Get.to(
                                    () => SongScreen(
                                        id: sectionSnapshot.data
                                                ?.relaxMeditation?[index].id ??
                                            '',
                                        categoryName: sectionSnapshot
                                                .data
                                                ?.relaxMeditation?[index]
                                                .categoryName ??
                                            ''),
                                    transition: Transition.native,
                                  );
                                },
                                child: Container(
                                  width: 180.w,
                                  height: 150.79.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      memCacheHeight: 500,
                                      fadeInCurve: Curves.linear,
                                      imageUrl: sectionSnapshot
                                              .data
                                              ?.relaxMeditation?[index]
                                              .mp3Image ??
                                          '',
                                      filterQuality: FilterQuality.low,
                                      errorWidget: (context, url, error) =>
                                          Center(
                                              child: Icon(
                                        Icons.error,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                  '${sectionSnapshot.data?.relaxMeditation?[index].categoryName}',
                                  style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(height: 3.h),
                              Text(
                                  '${sectionSnapshot.data?.relaxMeditation?[index].mp3Title}',
                                  style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
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
