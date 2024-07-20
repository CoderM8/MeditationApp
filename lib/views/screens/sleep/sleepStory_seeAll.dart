import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../Constant/constant.dart';
import '../../../Controller/controller_constant.dart';
import '../../../constant/audio_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../main.dart';
import 'package:meditation/model/Sleep/sleepStory_model.dart' as sleep_story;
import '../songplayerscreen/songplayer.dart';

class SleepStorySeeAll extends StatefulWidget {
  const SleepStorySeeAll({super.key});

  @override
  State<SleepStorySeeAll> createState() => _SleepStorySeeAllState();
}

class _SleepStorySeeAllState extends State<SleepStorySeeAll> {
  int page = 1;
  ScrollController _scrollController = ScrollController();
  sleepStoryPagination() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        ((kSleepController.sleepStoryModel.value.relaxMeditation.length) % 9 <
            (int.parse(kSleepController
                .sleepStoryModel.value.relaxMeditation.first.totalSongs)))) {
      showLoader(context);
      kSleepController.storyRunningPage.value += 1;
      page++;
      kSleepController.sleepStoryApi(page).then((value) => hideLoader(context));
    }
  }

  @override
  void initState() {
    // sleepController.sleepStoryApi();
    _scrollController.addListener(sleepStoryPagination);
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
          'Stories',
          style: TextStyle(color: Constant.whiteColor, fontSize: 25.sp),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(sleepBackImage), fit: BoxFit.cover)),
        child: StreamBuilder<List<sleep_story.RelaxMeditation?>>(
          stream: kSleepController.sleepStoryModelList.stream,
          builder: (context, sleepSnapshot) {
            return GridView.builder(
              controller: _scrollController,
              // padding: EdgeInsets.all(5.sp),
              physics: RangeMaintainingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: kSleepController.sleepStoryModelList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h, /*childAspectRatio: 1.2.h*/
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        showLoader(context);
                        songListModel.clear();
                        for (int i = 0;
                            i < kSleepController.sleepStoryModelList.length;
                            i++) {
                          songListModel.add(
                            SongListModel(
                                id: kSleepController.sleepStoryModelList[i]?.cid
                                        .toString() ??
                                    '',
                                image: kSleepController.sleepStoryModelList[i]
                                        ?.categoryImage ??
                                    '',
                                title: kSleepController
                                        .sleepStoryModelList[i]?.mp3Title ??
                                    '',
                                url: kSleepController
                                        .sleepStoryModelList[i]?.mp3Url ??
                                    ''),
                          );
                        }
                        await selectSong(index: index)
                            .whenComplete(() => hideLoader(context));
                        Get.to(
                          () => SongScreen(
                              categoryName: kSleepController
                                      .sleepStoryModelList[index]
                                      ?.categoryName ??
                                  '',
                              id: kSleepController
                                      .sleepStoryModelList[index]?.id ??
                                  ''),
                          transition: Transition.native,
                        );
                      },
                      child: Container(
                        height: 160.h,
                        // width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),

                          /// =================== Image ===================
                          image: DecorationImage(
                              filterQuality: FilterQuality.low,
                              image: CachedNetworkImageProvider(
                                  maxHeight: 500,
                                  maxWidth: 500,
                                  kSleepController.sleepStoryModelList[index]
                                          ?.categoryImage ??
                                      ''),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),

                    /// =================== Title ===================
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 145.w,
                      child: Text(
                          kSleepController
                                  .sleepStoryModelList[index]?.mp3Title ??
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
          },
        ),
      ),
    );
  }
}
