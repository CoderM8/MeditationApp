import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/controller_constant.dart';
import 'package:meditation/common_text_widget.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/home_model/Quick&easy_model.dart';
import 'package:meditation/model/home_model/quick_easy_id_model.dart'
    as quick_easy_id_model;
import 'package:meditation/views/screens/homepage/see_all_page.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

class SectionWidget extends StatefulWidget {
  SectionWidget({Key? key}) : super(key: key);

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  // final kHomeController kHomeController = Get.put(kHomeController());

  @override
  void initState() {
    kHomeController.quickServices(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuickEasyModel>(
      stream: kHomeController.quickAsyModel.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData ||
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data?.relaxMeditation.length,
            itemBuilder: (context, index) {
              var data = snapshot.data?.relaxMeditation;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: Row(
                      /// =================== Text  & See all ===================
                      children: [
                        CommonTextWidget(
                            title: data?[index].sectionTitle ?? '',
                            textColor: Constant.whiteColor,
                            fontSize: 18.sp),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => SeeAll(
                                id: data?[index].id,
                                appBarTitle: Text(
                                  snapshot.data!.relaxMeditation[index]
                                      .sectionTitle,
                                  style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 16.sp),
                                ),
                                isHomeTab: false,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'See all',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white60),
                              ),
                              SizedBox(width: 5.w),
                              Icon(Icons.arrow_forward_ios,
                                  size: 14.sp, color: Colors.white60),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 220.h,
                    child: FutureBuilder<quick_easy_id_model.QuickEasyIdModel?>(
                      future: kHomeController.getIdQuick(
                          id: snapshot.data?.relaxMeditation[index].id
                                  .toString() ??
                              ''),
                      builder: (context, snapshot1) {
                        if (snapshot1.hasData) {
                          kHomeController.isLike.clear();
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                (snapshot1.data?.relaxMeditation.length ?? 0) <
                                        5
                                    ? snapshot1.data?.relaxMeditation.length
                                    : 4,
                            itemBuilder: (context, index) {
                              kHomeController.isLike.add(false);
                              return InkWell(
                                onTap: () async {
                                  showLoader(context);
                                  songListModel.clear();
                                  for (int i = 0;
                                      i <
                                          (snapshot1.data?.relaxMeditation
                                                  .length ??
                                              0);
                                      i++) {
                                    songListModel.add(
                                      SongListModel(
                                          id: snapshot1
                                                  .data?.relaxMeditation[i].cid
                                                  .toString() ??
                                              '',
                                          image: snapshot1
                                                  .data
                                                  ?.relaxMeditation[i]
                                                  .mp3Image ??
                                              '',
                                          title: snapshot1
                                                  .data
                                                  ?.relaxMeditation[i]
                                                  .mp3Title ??
                                              '',
                                          url: snapshot1.data
                                                  ?.relaxMeditation[i].mp3Url ??
                                              ''),
                                    );
                                  }
                                  await selectSong(index: index)
                                      .whenComplete(() => hideLoader(context));
                                  Get.to(
                                    () => SongScreen(
                                        id: snapshot1.data
                                                ?.relaxMeditation[index].id ??
                                            "",
                                        categoryName: snapshot1
                                                .data
                                                ?.relaxMeditation[index]
                                                .categoryName ??
                                            ''),
                                    transition: Transition.native,
                                  );
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 140.24.w,
                                        height: 160.79.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          /* image: DecorationImage(
                                              image: CachedNetworkImageProvider(snapshot1.data?.relaxMeditation[index].mp3Image??''), fit: BoxFit.cover),*/
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: CachedNetworkImage(
                                            memCacheHeight: 500,
                                            fadeInCurve: Curves.linear,
                                            imageUrl: snapshot1
                                                    .data
                                                    ?.relaxMeditation[index]
                                                    .mp3Image ??
                                                '',
                                            filterQuality: FilterQuality.low,
                                            errorWidget:
                                                (context, url, error) => Center(
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
                                      SizedBox(height: 3.h),
                                      Text(
                                        snapshot1.data?.relaxMeditation[index]
                                                .categoryName ??
                                            '',
                                        style: TextStyle(
                                            color: Constant.whiteColor,
                                            fontSize: 13.sp),
                                      ),
                                      SizedBox(
                                        width: 140.w,
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            text: '◉ ',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Color(0XFF7F969B)),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: snapshot1
                                                      .data
                                                      ?.relaxMeditation[index]
                                                      .mp3Title,
                                                  style: TextStyle(
                                                      color: Color(0XFF7F969B),
                                                      fontSize: 12.sp)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
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
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
