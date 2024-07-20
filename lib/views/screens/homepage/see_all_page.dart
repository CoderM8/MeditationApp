import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/home_model/quick_easy_id_model.dart'
    as quick_easy_id_model;

import '../../../../Services/authentication_services/BaseNetworkApi.dart';
import '../../../constant/audio_constant.dart';
import '../../../main.dart';
import '../loadingscreen/loader.dart';
import '../songplayerscreen/songplayer.dart';

class SeeAll extends StatefulWidget {
  final bool isHomeTab;
  final Widget appBarTitle;
  final String? id;

  SeeAll(
      {Key? key, required this.appBarTitle, this.id, required this.isHomeTab})
      : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  final HomeController homeController = Get.put(HomeController());
  int page = 1;
  List<quick_easy_id_model.RelaxMeditation> _dataList =
      <quick_easy_id_model.RelaxMeditation>[].obs;
  Future<List<quick_easy_id_model.RelaxMeditation>?>? _future;
  ScrollController _controller = ScrollController();

  Future<List<quick_easy_id_model.RelaxMeditation>?> getData(
      int pageCount) async {
    String body =
        '{"method_name":${widget.isHomeTab == true ? '"home_section_id"' : '"home_section_id_2"'},"package_name":"com.eng.audiobook",${widget.isHomeTab == true ? '"homesection_id"' : '"homesection_id_2"'}:"${widget.id}","page":"$pageCount"}';
    print('body data ==> $body');
    final response = await BaseNetworkApi().apiPost(body: body);
    /* .timeout(const Duration(seconds: 10)*/

    if (response != null) {
      logger.log(Level.info, 'response ===> $response');
      var payload = quick_easy_id_model.quickEasyIdModelFromJson(response);
      print('😡😡😡😡😡 :: ${payload.relaxMeditation}');
      _dataList.insertAll(0, payload.relaxMeditation);
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
          ((homeController.quickEasyIdData?.relaxMeditation.length ?? 0) % 9 <
              (int.parse(homeController
                      .quickEasyIdData?.relaxMeditation.first.totalSongs ??
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
        backgroundColor: Constant.darkThemeColor,
        centerTitle: true,
        title: widget.appBarTitle,
        leading: BackButton(
          color: Constant.whiteColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Home Screen.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         Get.back();
            //       },
            //       child: Padding(
            //         padding: EdgeInsets.only(left: 10.w),
            //         child: Icon(Icons.arrow_back_ios_new_rounded, size: 20.sp, color: Colors.white),
            //       ),
            //     ),
            //     Center(child: appBarTitle),
            //     SizedBox()
            //   ],
            // ),
            // GlassmorphicContainer(
            //   height: 100.h,
            //   width: 400.w,
            //   blur: 70,
            //   borderRadius: 0,
            //   border: 5,
            //   borderGradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [
            //       Color(0xFFFFFFFF).withOpacity(0.05),
            //       Color((0xFFFFFFFF)).withOpacity(0.05),
            //     ],
            //   ),
            //   linearGradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [
            //       Color(0xFFFFFFFF).withOpacity(0.5),
            //       Color((0xFFFFFFFF)).withOpacity(0.5),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 40.h),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             Get.back();
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.only(left: 10.w),
            //             child: Icon(Icons.arrow_back_ios_new_rounded, size: 20.sp, color: Colors.white),
            //           ),
            //         ),
            //         Center(child: appBarTitle),
            //         SizedBox()
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: FutureBuilder<
                        List<quick_easy_id_model.RelaxMeditation>?>(
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
                                    height: 169.00.h,
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
                        // showLoader(context);
                        // return CircularProgressIndicator();
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
