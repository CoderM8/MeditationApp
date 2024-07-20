// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meditation/Controller/controller_constant.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/constant/textwidget_constant.dart';
import 'package:meditation/services/admobads.dart';
import 'package:meditation/views/screens/seekbar/seekbar_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Controller/song_player_controller/song_player_controller.dart';
import '../../../Controller/user_controller/user_controller.dart';
import '../../../constant/constant.dart';
import '../../../constant/databse/database.dart';
import '../../../constant/downloadmp3.dart';
import '../../../model/download_model/download_model.dart';
import '../../../services/local_storage_service.dart';

final RxBool isdownload = false.obs;

class SongScreen
    extends StatefulWidget {
  final String id;
  final String categoryName;
  final String? songImage;

  SongScreen({
    Key? key,
    required this.id,
    required this.categoryName,
    this.songImage,
  }) : super(key: key);

  @override
  State<SongScreen> createState() =>
      _SongScreenState();
}

class _SongScreenState
    extends State<SongScreen> {
  final RxBool nextLoader = true.obs;

  final RxBool previousLoader =
      true.obs;

  final bool? download = false;

  RxBool lockScreen = false.obs;

  timeFormat(Duration d) =>
      d.toString().substring(2, 7);

  getdownload(id) async {
    isdownload.value =
        await DatabaseHelper()
            .isdownload(id);
  }

  // final HomeController homeController = Get.put(HomeController());
  final UserController userController =
      Get.put(UserController());

  @override
  void initState() {
    super.initState();
    showInterstitialAdOnClickEvent();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'image ===> ${widget.songImage}');
    final SongPlayerController
        songPlayerController = Get.put(
            SongPlayerController(
                postid: widget.id));
    songPlayerController.getfavourite(
        postid: widget.id);
    return Scaffold(
      body: Container(
        height:
            MediaQuery.sizeOf(context)
                .height,
        width:
            MediaQuery.sizeOf(context)
                .width,
        child: assetsAudioPlayer
            .builderRealtimePlayingInfos(
          builder: (context,
              RealtimePlayingInfos?
                  infos) {
            return PlayerBuilder
                .current(
              player: assetsAudioPlayer,
              builder:
                  (context, value) {
                return StreamBuilder<
                        bool>(
                    stream: lockScreen
                        .stream,
                    builder: (context,
                        snapshot) {
                      return Stack(
                        fit: StackFit
                            .expand,
                        children: [
                          Obx(() {
                            return Container(
                              /// =================== Network Image ===================
                              decoration:
                                  BoxDecoration(
                                image:
                                    DecorationImage(
                                  image: isdownload.value == true && (widget.songImage ?? '').isNotEmpty
                                      ? FileImage(File(widget.songImage ?? ''))
                                      : CachedNetworkImageProvider(maxHeight: 500, maxWidth: 500, value.audio.audio.metas.image?.path ?? '') as ImageProvider,
                                  fit: BoxFit
                                      .cover,
                                  filterQuality:
                                      FilterQuality.low,
                                ),
                              ),
                              child:
                                  Padding(
                                padding:
                                    EdgeInsets.only(top: 60.h),
                                child:
                                    Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            /// =================== back Button ===================
                                            IconButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white,
                                                  size: 26,
                                                )),
                                            Spacer(),

                                            /// =================== Your Daily Meditation ===================
                                            Text(widget.categoryName, style: TextStyle(color: Constant.whiteColor, fontSize: 15.sp)),
                                            Spacer(),
                                            Container(
                                              width: 45.w,
                                              height: 45.h,
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                                              child: IconButton(
                                                  onPressed: () {
                                                    lockScreen.value = true;
                                                  },
                                                  icon: Icon(
                                                    Icons.lock,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),

                                        /// =================== Title ===================
                                        SizedBox(height: 10.h),
                                        TextWidget.regular(value.audio.audio.metas.title ?? "", fontFamily: "Poppins-Bold", fontSize: 25.sp, color: Constant.whiteColor),
                                      ],
                                    ),

                                    /// =================== Play ===================

                                    Spacer(),
                                    assetsAudioPlayer.builderIsPlaying(
                                      builder: (context, isPlaying) {
                                        return PlayerBuilder.isPlaying(
                                          player: assetsAudioPlayer,
                                          builder: (context, isPlaying) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  /// =================== Previous Audio ===================
                                                  Obx(
                                                    () {
                                                      previousLoader.value;
                                                      return IconButton(
                                                        disabledColor: Colors.grey,
                                                        color: Get.theme.colorScheme.primary,
                                                        onPressed: assetsAudioPlayer.playlist!.audios.first.metas.id != assetsAudioPlayer.current.value!.audio.audio.metas.id
                                                            ? previousLoader.value
                                                                ? () async {
                                                                    previousLoader.value = false;
                                                                    assetsAudioPlayer.previous().whenComplete(
                                                                          () => previousLoader.value = true,
                                                                        );
                                                                  }
                                                                : null
                                                            : null,
                                                        icon: const Icon(
                                                          Icons.skip_previous_rounded,
                                                          size: 30,
                                                          color: Colors.white,
                                                        ),
                                                      );
                                                    },
                                                  ),

                                                  /// =================== Previous Icon ===================
                                                  GestureDetector(
                                                    onTap: () {
                                                      assetsAudioPlayer.seekBy(const Duration(seconds: -15));
                                                    },
                                                    child: SvgPicture.asset('assets/icons/left15.svg', width: 30.r, height: 30.r, color: Constant.whiteColor),
                                                  ),

                                                  /// =================== Play Icon ===================
                                                  GestureDetector(
                                                    onTap: () {
                                                      assetsAudioPlayer.playOrPause();
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.white70,
                                                      radius: 30.r,
                                                      child: SvgPicture.asset(isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg', width: 40.r, height: 40.r, color: Colors.white),
                                                    ),
                                                  ),

                                                  /// =================== Next Icon ===================
                                                  GestureDetector(
                                                      onTap: () {
                                                        // if (assetsAudioPlayer.playlist!.audios.last.metas.id ==
                                                        //     assetsAudioPlayer.current.value!.audio.audio.metas.id) {
                                                        //   if (infos!.currentPosition.inSeconds <= infos.duration.inSeconds - 32) {
                                                        //     assetsAudioPlayer.seekBy(const Duration(seconds: 30));
                                                        //   } else {
                                                        //     assetsAudioPlayer
                                                        //         .seekBy(Duration(seconds: infos.duration.inSeconds - infos.currentPosition.inSeconds - 2));
                                                        //   }
                                                        // } else {
                                                        assetsAudioPlayer.seekBy(const Duration(
                                                          seconds: 15,
                                                        ));
                                                        // }
                                                      },
                                                      child: SvgPicture.asset('assets/icons/right15.svg', width: 35.r, height: 35.r, color: Constant.whiteColor)),

                                                  /// =================== Next Audio ===================
                                                  Obx(
                                                    () {
                                                      nextLoader.value;
                                                      return IconButton(
                                                        disabledColor: Colors.grey,
                                                        color: Get.theme.colorScheme.primary,
                                                        onPressed: assetsAudioPlayer.playlist!.audios.last.metas.id != assetsAudioPlayer.current.value!.audio.audio.metas.id
                                                            ? nextLoader.value
                                                                ? () {
                                                                    nextLoader.value = false;
                                                                    assetsAudioPlayer.next().whenComplete(() => nextLoader.value = true);
                                                                  }
                                                                : null
                                                            : null,
                                                        icon: const Icon(
                                                          Icons.skip_next_rounded,
                                                          size: 30,
                                                          color: Colors.white,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),

                                    /// =================== Slider ===================
                                    // SizedBox(height: 195.h),
                                    Spacer(),
                                    assetsAudioPlayer.builderRealtimePlayingInfos(builder:
                                        (context, RealtimePlayingInfos? infos) {
                                      if (assetsAudioPlayer.playlist!.audios.last.metas.id == assetsAudioPlayer.current.value!.audio.audio.metas.id && infos!.currentPosition.inSeconds == infos.duration.inSeconds - 1) {
                                        assetsAudioPlayer.stop();
                                        Get.back();
                                        return const SizedBox.shrink();
                                      } else {
                                        if ((infos?.duration ?? Duration()) > const Duration(seconds: 0)) {
                                          return PositionSeekWidget(
                                              currentPosition: infos?.currentPosition,
                                              duration: infos?.duration,
                                              seekTo: (to) {
                                                if (assetsAudioPlayer.playlist!.audios.last.metas.id == assetsAudioPlayer.current.value!.audio.audio.metas.id) {
                                                  if (to.inSeconds <= (infos!.duration.inSeconds - 2)) {
                                                    assetsAudioPlayer.seek(to);
                                                  } else {
                                                    assetsAudioPlayer.seek(Duration(seconds: infos.duration.inSeconds - 2));
                                                  }
                                                } else {
                                                  assetsAudioPlayer.seek(to);
                                                }
                                              });
                                        } else {
                                          return PositionSeekWidget(
                                            currentPosition: const Duration(minutes: 0, seconds: 0),
                                            duration: const Duration(minutes: 0, seconds: 0),
                                            seekTo: (to) {
                                              assetsAudioPlayer.seek(to);
                                            },
                                          );
                                        }
                                      }
                                    }),
                                    SizedBox(height: 25.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ///// =================== Download ===================

                                        Obx(
                                          () {
                                            if (kSleepController.isSleepScreen.value == false) {
                                              isdownload.value;
                                              songPlayerController.isDownload.value;
                                              // logger.d(songPlayerController.isDownload.value);
                                              getdownload(value.audio.audio.metas.id);
                                              return download == true
                                                  ? Container(
                                                      width: 45.w,
                                                      height: 45.h,
                                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                                                      child: Icon(Icons.download_done, size: 35, color: Color(0XFF084E60)),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () async {
                                                        if (cancel.value && isdownload.value == false) {
                                                          String audiourl = value.audio.audio.metas.album!;
                                                          String? audioid = value.audio.audio.metas.id;
                                                          String? songtitle = value.audio.audio.metas.title;
                                                          String imageUrl = value.audio.audio.metas.image!.path;
                                                          var simage = await http.get(Uri.parse(imageUrl));
                                                          File? file;
                                                          songPlayerController.isDownload.value = true;
                                                          Directory appDocDir = Platform.isAndroid ? await getApplicationDocumentsDirectory() : await getApplicationDocumentsDirectory();
                                                          if (Platform.isAndroid) {
                                                            print('path :=: ${appDocDir.path}');
                                                            Directory('${appDocDir.path}/Mp3').create();
                                                          }
                                                          file = File(Platform.isIOS ? '${appDocDir.path}/$songtitle.png' : '${appDocDir.path}/Mp3/$songtitle.png');
                                                          file.writeAsBytesSync(simage.bodyBytes);

                                                          try {
                                                            await downloadMp3(songUrl: audiourl, songtitle: songtitle, image: imageUrl).then((val) {
                                                              if (val != null) {
                                                                isdownload.value = true;
                                                                DatabaseHelper()
                                                                    .addDownload(DownloadSong(
                                                                        id: int.parse(audioid!),
                                                                        link: val,
                                                                        title: songtitle,
                                                                        imagepath: file!.path,
                                                                        // userId: userController.userId,
                                                                        songid: int.parse(value.audio.audio.metas.id!)))
                                                                    .whenComplete(() {
                                                                  songPlayerController.isDownload.value = false;
                                                                });
                                                              }
                                                            });
                                                          } catch (e) {
                                                            if (kDebugMode) {
                                                              print('ERROR IN DOWNLOAD $e');
                                                            }
                                                          }
                                                        }
                                                        cancel.value = true;
                                                      },
                                                      child: songPlayerController.isDownload.value == true
                                                          ? SizedBox(
                                                              width: 25.w,
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  cancel.value = false;
                                                                },
                                                                child: StreamBuilder<int>(
                                                                    stream: progress.stream,
                                                                    builder: (context, snapshot) {
                                                                      return CircularPercentIndicator(
                                                                        radius: 22.0,
                                                                        lineWidth: 3.0,
                                                                        animation: false,
                                                                        percent: progress / 100,
                                                                        center: new Text(
                                                                          "${progress.toInt()}%",
                                                                          style: new TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 5.0,
                                                                            color: Colors.white,
                                                                          ),
                                                                        ),
                                                                        circularStrokeCap: CircularStrokeCap.round,
                                                                        restartAnimation: false,
                                                                        progressColor: Colors.redAccent,
                                                                      );
                                                                    }),
                                                              ),
                                                            )
                                                          : Center(
                                                              child: isdownload.value == false
                                                                  ? SvgPicture.asset(
                                                                      'assets/icons/download_song.svg',
                                                                      height: 45.h,
                                                                      width: 45.w,
                                                                    )
                                                                  : Container(
                                                                      width: 45.w,
                                                                      height: 45.h,
                                                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                                                                      child: Icon(Icons.download_done, size: 30, color: Color(0XFF084E60)),
                                                                    ),
                                                            ),
                                                    );
                                            } else {
                                              return SizedBox.shrink();
                                            }
                                          },
                                        ),

                                        /// =================== Favourite ===================
                                        SizedBox(width: 10.w),

                                        Obx(() {
                                          if (kSleepController.isSleepScreen.value == false) {
                                            isSkip.value;
                                            songPlayerController.isLike.value;
                                            if (isSkip.isTrue) {
                                              return SizedBox();
                                            } else {
                                              return IconButton(
                                                iconSize: 45,
                                                splashRadius: 1.0,
                                                onPressed: () async {
                                                  // setState(() {});
                                                  var uid = await LocalStorageServices().box.read('uid');

                                                  songPlayerController.favouriteMeditationController(postid: widget.id, userid: uid).then((val) {
                                                    songPlayerController.userFavouriteServices(context, 1);
                                                    print('val?.relaxMeditation[0].success :: ${val?.relaxMeditation[0].success}');
                                                    // await songPlayerController.getFavouriteAudioController(userid: uid);
                                                    val?.relaxMeditation[0].success == "1" ? songPlayerController.isLike.value = true : songPlayerController.isLike.value = false;
                                                  }).whenComplete(() {
                                                    songPlayerController.update();
                                                    setState(() {});
                                                  });
                                                },
                                                icon: songPlayerController.isLike.value == true
                                                    ? Container(
                                                        alignment: Alignment.center,
                                                        height: 45.h,
                                                        width: 45.w,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: AssetImage('assets/icons/Group 64.png'),
                                                          ),
                                                        ),
                                                        child: SvgPicture.asset(
                                                          'assets/icons/Vectorhartred.svg',
                                                        ))
                                                    : Container(
                                                        width: 45.w,
                                                        height: 45.h,
                                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                                                        child: Icon(Icons.favorite_border_rounded, size: 30, color: Color(0XFF084E60)),
                                                      ),
                                              );
                                            }
                                          } else {
                                            return SizedBox.shrink();
                                          }
                                        })
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),

                          ///  ============ Lock Screen =============
                          Visibility(
                              visible:
                                  lockScreen
                                      .value,
                              child:
                                  Container(
                                decoration:
                                    BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                  Color.fromRGBO(
                                      0,
                                      45,
                                      56,
                                      0.9),
                                  Color.fromRGBO(
                                      0,
                                      45,
                                      56,
                                      0.9)
                                ])),
                                child:
                                    Padding(
                                  padding: const EdgeInsets
                                      .only(
                                      right: 10.0),
                                  child:
                                      Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 60.0.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 45.w,
                                            height: 45.h,
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                                            child: IconButton(
                                                onPressed: () {
                                                  lockScreen.value = false;
                                                },
                                                icon: Icon(
                                                  Icons.lock_open_rounded,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Center(child: assetsAudioPlayer.builderCurrentPosition(builder: (context, duration) {
                                        return Text(
                                          '${timeFormat(duration)}',
                                          style: TextStyle(color: Colors.white, fontSize: 80.sp),
                                        );
                                      })),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      );
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
