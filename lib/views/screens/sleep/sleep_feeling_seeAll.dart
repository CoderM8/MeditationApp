import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:meditation/model/Sleep/get_feeling_model.dart' as get_feeling;
import '../../../Constant/constant.dart';
import '../../../Controller/controller_constant.dart';
import '../../../constant/audio_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../main.dart';
import '../songplayerscreen/songplayer.dart';

class SleepFeelingSeeAll extends StatefulWidget {
  const SleepFeelingSeeAll({super.key});

  @override
  State<SleepFeelingSeeAll> createState() => _SleepFeelingSeeAllState();
}

class _SleepFeelingSeeAllState extends State<SleepFeelingSeeAll> {
  int page = 2;
  ScrollController _scrollController = ScrollController();

  sleepMeditationPagination() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        ((kSleepController.getFeelingList.length) % 9 <
            (int.parse(kSleepController.getFeelingList.first.counts ?? ''))) &&
        (kSleepController.getFeelingList.length) <=
            (int.parse(kSleepController.getFeelingList.first.counts ?? ''))) {
      showLoader(context);
      print('page ================> $page');
      kSleepController
          .getFeelingApi(page++)
          .then((value) => hideLoader(context));
      setState(() {});
    }
  }

  @override
  void initState() {
    kSleepController.getFeelingApi(1);
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
          'Feeling',
          style: TextStyle(color: Constant.whiteColor, fontSize: 25.sp),
        ),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          page = 2;
          kSleepController.getFeelingList.clear();
          kSleepController.getFeelingApi(1);
          setState(() {});
        },
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sleepBackImage), fit: BoxFit.cover)),
          child: StreamBuilder<List<get_feeling.RelaxMeditation>>(
            stream: kSleepController.getFeelingList.stream,
            builder: (context, recommendedSnapshot) {
              if (recommendedSnapshot.hasData ||
                  recommendedSnapshot.connectionState == ConnectionState.done) {
                var data = recommendedSnapshot.data;
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                      child: Container(
                        height: 140.h,
                        width: MediaQuery.sizeOf(context).width,
                        child: GestureDetector(
                          onTap: () async {
                            showLoader(context);
                            songListModel.clear();
                            for (int i = 0; i < (data?.length ?? 0); i++) {
                              songListModel.add(
                                SongListModel(
                                  id: data?[i].feelingId.toString() ?? '',
                                  image: data?[i].feelingImage ?? '',
                                  title: data?[i].feelingName ?? '',
                                  url: data?[i].feelingUrl ?? '',
                                ),
                              );
                            }
                            await selectSong(index: index)
                                .whenComplete(() => hideLoader(context));
                            kSleepController.isSleepScreen.value = true;
                            Get.to(
                              () => SongScreen(
                                id: data?[index].feelingId ?? '',
                                categoryName: data?[index].feelingName ?? '',
                              ),
                              transition: Transition.native,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 96.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    filterQuality: FilterQuality.low,
                                    image: CachedNetworkImageProvider(
                                        maxHeight: 500,
                                        maxWidth: 500,
                                        data?[index].feelingImage ?? ''),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?[index].feelingName ?? '',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Constant.whiteColor),
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      data?[index].feelingDescription ?? '',
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          color: Constant.whiteColor),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.0);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
