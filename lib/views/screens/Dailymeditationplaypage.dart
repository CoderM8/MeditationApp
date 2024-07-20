import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:logger/logger.dart';
import 'package:meditation/Controller/song_player_controller/song_player_controller.dart';

// import '../../constant/audio_constant.dart';
import '../../main.dart';
import '../../model/play/position_seek_widget.dart';
import '../../services/local_storage_service.dart';

class Dailymeditationplaypage extends StatefulWidget {
  final String? categoryImage;
  final String? categoryName;
  final String? mp3Description;
  final String? mp3Url;
  final String? id;
  final bool? isFavourite;
  final String? mp3Title;
  final Duration? time;

  Dailymeditationplaypage(
      {Key? key,
      this.categoryName,
      this.categoryImage,
      this.isFavourite,
      this.mp3Description,
      this.mp3Title,
      this.mp3Url,
      this.time,
      this.id})
      : super(key: key);

  @override
  State<Dailymeditationplaypage> createState() =>
      _DailymeditationplaypageState();
}

class _DailymeditationplaypageState extends State<Dailymeditationplaypage>
    with TickerProviderStateMixin {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  Duration position = new Duration();
  RxBool playButton = true.obs;
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  Timer? _timer;

  @override
  void initState() {
    print('id 👍👍👍👍👍👍👍👍👍👍👍👍 ${widget.id}');
    startBreathingCycle();
    try {
      _assetsAudioPlayer.open(
        Audio.network(widget.mp3Url ?? '',
            metas: Metas(
              title: widget.mp3Title,
              image: MetasImage.network(
                widget.categoryImage ?? '',
              ),
            )),
        playInBackground: PlayInBackground.enabled,
        loopMode: LoopMode.single,
        autoStart: true,
        notificationSettings: NotificationSettings(
          playPauseEnabled: true,
        ),
        showNotification: true,
      );
    } catch (error, t) {
      logger.log(Level.info, 'error123 :: $error', stackTrace: t);
    }
    super.initState();
  }

  void startBreathingCycle() {
    _timer = Timer(widget.time!, () {
      _assetsAudioPlayer.stop();
      Get.back();
    });
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    _assetsAudioPlayer.onErrorDo = (handler) {
      print('🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕🚕');
      handler.player.stop();
    };
    return WillPopScope(
      onWillPop: () async {
        _assetsAudioPlayer.stop();
        _stopTimer();
        Get.back();
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    maxHeight: 500,
                    maxWidth: 500,
                    widget.categoryImage ?? '',
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low)),
          child: Padding(
            padding:
                EdgeInsets.only(left: 30.0.w, right: 30.0.w, bottom: 30.0.h),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _assetsAudioPlayer.stop();
                        _stopTimer();
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/Vectorrongwhite.svg',
                        height: 22.h,
                        width: 22.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  "Your Daily Meditation",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 5.h),
                Text(
                  widget.categoryName ?? '',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _assetsAudioPlayer.seek(Duration(
                            seconds: _assetsAudioPlayer
                                    .currentPosition.value.inSeconds -
                                15));
                      },
                      child: GlassContainer(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 50.w,
                        borderRadius: BorderRadius.circular(30.r),
                        borderColor: Colors.transparent,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.40),
                            Colors.white.withOpacity(0.10)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.60),
                            Colors.white.withOpacity(0.10),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.39, 1.0],
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Group 340.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    StreamBuilder<Playing?>(
                        stream: _assetsAudioPlayer.current,
                        builder: (context, isPlaying) {
                          return GestureDetector(
                            onTap: () {
                              _assetsAudioPlayer.playOrPause();
                              playButton.value = !playButton.value;
                              if (playButton.value == true) {
                                _stopTimer();
                              }
                            },
                            child: GlassContainer(
                              height: 90.h,
                              blur: 10,
                              width: 90.w,
                              shape: BoxShape.circle,
                              borderColor: Colors.transparent,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.40),
                                  Colors.white.withOpacity(0.10)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderGradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.60),
                                  Colors.white.withOpacity(0.10),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.39, 1.0],
                              ),
                              child: StreamBuilder<bool>(
                                  stream: _assetsAudioPlayer.isPlaying,
                                  builder: (context, snapshot) {
                                    return Icon(
                                      _assetsAudioPlayer.isPlaying.value
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 50.sp,
                                    );
                                  }),
                            ),
                          );
                        }),
                    SizedBox(
                      width: 27,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _assetsAudioPlayer.seek(Duration(
                            seconds: _assetsAudioPlayer
                                    .currentPosition.value.inSeconds +
                                15));
                      },
                      child: GlassContainer(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 50.w,
                        borderRadius: BorderRadius.circular(30.r),
                        borderColor: Colors.transparent,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.40),
                            Colors.white.withOpacity(0.10)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.60),
                            Colors.white.withOpacity(0.10),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.39, 1.0],
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Group 341.svg',
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                StreamBuilder<Duration>(
                    stream: _assetsAudioPlayer.currentPosition,
                    builder: (context, snapshot) {
                      return _assetsAudioPlayer.builderRealtimePlayingInfos(
                          builder: (context, RealtimePlayingInfos? infos) {
                        if (/*_assetsAudioPlayer.playlist?.audios.last.metas.id == _assetsAudioPlayer.current.value?.audio.audio.metas.id &&*/
                            infos?.currentPosition.inSeconds ==
                                (infos?.duration.inSeconds ?? 0 - 1)) {
                          return SizedBox();
                        } else {
                          if (infos!.duration > const Duration(seconds: 0)) {
                            return PositionSeekWidget(
                                currentPosition: infos.currentPosition,
                                duration: infos.duration,
                                seekTo: (to) {
                                  // if (_assetsAudioPlayer.playlist!.audios.last.metas.id == _assetsAudioPlayer.current.value!.audio.audio.metas.id) {
                                  if (to.inSeconds <=
                                      infos.duration.inSeconds - 2) {
                                    _assetsAudioPlayer.seek(to);
                                  } else {
                                    _assetsAudioPlayer.seek(Duration(
                                        seconds: infos.duration.inSeconds - 2));
                                  }
                                  // } else {
                                  //   _assetsAudioPlayer.seek(to);
                                  // }
                                });
                          } else {
                            return PositionSeekWidget(
                              currentPosition:
                                  const Duration(minutes: 0, seconds: 0),
                              duration: const Duration(minutes: 0, seconds: 0),
                              seekTo: (to) {
                                _assetsAudioPlayer.seek(to);
                              },
                            );
                          }
                        }
                      });
                    }),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 34.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white10,
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/icons/Rectangle2.png'),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Vectormusic.svg',
                            height: 15.h,
                            width: 25.w,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Background Sounds',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(width: 110),
                    Spacer(),
                    Obx(() {
                      songPlayerController.isLike.value;
                      return IconButton(
                        iconSize: 45,
                        splashRadius: 1.0,
                        onPressed: () async {
                          await songPlayerController
                              .favouriteMeditationController(
                                  postid: widget.id,
                                  userid:
                                      LocalStorageServices().box.read('uid'))
                              .then((val) async {
                            val!.relaxMeditation[0].success == "1"
                                ? songPlayerController.isLike.value = true
                                : songPlayerController.isLike.value = false;
                            await songPlayerController.userFavouriteServices(
                                context, 1);
                            // await songPlayerController.getFavouriteAudioController(userid: LocalStorageServices().box.read('uid'));
                          }).whenComplete(() => songPlayerController.update());
                        },
                        icon: songPlayerController.isLike.value == true
                            ? Container(
                                alignment: Alignment.center,
                                height: 34.h,
                                width: 34.w,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20), color: Colors.white10,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/icons/Group 64.png'),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/Vectorhartred.svg',
                                  // height: 15.h,
                                  // width: 25.w,
                                ))
                            : Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70),
                                child: Icon(Icons.favorite_border_rounded,
                                    size: 15, color: Color(0XFF084E60)),
                              ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
