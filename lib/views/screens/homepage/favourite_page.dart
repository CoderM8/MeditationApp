import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/model/homemodel/user_favourite_model.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

import '../../../Controller/song_player_controller/song_player_controller.dart';
import '../../../constant/constant.dart';
import '../../../services/local_storage_service.dart';

class FavouritePage extends StatefulWidget {
  final String appbarTitle;

  FavouritePage({Key? key, required this.appbarTitle}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  // final UserController userController = Get.put(UserController());

  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());

  // final HomeController homeController = Get.put(HomeController());
  var uid = LocalStorageServices().box.read('uid');
  int page = 1;
  ScrollController _scrollController = ScrollController();

  getFavouritePagination() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        ((songPlayerController
                        .getFavouriteModel.value?.relaxMeditation?.length ??
                    0) %
                9 <
            (int.parse(songPlayerController.getFavouriteModel.value
                    ?.relaxMeditation?.first.totalSongsFav ??
                '')))) {
      showLoader(context);
      songPlayerController.runningPage.value += 1;
      page++;
      songPlayerController
          .userFavouriteServices(context, page)
          .then((value) => hideLoader(context));
    }
  }

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        this.songPlayerController.userFavouriteServices(context, 1);
      },
    );
    _scrollController.addListener(getFavouritePagination);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,

        /// =================== Background Image ===================
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Home Screen.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                child: Row(
                  children: [
                    /// =================== Back Arrow ===================
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20.sp, color: Constant.whiteColor),
                    ),

                    /// =================== Favourite ===================
                    SizedBox(width: 110.w),
                    Text(widget.appbarTitle,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Constant.whiteColor)),
                  ],
                ),
              ),

              /// =================== Container ===================

              Container(
                height: 740.h,
                padding: EdgeInsets.only(left: 10.w, right: 15.w),
                child: StreamBuilder<List<RelaxMeditation?>>(
                    stream: songPlayerController.getFavouriteList.stream,
                    builder: (context, snapshot) {
                      return ListView.separated(
                        controller: _scrollController,
                        itemCount: songPlayerController.getFavouriteList.length,
                        itemBuilder: (context, index) {
                          if (songPlayerController
                              .getFavouriteList.isNotEmpty) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              songPlayerController.isLike.value = false;
                              songPlayerController.isLike.value =
                                  songPlayerController
                                          .getFavouriteList.isNotEmpty
                                      ? (songPlayerController
                                              .getFavouriteList[0]
                                              ?.isFavourite ??
                                          true)
                                      : false;
                            });
                            return GlassmorphicContainer(
                              height: 80.h,
                              width: 45.h,
                              blur: 70,
                              borderRadius: 10,
                              border: 5,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              borderGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFFFFFF).withOpacity(0.05),
                                  Color((0xFFFFFFFF)).withOpacity(0.05),
                                ],
                              ),
                              linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFFFFFF).withOpacity(0.5),
                                  Color((0xFFFFFFFF)).withOpacity(0.5),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// =================== Image ===================
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                          imageUrl: songPlayerController
                                                  .getFavouriteList[index]
                                                  ?.mp3Image ??
                                              '',
                                          memCacheHeight: 500,
                                          filterQuality: FilterQuality.low,
                                          errorWidget: (context, url, error) =>
                                              Center(
                                                  child: Icon(Icons.error,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary)),
                                          fit: BoxFit.cover,
                                          height: 80.h,
                                          width: 70.w),
                                    ),
                                    SizedBox(width: 10.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        /// =================== Category Name ===================
                                        InkWell(
                                          onTap: () async {
                                            showLoader(context);
                                            songListModel.clear();
                                            for (int i = 0;
                                                i <
                                                    songPlayerController
                                                        .getFavouriteList
                                                        .length;
                                                i++) {
                                              songListModel.add(SongListModel(
                                                  id: songPlayerController
                                                          .getFavouriteList[i]
                                                          ?.id
                                                          .toString() ??
                                                      '',
                                                  image: songPlayerController
                                                          .getFavouriteList[i]
                                                          ?.mp3Image ??
                                                      '',
                                                  title: songPlayerController
                                                          .getFavouriteList[i]
                                                          ?.mp3Title ??
                                                      '',
                                                  url: songPlayerController
                                                          .getFavouriteList[i]
                                                          ?.mp3Url ??
                                                      ''));
                                            }
                                            await selectSong(index: index)
                                                .whenComplete(
                                                    () => hideLoader(context));
                                            Get.to(
                                              () => SongScreen(
                                                  id: songPlayerController
                                                          .getFavouriteList[
                                                              index]
                                                          ?.id ??
                                                      '',
                                                  categoryName:
                                                      songPlayerController
                                                              .getFavouriteList[
                                                                  index]
                                                              ?.categoryName ??
                                                          ''),
                                              transition: Transition.native,
                                            );
                                          },
                                          child: SizedBox(
                                            width: 170.w,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.w),
                                              child: Text(
                                                songPlayerController
                                                        .getFavouriteList[index]
                                                        ?.mp3Title ??
                                                    '',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Constant.whiteColor),
                                              ),
                                            ),
                                          ),
                                        ),

                                        /// =================== Title ===================
                                        SizedBox(
                                          width: 170.w,
                                          child: Text(
                                            songPlayerController
                                                    .getFavouriteList[index]
                                                    ?.mp3Title ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Constant.whiteColor,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () async {
                                        await songPlayerController
                                            .favouriteMeditationController(
                                                postid: songPlayerController
                                                    .getFavouriteList[index]
                                                    ?.id,
                                                userid: uid)
                                            .then((val) async {
                                          val?.relaxMeditation[0].success == "1"
                                              ? songPlayerController
                                                  .isLike.value = true
                                              : songPlayerController
                                                  .isLike.value = false;
                                          songPlayerController.getFavouriteList
                                              .removeAt(index);
                                          // await songPlayerController.userFavouriteServices();
                                        }).whenComplete(() =>
                                                songPlayerController.update());
                                      },
                                      child: Icon(Icons.favorite_outlined,
                                          size: 25.sp,
                                          color: Constant.redColor),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward_ios_rounded,
                                        size: 25.sp, color: Colors.white),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center();
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(color: Colors.black, thickness: 3);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
