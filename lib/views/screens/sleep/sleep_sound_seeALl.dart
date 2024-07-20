import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:meditation/model/Sleep/sleep_sound_model.dart' as sleep_sound;
import '../../../Constant/constant.dart';
import '../../../Controller/controller_constant.dart';
import '../../../constant/audio_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../main.dart';
import '../songplayerscreen/songplayer.dart';

class SleepSoundSeeAll extends StatefulWidget {
  const SleepSoundSeeAll({super.key});

  @override
  State<SleepSoundSeeAll> createState() => _SleepSoundSeeAllState();
}

class _SleepSoundSeeAllState extends State<SleepSoundSeeAll> {
  int page = 2;
  ScrollController _scrollController = ScrollController();

  sleepMeditationPagination() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        ((kSleepController.sleepSoundList.length) % 9 <
            (int.parse(kSleepController.sleepSoundList.first.counts ?? ''))) &&
        (kSleepController.sleepSoundList.length) <=
            (int.parse(kSleepController.sleepSoundList.first.counts ?? ''))) {
      showLoader(context);
      print('page ================> $page');
      kSleepController
          .sleepSoundApi(page++)
          .then((value) => hideLoader(context));
      setState(() {});
    }
  }

  @override
  void initState() {
    kSleepController.sleepSoundApi(1);
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
          page = 2;
          kSleepController.sleepSoundList.clear();
          kSleepController.sleepSoundApi(1);
          setState(() {});
        },
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sleepBackImage), fit: BoxFit.cover)),
          child: StreamBuilder<List<sleep_sound.RelaxMeditation>>(
            stream: kSleepController.sleepSoundList.stream,
            builder: (context, snapshot) {
              var data = snapshot.data;
              return GridView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(5.sp),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: data?.length,
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
                          for (int i = 0; i < (data?.length ?? 0); i++) {
                            songListModel.add(
                              SongListModel(
                                  id: data?[i].id.toString() ?? '',
                                  image: data?[i].sleepsoundImage ?? '',
                                  title: data?[i].sleepsoundName ?? "",
                                  url: data?[i].sleepsoundUrl ?? ""),
                            );
                          }
                          await selectSong(index: index)
                              .whenComplete(() => hideLoader(context));
                          Get.to(
                            () => SongScreen(
                                categoryName: data?[index].sleepsoundName ?? '',
                                id: data?[index].id ?? ''),
                            transition: Transition.native,
                          );
                        },
                        child: Container(
                          height: 160.h,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: CachedNetworkImage(
                                  imageUrl: data?[index].sleepsoundImage ?? '',
                                  memCacheHeight: 500,
                                  filterQuality: FilterQuality.low,
                                  fit: BoxFit.cover)),
                        ),
                      ),

                      /// =================== Title ===================
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 145.w,
                        child: Text(data?[index].sleepsoundName ?? '',
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
