import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/homemodel/home_section_model.dart'
    as homeModel;

import '../../../../Services/authentication_services/BaseNetworkApi.dart';
import '../../../../constant/audio_constant.dart';
import '../../../../main.dart';

import '../../loadingscreen/loader.dart';
import '../../songplayerscreen/songplayer.dart';

class MeditationTabSeeAll extends StatefulWidget {
  final Widget appBarTitle;
  final String? id;

  MeditationTabSeeAll({Key? key, required this.appBarTitle, this.id})
      : super(key: key);

  @override
  State<MeditationTabSeeAll> createState() => _MeditationTabSeeAllState();
}

class _MeditationTabSeeAllState extends State<MeditationTabSeeAll> {
  final HomeController homeController = Get.put(HomeController());
  int page = 1;
  RxList<homeModel.RelaxMeditation> _dataList =
      <homeModel.RelaxMeditation>[].obs;
  Future<List<homeModel.RelaxMeditation>?>? _future;
  ScrollController _controller = ScrollController();

  Future<List<homeModel.RelaxMeditation>?> getData(int pageCount) async {
    final response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"home_section_id_2","package_name":"com.eng.audiobook","homesection_id_2":"${widget.id}","page":"$page"}');
    /* .timeout(const Duration(seconds: 10)*/

    if (response != null) {
      logger.log(Level.info, 'response ===> $response');
      final payload = homeModel.homeSectionModelFromJson(response);
      print('😡😡😡😡😡 :: ${payload.relaxMeditation}');
      _dataList.insertAll(0, payload.relaxMeditation ?? []);
      page++;
      return _dataList;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    _future = getData(page);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent &&
          ((homeController.homeSection?.relaxMeditation?.length ?? 0) % 9 <
              (int.parse(homeController
                      .homeSection?.relaxMeditation?.first.totalSongs ??
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
              transition:
                  Transition.native, /* duration: const Duration(seconds: 1)*/
            );
          } catch (error, link) {
            logger.log(Level.error, 'error :: $error', stackTrace: link);
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: widget.appBarTitle,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Home Screen.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: FutureBuilder<List<homeModel.RelaxMeditation>?>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var dataToShow = snapshot.data;
                        homeController.isLike.clear();
                        return GridView.builder(
                          controller: _controller,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.9),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: dataToShow == null ? 0 : dataToShow.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                showLoader(context);
                                songListModel.clear();
                                for (int i = 0;
                                    i < (dataToShow?.length ?? 0);
                                    i++) {
                                  songListModel.add(
                                    SongListModel(
                                        id: dataToShow?[i].cid.toString() ?? '',
                                        image: dataToShow?[i].mp3Image ?? '',
                                        title: dataToShow?[i].mp3Title ?? '',
                                        url: dataToShow?[i].mp3Url ?? ''),
                                  );
                                }
                                await selectSong(index: index)
                                    .whenComplete(() => hideLoader(context));
                                Get.to(
                                  () => SongScreen(
                                    id: dataToShow?[index].id ?? '',
                                    categoryName:
                                        dataToShow?[index].categoryName ?? '',
                                  ),
                                  transition: Transition.native,
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 140.24.w,
                                    height: 170.79.h,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CachedNetworkImage(
                                        memCacheHeight: 500,
                                        fadeInCurve: Curves.linear,
                                        imageUrl:
                                            dataToShow?[index].mp3Image ?? '',
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
                                  SizedBox(height: 5.h),
                                  Text(
                                    dataToShow?[index].categoryName ?? '',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Constant.whiteColor),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Loading();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
