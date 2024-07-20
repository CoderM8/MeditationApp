import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/model/Sleep/SleepHomeSectionIdModel.dart';
import 'package:meditation/model/Sleep/get_feeling_model.dart' as get_feeling;
import 'package:meditation/model/Sleep/sleepMeditation_Model.dart'
    as sleepMeditation;
import 'package:meditation/model/Sleep/sleepStory_model.dart' as sleep_story;
import 'package:meditation/views/screens/sleep/sleepMeditation_seeAll.dart';
import 'package:meditation/views/screens/sleep/sleepStory_seeAll.dart';
import 'package:meditation/views/screens/sleep/sleep_feeling_seeAll.dart';
import 'package:meditation/views/screens/sleep/sleep_homeModel_seeAll.dart';
import 'package:meditation/views/screens/sleep/sleep_sound_seeALl.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../Controller/controller_constant.dart';
import '../../../generated/l10n.dart';
import '../../../model/Sleep/SleepHomeModel.dart';
import '../../../model/Sleep/sleep_sound_model.dart' as sleep_sound;
import '../../../services/admobads.dart';

class SleepScreen extends StatefulWidget {
  SleepScreen({Key? key}) : super(key: key);

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  void onRefresh() async {
    // monitor network
    kSleepController.sleepSoundList.clear();
    kSleepController.sleepStoryModel.value.relaxMeditation.clear();
    kSleepController.sleepStoryModelList.clear();
    kSleepController.sleepMeditationModel.value.relaxMeditation?.clear();
    kSleepController.sleepRelaxMeditationList.clear();
    kSleepController.getFeelingList.clear();
    kSleepController.getFeelingApi(1);
    kSleepController.sleepSoundApi(1);
    kSleepController.sleepStoryApi(1);
    kSleepController.sleepHomeModelApi();
    kSleepController.sleepMeditationModelApi(1);
    await Future.delayed(Duration(milliseconds: 600));
  }

  @override
  void initState() {
    super.initState();
    kSleepController.getFeelingApi(1);
    kSleepController.sleepStoryApi(1);
    kSleepController.sleepSoundApi(1);
    kSleepController.sleepHomeModelApi();
    kSleepController.sleepMeditationModelApi(1);
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///  chat gpt code
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(sleepBackImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child: RefreshIndicator(
            onRefresh: () async {
              onRefresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Styles.regular(
                        S.of(context).sleepText,
                        c: Constant.whiteColor,
                        fs: 20.0,
                      ),

                      /// ======================= Reminder Icon ============
                      /* InkWell(
                          onTap: () {
                            print('hello');
                            // notificationService.showNotification(0, 'hello dart', 'hello dart');
                          },
                          child: SvgPicture.asset('assets/icons/reminder.svg', height: 40.0, width: 40.0),
                        ),*/
                    ],
                  ),
                  Column(
                    children: [
                      StreamBuilder<bool>(
                          stream: isSkip.stream,
                          builder: (context, snapshot) {
                            if (isSkip.isTrue) {
                              return SizedBox();
                            } else {
                              return Column(children: [
                                SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    Text(
                                      'Sleep Sound',
                                      style: TextStyle(
                                        color: Constant.whiteColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        kSleepController.sleepSoundList.clear();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SleepSoundSeeAll(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        S.of(context).seeAll,
                                        style: TextStyle(
                                          color: Constant.whiteColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                                StreamBuilder<
                                        List<sleep_sound.RelaxMeditation>>(
                                    stream:
                                        kSleepController.sleepSoundList.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData ||
                                          snapshot.connectionState ==
                                              ConnectionState.done) {
                                        var data = snapshot.data;
                                        return CarouselSlider(
                                          options: CarouselOptions(
                                            viewportFraction: 0.8,
                                            enlargeCenterPage: false,
                                            autoPlay: true,
                                            height: 220.h,
                                            animateToClosest: true,
                                          ),
                                          items: List.generate(
                                              data?.length ?? 0,
                                              (index) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 170.0.h,
                                                          width: 300.4.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            image:
                                                                DecorationImage(
                                                              filterQuality:
                                                                  FilterQuality
                                                                      .low,
                                                              image: CachedNetworkImageProvider(
                                                                  maxHeight:
                                                                      500,
                                                                  maxWidth: 500,
                                                                  data?[index]
                                                                          .sleepsoundImage ??
                                                                      ''),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              showLoader(
                                                                  context);
                                                              songListModel
                                                                  .clear();
                                                              for (int i = 0;
                                                                  i <
                                                                      (data?.length ??
                                                                          0);
                                                                  i++) {
                                                                songListModel
                                                                    .add(
                                                                  SongListModel(
                                                                    id: data?[i]
                                                                            .id ??
                                                                        '',
                                                                    image: data?[i]
                                                                            .sleepsoundImage ??
                                                                        '',
                                                                    title: data?[i]
                                                                            .sleepsoundName ??
                                                                        '',
                                                                    url: data?[i]
                                                                            .sleepsoundUrl ??
                                                                        '',
                                                                  ),
                                                                );
                                                              }
                                                              await selectSong(
                                                                      index:
                                                                          index)
                                                                  .whenComplete(() =>
                                                                      hideLoader(
                                                                          context));
                                                              kSleepController
                                                                  .isSleepScreen
                                                                  .value = true;
                                                              Get.to(
                                                                () =>
                                                                    SongScreen(
                                                                  categoryName:
                                                                      data?[index]
                                                                              .sleepsoundName ??
                                                                          '',
                                                                  id: data?[index]
                                                                          .id ??
                                                                      '',
                                                                ),
                                                                transition:
                                                                    Transition
                                                                        .native,
                                                              );
                                                            },
                                                            child: SvgPicture.asset(
                                                                'assets/icons/play.svg',
                                                                height: 26.0,
                                                                width: 26.0,
                                                                fit: BoxFit
                                                                    .scaleDown),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.0),
                                                        Text(
                                                          data?[index]
                                                                  .sleepsoundName ??
                                                              "",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color: Constant
                                                                  .whiteColor,
                                                              fontSize: 14.0),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    }),
                                Row(
                                  children: [
                                    Text(
                                      'Meditation',
                                      style: TextStyle(
                                        color: Constant.whiteColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SleepMediationSeeAll(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        S.of(context).seeAll,
                                        style: TextStyle(
                                          color: Constant.whiteColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                SizedBox(
                                  height: 182.h,
                                  child: StreamBuilder<
                                      List<sleepMeditation.RelaxMeditation?>>(
                                    stream: kSleepController
                                        .sleepRelaxMeditationList.stream,
                                    builder: (context, meditation1Snapshot) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: kSleepController
                                                    .sleepRelaxMeditationList
                                                    .length <=
                                                4
                                            ? kSleepController
                                                .sleepRelaxMeditationList.length
                                            : 4,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 133.0.h,
                                                  width: 134.4.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: DecorationImage(
                                                      filterQuality:
                                                          FilterQuality.low,
                                                      image: CachedNetworkImageProvider(
                                                          maxHeight: 500,
                                                          maxWidth: 500,
                                                          kSleepController
                                                                  .sleepRelaxMeditationList[
                                                                      index]
                                                                  ?.mp3Thumbnail ??
                                                              ''),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      showLoader(context);
                                                      songListModel.clear();
                                                      for (int i = 0;
                                                          i <
                                                              (kSleepController
                                                                  .sleepRelaxMeditationList
                                                                  .length);
                                                          i++) {
                                                        songListModel.add(
                                                          SongListModel(
                                                            id: kSleepController
                                                                    .sleepRelaxMeditationList[
                                                                        i]
                                                                    ?.cid
                                                                    .toString() ??
                                                                '',
                                                            image: kSleepController
                                                                    .sleepRelaxMeditationList[
                                                                        i]
                                                                    ?.mp3Thumbnail ??
                                                                '',
                                                            title: kSleepController
                                                                    .sleepRelaxMeditationList[
                                                                        i]
                                                                    ?.mp3Title ??
                                                                '',
                                                            url: kSleepController
                                                                    .sleepRelaxMeditationList[
                                                                        i]
                                                                    ?.mp3Url ??
                                                                '',
                                                          ),
                                                        );
                                                      }
                                                      await selectSong(
                                                              index: index)
                                                          .whenComplete(() =>
                                                              hideLoader(
                                                                  context));
                                                      Get.to(
                                                        () => SongScreen(
                                                          categoryName: kSleepController
                                                                  .sleepRelaxMeditationList[
                                                                      index]
                                                                  ?.categoryName ??
                                                              '',
                                                          id: kSleepController
                                                                  .sleepRelaxMeditationList[
                                                                      index]
                                                                  ?.id ??
                                                              '',
                                                        ),
                                                        transition:
                                                            Transition.native,
                                                      );
                                                    },
                                                    child: SvgPicture.asset(
                                                        'assets/icons/play.svg',
                                                        height: 26.0,
                                                        width: 26.0,
                                                        fit: BoxFit.scaleDown),
                                                  ),
                                                ),
                                                SizedBox(height: 5.0),
                                                Text(
                                                  kSleepController
                                                          .sleepRelaxMeditationList[
                                                              index]
                                                          ?.categoryName ??
                                                      "",
                                                  style: TextStyle(
                                                      color:
                                                          Constant.whiteColor,
                                                      fontSize: 14.0),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.0.h),
                                Center(child: admobads().bannerads()),
                                SizedBox(height: 10.0.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Feeling',
                                      style: TextStyle(
                                        color: Constant.whiteColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        kSleepController.getFeelingList.clear();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SleepFeelingSeeAll(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        S.of(context).seeAll,
                                        style: TextStyle(
                                          color: Constant.whiteColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                                SizedBox(height: 10.0.h),
                                StreamBuilder<
                                    List<get_feeling.RelaxMeditation>>(
                                  stream:
                                      kSleepController.getFeelingList.stream,
                                  builder: (context, recommendedSnapshot) {
                                    if (recommendedSnapshot.hasData ||
                                        recommendedSnapshot.connectionState ==
                                            ConnectionState.done) {
                                      var data = recommendedSnapshot.data;
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: (data?.length ?? 0) <= 3
                                            ? (data?.length ?? 0)
                                            : 3,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right: 10.0,
                                                top: 10.0,
                                                bottom: 10.0),
                                            child: Container(
                                              height: 140.h,
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  showLoader(context);
                                                  songListModel.clear();
                                                  for (int i = 0;
                                                      i < (data?.length ?? 0);
                                                      i++) {
                                                    songListModel.add(
                                                      SongListModel(
                                                        id: data?[i]
                                                                .feelingId
                                                                .toString() ??
                                                            '',
                                                        image: data?[i]
                                                                .feelingImage ??
                                                            '',
                                                        title: data?[i]
                                                                .feelingName ??
                                                            '',
                                                        url: data?[i]
                                                                .feelingUrl ??
                                                            '',
                                                      ),
                                                    );
                                                  }
                                                  await selectSong(index: index)
                                                      .whenComplete(() =>
                                                          hideLoader(context));
                                                  kSleepController.isSleepScreen
                                                      .value = true;
                                                  Get.to(
                                                    () => SongScreen(
                                                      id: data?[index]
                                                              .feelingId ??
                                                          '',
                                                      categoryName: data?[index]
                                                              .feelingName ??
                                                          '',
                                                    ),
                                                    transition:
                                                        Transition.native,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 96.0,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        image: DecorationImage(
                                                          filterQuality:
                                                              FilterQuality.low,
                                                          image: CachedNetworkImageProvider(
                                                              maxHeight: 500,
                                                              maxWidth: 500,
                                                              data?[index]
                                                                      .feelingImage ??
                                                                  ''),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            data?[index]
                                                                    .feelingName ??
                                                                '',
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                color: Constant
                                                                    .whiteColor),
                                                            maxLines: 2,
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          Text(
                                                            data?[index]
                                                                    .feelingDescription ??
                                                                '',
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                color: Constant
                                                                    .whiteColor),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: true,
                                                            maxLines: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // InkWell(
                                                    //   onTap: () async {
                                                    //     showLoader(context);
                                                    //     songListModel.clear();
                                                    //     for (int i = 0; i < (recommendedSnapshot.data?.relaxMeditation?.length ?? 0); i++) {
                                                    //       songListModel.add(
                                                    //         SongListModel(
                                                    //           id: recommendedSnapshot.data?.relaxMeditation?[i].cid.toString() ?? '',
                                                    //           image: recommendedSnapshot.data?.relaxMeditation?[i].mp3Image ?? '',
                                                    //           title: recommendedSnapshot.data?.relaxMeditation?[i].mp3Title ?? '',
                                                    //           url: recommendedSnapshot.data?.relaxMeditation?[i].mp3Url ?? '',
                                                    //         ),
                                                    //       );
                                                    //     }
                                                    //     await selectSong(index: index).whenComplete(() => hideLoader(context));
                                                    //     Get.to(
                                                    //           () => SongScreen(
                                                    //         id: recommendedSnapshot.data?.relaxMeditation?[index].id ?? '',
                                                    //         categoryName: recommendedSnapshot.data?.relaxMeditation?[index].categoryName ?? '',
                                                    //       ),
                                                    //       transition: Transition.native,
                                                    //     );
                                                    //   },
                                                    //   child: SvgPicture.asset('assets/icons/play_icon.svg', width: 40.0, height: 40.0),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(height: 10.0);
                                        },
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Stories',
                                        style: TextStyle(
                                            color: Constant.whiteColor,
                                            fontSize: 18.0),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SleepStorySeeAll(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          S.of(context).seeAll,
                                          style: TextStyle(
                                              color: Constant.whiteColor,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0.h),
                                SizedBox(
                                  // height: 300.h,
                                  child: StreamBuilder<
                                      List<sleep_story.RelaxMeditation?>>(
                                    stream: kSleepController
                                        .sleepStoryModelList.stream,
                                    builder: (context, sleepSnapshot) {
                                      if (sleepSnapshot.hasData) {
                                        return GridView.builder(
                                          padding: EdgeInsets.all(5.0),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount: kSleepController
                                                      .sleepStoryModelList
                                                      .length <=
                                                  4
                                              ? kSleepController
                                                  .sleepStoryModelList.length
                                              : 4,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            // childAspectRatio: 1.3.h,
                                            mainAxisSpacing: 10.0,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    showLoader(context);
                                                    songListModel.clear();
                                                    for (int i = 0;
                                                        i <
                                                            kSleepController
                                                                .sleepStoryModelList
                                                                .length;
                                                        i++) {
                                                      songListModel.add(
                                                        SongListModel(
                                                          id: kSleepController
                                                                  .sleepStoryModelList[
                                                                      i]
                                                                  ?.cid
                                                                  .toString() ??
                                                              '',
                                                          image: kSleepController
                                                                  .sleepStoryModelList[
                                                                      i]
                                                                  ?.categoryImage ??
                                                              '',
                                                          title: kSleepController
                                                                  .sleepStoryModelList[
                                                                      i]
                                                                  ?.mp3Title ??
                                                              '',
                                                          url: kSleepController
                                                                  .sleepStoryModelList[
                                                                      i]
                                                                  ?.mp3Url ??
                                                              '',
                                                        ),
                                                      );
                                                    }
                                                    await selectSong(
                                                            index: index)
                                                        .whenComplete(() =>
                                                            hideLoader(
                                                                context));
                                                    Get.to(
                                                      () => SongScreen(
                                                        categoryName: kSleepController
                                                                .sleepStoryModelList[
                                                                    index]
                                                                ?.categoryName ??
                                                            '',
                                                        id: kSleepController
                                                                .sleepStoryModelList[
                                                                    index]
                                                                ?.id ??
                                                            '',
                                                      ),
                                                      transition:
                                                          Transition.native,
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 150.24.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      image: DecorationImage(
                                                        filterQuality:
                                                            FilterQuality.low,
                                                        image: CachedNetworkImageProvider(
                                                            maxHeight: 500,
                                                            maxWidth: 500,
                                                            kSleepController
                                                                    .sleepStoryModelList[
                                                                        index]
                                                                    ?.categoryImage ??
                                                                ''),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5.0),
                                                SizedBox(
                                                  width: 145.0.w,
                                                  child: Text(
                                                    kSleepController
                                                            .sleepStoryModelList[
                                                                index]
                                                            ?.mp3Title ??
                                                        '',
                                                    style: TextStyle(
                                                      color:
                                                          Constant.whiteColor,
                                                      fontSize: 10.0,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
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
                                  ),
                                ),
                              ]);
                            }
                          }),
                      Center(child: admobads().bannerads()),
                      SizedBox(height: 10.0.h),
                      StreamBuilder<SleepHomeModel>(
                        stream: kSleepController.sleepHomeModel.stream,
                        builder: (context, titleSnapshot) {
                          if (titleSnapshot.hasData ||
                              titleSnapshot.connectionState ==
                                  ConnectionState.done) {
                            return Container(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: kSleepController.sleepHomeModel.value
                                    .relaxmeditation?.length,
                                itemBuilder: (context, i) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            titleSnapshot
                                                    .data
                                                    ?.relaxmeditation?[i]
                                                    .sectionTitle ??
                                                '',
                                            style: TextStyle(
                                                color: Constant.whiteColor,
                                                fontSize: 18.0),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                              onTap: () => Get.to(
                                                  () => SleepHomeModelSeeAll(
                                                        id: titleSnapshot
                                                                .data
                                                                ?.relaxmeditation?[
                                                                    i]
                                                                .id ??
                                                            '',
                                                      )),
                                              child: Text(
                                                S.of(context).seeAll,
                                                style: TextStyle(
                                                    color: Constant.whiteColor
                                                        .withOpacity(0.7),
                                                    fontSize: 15.0),
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      i == 0
                                          ? FutureBuilder<
                                              SleepHomeSectionIdModel?>(
                                              future: kSleepController
                                                  .sleepHomeSectionData(
                                                      id: titleSnapshot
                                                              .data
                                                              ?.relaxmeditation?[
                                                                  i]
                                                              .id ??
                                                          '1'),
                                              builder: (context,
                                                  recommendedSnapshot) {
                                                if (recommendedSnapshot
                                                        .hasData ||
                                                    recommendedSnapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: (recommendedSnapshot
                                                                    .data
                                                                    ?.relaxMeditation
                                                                    ?.length ??
                                                                0) <=
                                                            3
                                                        ? recommendedSnapshot
                                                                .data
                                                                ?.relaxMeditation
                                                                ?.length ??
                                                            0
                                                        : 3,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10.0,
                                                                top: 10.0,
                                                                bottom: 10.0),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 96.0,
                                                              height: 120.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                image:
                                                                    DecorationImage(
                                                                  filterQuality:
                                                                      FilterQuality
                                                                          .low,
                                                                  image: CachedNetworkImageProvider(
                                                                      maxHeight:
                                                                          500,
                                                                      maxWidth:
                                                                          500,
                                                                      recommendedSnapshot
                                                                              .data
                                                                              ?.relaxMeditation?[index]
                                                                              .mp3Image ??
                                                                          ''),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: 10.0),
                                                            Text(
                                                              recommendedSnapshot
                                                                      .data
                                                                      ?.relaxMeditation?[
                                                                          index]
                                                                      .categoryName ??
                                                                  '',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Constant
                                                                      .whiteColor),
                                                              maxLines: 3,
                                                            ),
                                                            Spacer(),
                                                            InkWell(
                                                              onTap: () async {
                                                                showLoader(
                                                                    context);
                                                                songListModel
                                                                    .clear();
                                                                for (int i = 0;
                                                                    i <
                                                                        (recommendedSnapshot.data?.relaxMeditation?.length ??
                                                                            0);
                                                                    i++) {
                                                                  songListModel
                                                                      .add(
                                                                    SongListModel(
                                                                      id: recommendedSnapshot
                                                                              .data
                                                                              ?.relaxMeditation?[i]
                                                                              .cid
                                                                              .toString() ??
                                                                          '',
                                                                      image: recommendedSnapshot
                                                                              .data
                                                                              ?.relaxMeditation?[i]
                                                                              .mp3Image ??
                                                                          '',
                                                                      title: recommendedSnapshot
                                                                              .data
                                                                              ?.relaxMeditation?[i]
                                                                              .mp3Title ??
                                                                          '',
                                                                      url: recommendedSnapshot
                                                                              .data
                                                                              ?.relaxMeditation?[i]
                                                                              .mp3Url ??
                                                                          '',
                                                                    ),
                                                                  );
                                                                }
                                                                await selectSong(
                                                                        index:
                                                                            index)
                                                                    .whenComplete(() =>
                                                                        hideLoader(
                                                                            context));
                                                                Get.to(
                                                                  () =>
                                                                      SongScreen(
                                                                    id: recommendedSnapshot
                                                                            .data
                                                                            ?.relaxMeditation?[index]
                                                                            .id ??
                                                                        '',
                                                                    categoryName: recommendedSnapshot
                                                                            .data
                                                                            ?.relaxMeditation?[index]
                                                                            .categoryName ??
                                                                        '',
                                                                  ),
                                                                  transition:
                                                                      Transition
                                                                          .native,
                                                                );
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                      'assets/icons/play_icon.svg',
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return SizedBox(
                                                          height: 10.0);
                                                    },
                                                  );
                                                } else {
                                                  return SizedBox();
                                                }
                                              },
                                            )
                                          : SizedBox(
                                              height: 130.0.h,
                                              child: FutureBuilder<
                                                  SleepHomeSectionIdModel?>(
                                                future: kSleepController
                                                    .sleepHomeSectionData(
                                                        id: titleSnapshot
                                                                .data
                                                                ?.relaxmeditation?[
                                                                    i]
                                                                .id ??
                                                            '2'),
                                                builder:
                                                    (context, soundSnapshot) {
                                                  if (soundSnapshot.hasData ||
                                                      soundSnapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .done) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10.0),
                                                      child: ListView.separated(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: (soundSnapshot
                                                                        .data
                                                                        ?.relaxMeditation
                                                                        ?.length ??
                                                                    0) <=
                                                                3
                                                            ? soundSnapshot
                                                                    .data
                                                                    ?.relaxMeditation
                                                                    ?.length ??
                                                                0
                                                            : 3,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () async {
                                                              showLoader(
                                                                  context);
                                                              songListModel
                                                                  .clear();
                                                              for (int i = 0;
                                                                  i <
                                                                      (soundSnapshot
                                                                              .data
                                                                              ?.relaxMeditation
                                                                              ?.length ??
                                                                          0);
                                                                  i++) {
                                                                songListModel
                                                                    .add(
                                                                  SongListModel(
                                                                    id: soundSnapshot
                                                                            .data
                                                                            ?.relaxMeditation?[i]
                                                                            .cid
                                                                            .toString() ??
                                                                        '',
                                                                    image: soundSnapshot
                                                                            .data
                                                                            ?.relaxMeditation?[i]
                                                                            .mp3Image ??
                                                                        '',
                                                                    title: soundSnapshot
                                                                            .data
                                                                            ?.relaxMeditation?[i]
                                                                            .mp3Title ??
                                                                        '',
                                                                    url: soundSnapshot
                                                                            .data
                                                                            ?.relaxMeditation?[i]
                                                                            .mp3Url ??
                                                                        '',
                                                                  ),
                                                                );
                                                              }
                                                              await selectSong(
                                                                      index:
                                                                          index)
                                                                  .whenComplete(() =>
                                                                      hideLoader(
                                                                          context));
                                                              Get.to(
                                                                () =>
                                                                    SongScreen(
                                                                  id: soundSnapshot
                                                                          .data
                                                                          ?.relaxMeditation?[
                                                                              index]
                                                                          .id ??
                                                                      '',
                                                                  categoryName: soundSnapshot
                                                                          .data
                                                                          ?.relaxMeditation?[
                                                                              index]
                                                                          .categoryName ??
                                                                      '',
                                                                ),
                                                                transition:
                                                                    Transition
                                                                        .native,
                                                              );
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          120.24
                                                                              .r),
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height:
                                                                    120.24.h,
                                                                width: 120.24.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .yellow,
                                                                  // borderRadius: BorderRadius.circular(130.r),
                                                                  // shape: BoxShape.circle,
                                                                  image:
                                                                      DecorationImage(
                                                                    filterQuality:
                                                                        FilterQuality
                                                                            .low,
                                                                    image: CachedNetworkImageProvider(
                                                                        maxHeight:
                                                                            500,
                                                                        maxWidth:
                                                                            500,
                                                                        soundSnapshot.data?.relaxMeditation?[index].mp3Image ??
                                                                            ''),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  soundSnapshot
                                                                          .data
                                                                          ?.relaxMeditation?[
                                                                              index]
                                                                          .mp3Title ??
                                                                      '',
                                                                  // softWrap: true,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,

                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,

                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                    color: Color(
                                                                        0xFFFFFFFF),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return SizedBox(
                                                              width: 15.0);
                                                        },
                                                      ),
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
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
