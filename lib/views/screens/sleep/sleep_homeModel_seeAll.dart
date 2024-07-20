import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../Constant/constant.dart';
import '../../../Services/authentication_services/BaseNetworkApi.dart';
import '../../../constant/audio_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../main.dart';
import '../../../model/Sleep/SleepHomeSectionIdModel.dart' as sleepHome;
import '../../../services/local_storage_service.dart';
import '../songplayerscreen/songplayer.dart';

class SleepHomeModelSeeAll extends StatefulWidget {
  final String id;
  SleepHomeModelSeeAll({super.key, required this.id});

  @override
  State<SleepHomeModelSeeAll> createState() => _SleepHomeModelSeeAllState();
}

class _SleepHomeModelSeeAllState extends State<SleepHomeModelSeeAll> {
  int page = 1;
  Rx<sleepHome.SleepHomeSectionIdModel> sleepHomeModel =
      sleepHome.SleepHomeSectionIdModel().obs;
  RxList<sleepHome.RelaxMeditation> _dataList =
      <sleepHome.RelaxMeditation>[].obs;
  Future<List<sleepHome.RelaxMeditation>?>? _future;
  ScrollController _controller = ScrollController();

  Future<List<sleepHome.RelaxMeditation>?> getData(int pageCount) async {
    var userId = await LocalStorageServices().box.read('uid');
    final response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"sleep_home_section_id","package_name":"com.eng.audiobook","sleep_homesection_id":${widget.id},"page":"$page"}');
    if (response != null) {
      logger.log(Level.info, 'response ===> $response');
      sleepHome.SleepHomeSectionIdModel payload =
          sleepHome.sleepHomeSectionIdModelFromJson(response);
      print('😡😡😡😡😡 :: ${payload.relaxMeditation}');
      _dataList.insertAll(
          0, payload.relaxMeditation as Iterable<sleepHome.RelaxMeditation>);
      page++;
      return _dataList;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    // sleepController.sleepStoryApi();
    _future = getData(page);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent &&
          ((sleepHomeModel.value.relaxMeditation?.length ?? 0) % 9 <
              (int.parse(
                  sleepHomeModel.value.relaxMeditation?.first.totalSongs ??
                      '')))) {
        setState(() {
          _future = getData(page);
        });
      }
    });
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
        child: FutureBuilder<List<sleepHome.RelaxMeditation>?>(
          future: _future,
          builder: (context, soundSnapshot) {
            if (soundSnapshot.hasData ||
                soundSnapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GridView.builder(
                  controller: _controller,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: soundSnapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          showLoader(context);
                          songListModel.clear();
                          for (int i = 0;
                              i < (soundSnapshot.data?.length ?? 0);
                              i++) {
                            songListModel.add(
                              SongListModel(
                                id: soundSnapshot.data?[i].cid.toString() ?? '',
                                image: soundSnapshot.data?[i].mp3Image ?? '',
                                title: soundSnapshot.data?[i].mp3Title ?? '',
                                url: soundSnapshot.data?[i].mp3Url ?? '',
                              ),
                            );
                          }
                          await selectSong(index: index)
                              .whenComplete(() => hideLoader(context));
                          Get.to(
                            () => SongScreen(
                              id: soundSnapshot.data?[index].id ?? '',
                              categoryName:
                                  soundSnapshot.data?[index].categoryName ?? '',
                            ),
                            transition: Transition.native,
                          );
                        },
                        child: Container(
                          height: 106.24.h,
                          width: 106.24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              filterQuality: FilterQuality.low,
                              image: CachedNetworkImageProvider(
                                  maxHeight: 500,
                                  maxWidth: 500,
                                  soundSnapshot.data?[index].mp3Image ?? ''),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                soundSnapshot.data?[index].mp3Title ?? '',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.3.h),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
