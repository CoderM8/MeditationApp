// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/Music_model/all_song_model.dart' as all_song;
import 'package:meditation/model/Music_model/cat_list_id_model.dart';
import 'package:meditation/model/Music_model/relaxing_sound_music_model.dart'
    as relaxing_sound;
import 'package:meditation/model/home_model/cat_list_model.dart';
import 'package:meditation/views/screens/Breath_Screen/Breath.dart';
import 'package:meditation/views/screens/Relaxingsound_Screen/Relaxing_sounds_screen.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../Controller/controller_constant.dart';
import '../../../generated/l10n.dart';
import '../../../services/admobads.dart';
import '../Relaxingsound_Screen/Relaxing_sound_screen2.dart';

class MusicPage extends StatefulWidget {
  MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  void onRefresh() async {
    // monitor network fetch
    kHomeController.relaxingSoundMusicApi();
    kHomeController.categoryService();
    kAllSongController.allSongModelApi();
    kAllSongController.categoryidservice(9);
    await Future.delayed(Duration(milliseconds: 600));
  }

  @override
  void initState() {
    kHomeController.relaxingSoundMusicApi();
    kHomeController.categoryService();
    kAllSongController.categoryidservice(9);
    kAllSongController.allSongModelApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,

        /// =================== Background Image ===================
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Home Screen.jpg'),
              fit: BoxFit.cover),
        ),
        // child: SmartRefresher(
        //   enablePullDown: true,
        //   enablePullUp: true,
        //   header: WaterDropHeader(),
        //   footer: CustomFooter(
        //     builder: (BuildContext? context, LoadStatus? mode) {
        //       return Container(
        //         height: 55.0,
        //         child: Center(),
        //       );
        //     },
        //   ),
        //   controller: _refreshController,
        //   onRefresh: _onRefresh,
        //   child: ,
        // ),
        child: RefreshIndicator(
          onRefresh: () async {
            onRefresh();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// =================== Relaxing Sound ===================
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 100.w),
                  child: Styles.regular(S.of(context).relaxingSound,
                      fw: FontWeight.bold, fs: 20.sp, c: Constant.whiteColor),
                ),

                /// =================== Circle Listview ===================
                SizedBox(height: 28.h),
                Container(
                  height: 100.h,
                  width: 431.w,
                  child: StreamBuilder<List<relaxing_sound.RelaxMeditation?>>(
                    stream: kHomeController.relaxingSoundMusicList.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          itemCount:
                              kHomeController.relaxingSoundMusicList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return index == 0
                                ?

                                /// =================== breath ===================
                                GestureDetector(
                                    onTap: () {
                                      Get.to(() => Breath());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0.sp),
                                      child: Container(
                                          height: 90.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF04313A),
                                              boxShadow: List.generate(
                                                  3,
                                                  (index) => BoxShadow(
                                                      blurRadius: 3,
                                                      color: Colors.white)),
                                              shape: BoxShape.circle),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/breath.svg',
                                                  height: 25.h,
                                                  width: 25.w),
                                              Text(
                                                S.of(context).breath,
                                                style: TextStyle(
                                                    color: Constant.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )),
                                    ),
                                  )
                                : kHomeController
                                            .relaxingSoundMusicList.length ==
                                        index + 1
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.h, top: 10.h),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => RelaxingSound(),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 85.h,
                                                width: 85.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: Center(
                                                  /// =================== More ===================
                                                  child: Text(
                                                    'More',
                                                    style: TextStyle(
                                                        color: Constant
                                                            .whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          showModalBottomSheet(
                                            backgroundColor: Color(0xFF002D38),
                                            shape: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30)),
                                                borderSide: BorderSide.none),
                                            context: context,
                                            builder: (context) {
                                              return RelaxingSoundSecond(
                                                songUrl: kHomeController
                                                        .relaxingSoundMusicList[
                                                            index - 1]
                                                        ?.relaxsoundUrl ??
                                                    '',
                                                imageUrl: kHomeController
                                                        .relaxingSoundMusicList[
                                                            index - 1]
                                                        ?.relaxsoundImage ??
                                                    '',
                                              );
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10.h),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: 85.h,
                                                width: 85.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,

                                                  /// =================== Image ===================
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: CachedNetworkImageProvider(
                                                        maxHeight: 500,
                                                        maxWidth: 500,
                                                        kHomeController
                                                                .relaxingSoundMusicList[
                                                                    index - 1]
                                                                ?.relaxsoundImage ??
                                                            ''),
                                                  ),
                                                ),
                                              ),

                                              /// =================== Text ===================
                                              Text(
                                                kHomeController
                                                        .relaxingSoundMusicList[
                                                            index - 1]
                                                        ?.relaxsoundName
                                                        .substring(
                                                            0,
                                                            (kHomeController
                                                                            .relaxingSoundMusicList[index -
                                                                                1]
                                                                            ?.relaxsoundName
                                                                            .length ??
                                                                        0) >
                                                                    12
                                                                ? 12
                                                                : kHomeController
                                                                    .relaxingSoundMusicList[
                                                                        index -
                                                                            1]
                                                                    ?.relaxsoundName
                                                                    .length) ??
                                                    '',
                                                style: TextStyle(
                                                    color: Constant.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                            // GestureDetector(
                            //   onTap: () {
                            //               showModalBottomSheet(
                            //                 backgroundColor: Color(0xFF002D38),
                            //                 shape: OutlineInputBorder(
                            //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                            //                     borderSide: BorderSide.none),
                            //                 context: context,
                            //                 builder: (context) {
                            //                   return RelaxingSoundSecond(
                            //                     songUrl: kHomeController.relaxingSoundMusicList[index]?.relaxsoundUrl ?? '',
                            //                     imageUrl: kHomeController.relaxingSoundMusicList[index]?.relaxsoundImage ?? '',
                            //                   );
                            //                 },
                            //               );
                            //             },
                            //   child: Padding(
                            //           padding: EdgeInsets.only(right: 10.h),
                            //           child: Stack(
                            //             alignment: Alignment.center,
                            //             children: <Widget>[
                            //               Container(
                            //                 height: 85.h,
                            //                 width: 85.w,
                            //                 decoration: BoxDecoration(
                            //                   shape: BoxShape.circle,
                            //
                            //                   /// =================== Image ===================
                            //                   image: DecorationImage(
                            //                     fit: BoxFit.fill,
                            //                     image: CachedNetworkImageProvider(kHomeController.relaxingSoundMusicList[index]?.relaxsoundImage??''),
                            //                   ),
                            //                 ),
                            //               ),
                            //
                            //               /// =================== Text ===================
                            //               Text(
                            //                 kHomeController.relaxingSoundMusicList[index]?.relaxsoundName.substring(
                            //                     0,
                            //                     (kHomeController.relaxingSoundMusicList[index]?.relaxsoundName.length??0) > 12
                            //                         ? 12
                            //                         : kHomeController.relaxingSoundMusicList[index]?.relaxsoundName.length)??'',
                            //                 style: TextStyle(color: Constant.whiteColor, fontWeight: FontWeight.bold, fontSize: 12.sp),
                            //               ),
                            //             ],
                            //           ),
                            //             ),
                            // )
                            //         : SizedBox();
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
                Center(child: admobads().bannerads()),
                SizedBox(height: 10.0.h),
                // Container(
                //   height: 100.h,
                //   width: 431.w,
                //   child: StreamBuilder<List<relaxing_sound.RelaxMeditation?>>(
                //     stream: kHomeController.relaxingSoundMusicList.stream,
                //     builder: (context, snapshot) {
                //       return ListView.builder(
                //         itemCount: kHomeController.relaxingSoundMusicList.length,
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //           return index % 2 == 0
                //               ? index == 10
                //               ? Padding(
                //             padding: EdgeInsets.only(right: 10.h, top: 10.h),
                //             child: InkWell(
                //               onTap: () {
                //                 Get.to(
                //                       () => RelaxingSound(),
                //                 );
                //               },
                //               child: Column(
                //                 children: [
                //                   Container(
                //                     height: 85.h,
                //                     width: 85.w,
                //                     decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                //                     child: Center(
                //                       /// =================== More ===================
                //                       child: Text(
                //                         'More',
                //                         style: TextStyle(color: Constant.whiteColor),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           )
                //               : InkWell(
                //             highlightColor: Colors.transparent,
                //             splashColor: Colors.transparent,
                //             onTap: () {
                //               showModalBottomSheet(
                //                 backgroundColor: Color(0xFF002D38),
                //                 shape: OutlineInputBorder(
                //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                //                     borderSide: BorderSide.none),
                //                 context: context,
                //                 builder: (context) {
                //                   return RelaxingSoundSecond(
                //                     songUrl: kHomeController.relaxingSoundMusicList[index]?.relaxsoundUrl ?? '',
                //                     imageUrl: kHomeController.relaxingSoundMusicList[index]?.relaxsoundImage ?? '',
                //                   );
                //                 },
                //               );
                //             },
                //             child: Padding(
                //               padding: EdgeInsets.only(right: 10.h),
                //               child: Stack(
                //                 alignment: Alignment.center,
                //                 children: <Widget>[
                //                   Container(
                //                     height: 85.h,
                //                     width: 85.w,
                //                     decoration: BoxDecoration(
                //                       shape: BoxShape.circle,
                //
                //                       /// =================== Image ===================
                //                       image: DecorationImage(
                //                         fit: BoxFit.fill,
                //                         image: CachedNetworkImageProvider(kHomeController.relaxingSoundMusicList[index]?.relaxsoundImage??''),
                //                       ),
                //                     ),
                //                   ),
                //
                //                   /// =================== Text ===================
                //                   Text(
                //                     kHomeController.relaxingSoundMusicList[index]?.relaxsoundName.substring(
                //                         0,
                //                         (kHomeController.relaxingSoundMusicList[index]?.relaxsoundName.length??0) > 12
                //                             ? 12
                //                             : kHomeController.relaxingSoundMusicList[index]?.relaxsoundName.length)??'',
                //                     style: TextStyle(color: Constant.whiteColor, fontWeight: FontWeight.bold, fontSize: 12.sp),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           )
                //               : SizedBox();
                //         },
                //       );
                //     },
                //   ),
                // ),

                /// =================== Music ===================
                SizedBox(height: 10.h),
                Container(
                  child: Text(
                    S.of(context).music,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Constant.whiteColor),
                  ),
                ),
                SizedBox(height: 11.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          kAllSongController.isForYou.value = true;
                          // if (kAllSongController.allSongModel.value.relaxMeditation?.isEmpty) {
                          kAllSongController.allSongModelApi();
                          // }
                        },
                        child: Obx(
                          () {
                            return Container(
                              height: 39.h,
                              width: 125.54.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Constant.whiteColor, width: 1.w),
                                  color:
                                      kAllSongController.isForYou.value == true
                                          ? Constant.whiteColor
                                          : Colors.transparent),
                              child: Center(
                                  child:

                                      /// =================== For You ===================
                                      Text(
                                "For You",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: kAllSongController.isForYou.value ==
                                            true
                                        ? Constant.alertDialogColor
                                        : Constant.whiteColor,
                                    fontWeight: FontWeight.bold),
                              )),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        height: 45.h,
                        child: StreamBuilder<CatListModel?>(
                          stream: kHomeController.catListModel.stream,
                          builder: (context, snapshot2) {
                            if (snapshot2.hasData ||
                                snapshot2.connectionState ==
                                    ConnectionState.done) {
                              return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    snapshot2.data?.relaxMeditation.length,
                                itemBuilder: (BuildContext context, index) {
                                  return InkWell(
                                    onTap: () {
                                      kAllSongController.isForYou.value = false;
                                      kAllSongController.catIndex.value = index;
                                      kAllSongController.categoryidservice(
                                          snapshot2.data?.relaxMeditation[index]
                                              .cid);
                                      print(
                                          'hello cat id ========== ${kAllSongController.idCat.value}');
                                      print(
                                          'check condition ======= ${kAllSongController.catIndex.value == index && kAllSongController.isForYou.value == true}');
                                    },
                                    child: Obx(
                                      () {
                                        return Container(
                                          margin: EdgeInsets.only(right: 15.w),
                                          decoration: BoxDecoration(
                                            color: kAllSongController
                                                            .catIndex.value ==
                                                        index &&
                                                    kAllSongController
                                                            .isForYou.value ==
                                                        false
                                                ? Constant.whiteColor
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: Constant.whiteColor,
                                                width: 1.w),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Obx(
                                                () {
                                                  /// =================== Category Name ===================
                                                  return Text(
                                                    snapshot2
                                                            .data
                                                            ?.relaxMeditation[
                                                                index]
                                                            .categoryName ??
                                                        '',
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: kAllSongController
                                                                        .catIndex
                                                                        .value ==
                                                                    index &&
                                                                kAllSongController
                                                                        .isForYou
                                                                        .value ==
                                                                    false
                                                            ? Constant
                                                                .alertDialogColor
                                                            : Constant
                                                                .whiteColor),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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
                  ),
                ),
                SizedBox(height: 11.h),
                StreamBuilder<bool>(
                    stream: kAllSongController.isForYou.stream,
                    builder: (context, s) {
                      return kAllSongController.isForYou.value == true
                          ? StreamBuilder<List<all_song.RelaxMeditation?>>(
                              stream:
                                  kAllSongController.allSongModelList.stream,
                              builder: (context, snapshot) {
                                return GridView.extent(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsetsDirectional.zero,
                                    shrinkWrap: true,
                                    maxCrossAxisExtent: 200.w,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 10.w,
                                    childAspectRatio: 180.h / 200.w,
                                    children: List.generate(
                                        kAllSongController
                                            .allSongModelList.length,
                                        (index) => Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      showLoader(context);
                                                      songListModel.clear();
                                                      for (int i = 0;
                                                          i <
                                                              (kAllSongController
                                                                  .allSongModelList
                                                                  .length);
                                                          i++) {
                                                        songListModel
                                                            .add(SongListModel(
                                                          id: kAllSongController
                                                                  .allSongModelList[
                                                                      i]
                                                                  ?.id
                                                                  .toString() ??
                                                              '',
                                                          image: kAllSongController
                                                                  .allSongModelList[
                                                                      i]
                                                                  ?.categoryImage
                                                                  .toString() ??
                                                              '',
                                                          title: kAllSongController
                                                                  .allSongModelList[
                                                                      i]
                                                                  ?.mp3Title
                                                                  .toString() ??
                                                              '',
                                                          url: kAllSongController
                                                                  .allSongModelList[
                                                                      i]
                                                                  ?.mp3Url
                                                                  .toString() ??
                                                              '',
                                                        ));
                                                      }
                                                      await selectSong(
                                                              index: index)
                                                          .whenComplete(() =>
                                                              hideLoader(
                                                                  context));
                                                      Get.to(
                                                        () => SongScreen(
                                                          categoryName:
                                                              kAllSongController
                                                                      .allSongModelList[
                                                                          index]
                                                                      ?.categoryName ??
                                                                  '',
                                                          id: kAllSongController
                                                                  .allSongModelList[
                                                                      index]
                                                                  ?.id
                                                                  .toString() ??
                                                              '',
                                                        ),
                                                        transition:
                                                            Transition.native,
                                                      );
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 150.18.h,
                                                          width: 150.18.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                            color: Constant
                                                                .kTransparent,

                                                            /// =================== Image ===================
                                                            image: DecorationImage(
                                                                filterQuality:
                                                                    FilterQuality
                                                                        .low,
                                                                image: CachedNetworkImageProvider(
                                                                    maxHeight:
                                                                        500,
                                                                    maxWidth:
                                                                        500,
                                                                    kAllSongController
                                                                            .allSongModelList[
                                                                                index]
                                                                            ?.categoryImage
                                                                            .toString() ??
                                                                        ''),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          kAllSongController
                                                                  .allSongModelList[
                                                                      index]
                                                                  ?.categoryName
                                                                  .toString() ??
                                                              "",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Constant
                                                                  .whiteColor),
                                                        ),

                                                        /// =================== Subtitle ===================
                                                        SizedBox(height: 3.h),
                                                        Text(
                                                          kAllSongController
                                                                  .allSongModelList[
                                                                      index]
                                                                  ?.mp3Title
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0XFF7F969B)),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  /// =================== Title ===================
                                                ],
                                              ),
                                            )));
                              })
                          : StreamBuilder<CatListIdModel?>(
                              stream: kAllSongController
                                  .categoryidserviceModel.stream,
                              builder: (context, snap) {
                                if (snap.hasData ||
                                    snap.connectionState ==
                                        ConnectionState.done) {
                                  return GridView.extent(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsetsDirectional.zero,
                                    shrinkWrap: true,
                                    maxCrossAxisExtent: 200.w,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 10.w,
                                    childAspectRatio: 170.h / 200.w,
                                    children: List.generate(
                                        snap.data?.relaxMeditation?.length ?? 0,
                                        (index) => Padding(
                                              padding: EdgeInsets.only(
                                                  right: 5.0.w, top: 5.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      showLoader(context);
                                                      songListModel.clear();
                                                      for (int i = 0;
                                                          i <
                                                              (snap
                                                                      .data
                                                                      ?.relaxMeditation
                                                                      ?.length ??
                                                                  0);
                                                          i++) {
                                                        songListModel.add(
                                                          SongListModel(
                                                              id: snap
                                                                      .data
                                                                      ?.relaxMeditation?[
                                                                          i]
                                                                      .id
                                                                      .toString() ??
                                                                  '',
                                                              image: snap
                                                                      .data
                                                                      ?.relaxMeditation?[
                                                                          i]
                                                                      .mp3Image
                                                                      .toString() ??
                                                                  '',
                                                              title: snap
                                                                      .data
                                                                      ?.relaxMeditation?[
                                                                          i]
                                                                      .mp3Title
                                                                      .toString() ??
                                                                  '',
                                                              url: snap
                                                                      .data
                                                                      ?.relaxMeditation?[
                                                                          i]
                                                                      .mp3Url
                                                                      .toString() ??
                                                                  ''),
                                                        );
                                                      }
                                                      await selectSong(
                                                              index: index)
                                                          .whenComplete(() =>
                                                              hideLoader(
                                                                  context));
                                                      Get.to(
                                                        () => SongScreen(
                                                          categoryName: snap
                                                                  .data
                                                                  ?.relaxMeditation?[
                                                                      index]
                                                                  .categoryName ??
                                                              '',
                                                          id: snap
                                                                  .data
                                                                  ?.relaxMeditation?[
                                                                      index]
                                                                  .id
                                                                  .toString() ??
                                                              '',
                                                        ),
                                                        transition:
                                                            Transition.native,
                                                      );
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 168.18.h,
                                                          width: 164.18.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                            color: Constant
                                                                .kTransparent,

                                                            /// =================== Image ===================
                                                            image: DecorationImage(
                                                                filterQuality:
                                                                    FilterQuality
                                                                        .low,
                                                                image: CachedNetworkImageProvider(
                                                                    maxHeight:
                                                                        500,
                                                                    maxWidth:
                                                                        500,
                                                                    snap
                                                                            .data
                                                                            ?.relaxMeditation?[
                                                                                index]
                                                                            .mp3Image
                                                                            .toString() ??
                                                                        ''),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          snap
                                                                  .data
                                                                  ?.relaxMeditation?[
                                                                      index]
                                                                  .categoryName
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              color: Constant
                                                                  .whiteColor),
                                                        ),

                                                        /// =================== Subtitle ===================
                                                        SizedBox(height: 3.h),
                                                        Text(
                                                          snap
                                                                  .data
                                                                  ?.relaxMeditation?[
                                                                      index]
                                                                  .mp3Title
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: Color(
                                                                  0XFF7F969B)),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  /// =================== Title ===================
                                                ],
                                              ),
                                            )),
                                  );
                                } else {
                                  return Center(
                                    child: Lottie.network(
                                        "https://assets8.lottiefiles.com/packages/lf20_WjWoQM.json"),
                                  );
                                }
                              },
                            );
                    }),
                SizedBox(height: 55.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
