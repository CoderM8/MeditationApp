import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:meditation/model/Sleep/sleepMeditation_Model.dart'
    as sleep_meditation;
import '../../../Constant/constant.dart';
import '../../../Controller/controller_constant.dart';
import '../../../constant/audio_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../main.dart';
import '../songplayerscreen/songplayer.dart';

class SleepMediationSeeAll extends StatefulWidget {
  const SleepMediationSeeAll({super.key});

  @override
  State<SleepMediationSeeAll> createState() => _SleepMeditationSeeAllState();
}

class _SleepMeditationSeeAllState extends State<SleepMediationSeeAll> {
  int page = 1;
  ScrollController _scrollController = ScrollController();

  sleepMeditationPagination() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        ((kSleepController.sleepMeditationModel.value.relaxMeditation?.length ??
                    0) %
                9 <
            (int.parse(kSleepController.sleepMeditationModel.value
                    .relaxMeditation?.first.totalSongs ??
                '')))) {
      showLoader(context);
      kSleepController.meditationRunningPage.value += 1;
      page++;
      // sleepController.sleepRelaxMeditationList.clear();
      kSleepController
          .sleepMeditationModelApi(page)
          .then((value) => hideLoader(context));
    }
  }

  @override
  void initState() {
    // sleepController.sleepMeditationModelApi(1);
    _scrollController.addListener(sleepMeditationPagination);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: slidablePanelHeader(
        context: context,
        onTap: () async {
          try {
            Get.to(
              () => SongScreen(
                id: assetsAudioPlayer.current.value?.audio.audio.metas.id ?? '',
                categoryName: '',
              ),
              transition: Transition.native,
            );
          } catch (error, link) {
            logger.log(Level.error, 'error :: $error', stackTrace: link);
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(29, 0, 51, 1),
        title: Text(
          'Meditation',
          style: TextStyle(color: Constant.whiteColor, fontSize: 25.sp),
        ),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          page = 1;
          kSleepController.meditationRunningPage.value = 1;
          kSleepController.sleepRelaxMeditationList.clear();
          kSleepController.sleepMeditationModelApi(1);
          setState(() {});
        },
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sleepBackImage), fit: BoxFit.cover)),
          child: StreamBuilder<List<sleep_meditation.RelaxMeditation?>>(
            stream: kSleepController.sleepRelaxMeditationList.stream,
            builder: (context, snapshot) {
              return GridView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(5.sp),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: kSleepController.sleepRelaxMeditationList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          showLoader(context);
                          songListModel.clear();
                          for (int i = 0;
                              i <
                                  (kSleepController
                                      .sleepRelaxMeditationList.length);
                              i++) {
                            songListModel.add(
                              SongListModel(
                                  id: kSleepController
                                          .sleepRelaxMeditationList[i]?.cid
                                          .toString() ??
                                      '',
                                  image: kSleepController
                                          .sleepRelaxMeditationList[i]
                                          ?.mp3Thumbnail ??
                                      '',
                                  title: kSleepController
                                          .sleepRelaxMeditationList[i]
                                          ?.mp3Title ??
                                      "",
                                  url: kSleepController
                                          .sleepRelaxMeditationList[i]
                                          ?.mp3Url ??
                                      ""),
                            );
                          }
                          await selectSong(index: index)
                              .whenComplete(() => hideLoader(context));
                          Get.to(
                            () => SongScreen(
                                categoryName: kSleepController
                                        .sleepRelaxMeditationList[index]
                                        ?.categoryName ??
                                    '',
                                id: kSleepController
                                        .sleepRelaxMeditationList[index]?.id ??
                                    ''),
                            transition: Transition.native,
                          );
                        },
                        child: Container(
                          height: 160.h,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),

                            /// =================== Image ===================
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    maxHeight: 500,
                                    maxWidth: 500,
                                    kSleepController
                                            .sleepRelaxMeditationList[index]
                                            ?.mp3Thumbnail ??
                                        ''),
                                filterQuality: FilterQuality.low,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      /// =================== Title ===================
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 145.w,
                        child: Text(
                            kSleepController.sleepRelaxMeditationList[index]
                                    ?.mp3Title ??
                                '',
                            style: TextStyle(
                                color: Constant.whiteColor, fontSize: 10.sp),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center),
                      ),
                    ],
                  );
                },
              );
              /* } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loaderAnimation,
                  ],
                );
              }*/
            },
          ),
        ),
      ),
    );
  }
}
