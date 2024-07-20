import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/controller_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

RxBool playerVisible = false.obs;
List<Audio> playList = [];
List<SongListModel> songListModel = [];
AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');
RxBool nextSong = true.obs;

class SongListModel {
  SongListModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.url});

  final String id;
  final String image;
  final String title;
  final String url;
}

Future<void> selectSong({int? index}) async {
  playList.clear();
  try {
    for (var i = 0; i < songListModel.length; i++) {
      if (songListModel[i].image.contains('http')) {
        playList.add(
          Audio.network(
            songListModel[i].url,
            metas: Metas(
              id: songListModel[i].id.toString(),
              title: songListModel[i].title,
              album: songListModel[i].url,
              image: MetasImage.network(songListModel[i].image),
            ),
          ),
        );
      } else {
        playList.add(
          Audio.file(
            songListModel[i].url,
            metas: Metas(
              id: songListModel[i].id.toString(),
              title: songListModel[i].title,
              album: songListModel[i].url,
              image: MetasImage.file(songListModel[i].image),
            ),
          ),
        );
      }
    }
    final RxBool nextLoader = true.obs;
    final RxBool previousLoader = true.obs;
    await assetsAudioPlayer.open(
      Playlist(audios: playList, startIndex: index ?? 0),
      showNotification: true,
      autoStart: true,
      notificationSettings: NotificationSettings(
        stopEnabled: true,
        nextEnabled: true,
        prevEnabled: true,
        playPauseEnabled: true,
        customStopAction: (value) {
          playList.clear();
          value.stop();
          playerVisible.value = false;
        },
        customPrevAction: (value) {
          if (previousLoader.value) {
            previousLoader.value = false;
            assetsAudioPlayer
                .previous()
                .whenComplete(() => previousLoader.value = true);
          }
        },
        customNextAction: (value) {
          if (nextLoader.value) {
            nextLoader.value = false;
            assetsAudioPlayer
                .next()
                .whenComplete(() => nextLoader.value = true);
          }
        },
      ),
    );
    playerVisible.value = true;
    await assetsAudioPlayer.play();
  } catch (e, trace) {
    if (kDebugMode) {
      print(e);
    }
    if (kDebugMode) {
      print(trace);
    }
  }
}

Widget slidablePanelHeader(
    {required BuildContext context,
    required VoidCallback onTap,
    String? songImage}) {
  return Obx(
    () {
      return playerVisible.value
          ? Slidable(
              /// =================== Start Action panel ===================
              startActionPane: ActionPane(
                extentRatio: 0.16,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                      onPressed: (val) {
                        playerVisible.value = false;
                        kSleepController.isSleepScreen.value = false;
                        assetsAudioPlayer.stop();
                      },
                      backgroundColor: Constant.lightThemeColor,
                      foregroundColor: Constant.whiteColor,
                      icon: Icons.close),
                ],
              ),

              /// =================== End Action Panel ===================
              endActionPane: ActionPane(
                extentRatio: 0.16,
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                      onPressed: (val) {
                        playerVisible.value = false;
                        kSleepController.isSleepScreen.value = false;
                        assetsAudioPlayer.stop();
                      },
                      backgroundColor: Constant.lightThemeColor,
                      foregroundColor: Constant.whiteColor,
                      icon: Icons.close),
                ],
              ),
              child: assetsAudioPlayer.builderRealtimePlayingInfos(
                builder: (context, RealtimePlayingInfos? infos) {
                  return PlayerBuilder.current(
                    player: assetsAudioPlayer,
                    builder: (context, value) {
                      return GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 7.h),
                          width: MediaQuery.of(context).size.width,
                          height: Platform.isIOS ? 85.r : 75.r,
                          color: Get.theme.colorScheme.surface,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// =================== Image ===================
                              StreamBuilder<bool>(
                                  stream: isdownload.stream,
                                  builder: (context, snapshot) {
                                    return Container(
                                      height: 60.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: isdownload.value == true &&
                                                    (songImage ?? '').isNotEmpty
                                                ? FileImage(
                                                    File(songImage ?? ''))
                                                : CachedNetworkImageProvider(
                                                    maxHeight: 500,
                                                    maxWidth: 500,
                                                    value.audio.audio.metas
                                                            .image?.path ??
                                                        '') as ImageProvider,
                                            fit: BoxFit.fill,
                                            filterQuality: FilterQuality.low),
                                      ),
                                    );
                                  }),
                              /*!value.audio.audio.metas.image!.path.contains('http')
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.r),
                                        child:
                                            Image.file(File(value.audio.audio.metas.image!.path), fit: BoxFit.cover, width: 50.w, height: 60.h),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CachedNetworkImage(imageUrl: value.audio.audio.metas.image!.path, width: 50.w, height: 60.h
                                          // radius: 10.r,
                                          ),
                                    ),*/

                              /// =================== Title Text ===================
                              SizedBox(
                                  width: 190.w,
                                  child: Text(value.audio.audio.metas.title!,
                                      overflow: TextOverflow.ellipsis)),

                              PlayerBuilder.isPlaying(
                                player: assetsAudioPlayer,
                                builder: (context, isPlaying) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /// =================== Play Button ===================
                                      GestureDetector(
                                        onTap: () {
                                          assetsAudioPlayer.playOrPause();
                                        },
                                        child: SvgPicture.asset(
                                            isPlaying
                                                ? 'assets/icons/pause.svg'
                                                : 'assets/icons/play.svg',
                                            width: isPlaying ? 22.r : 30.r,
                                            height: isPlaying ? 22.r : 30.r,
                                            color:
                                                Get.theme.colorScheme.primary),
                                      ),

                                      /// =================== Skip Icon ===================
                                      Obx(
                                        () {
                                          nextSong.value;
                                          return IconButton(
                                            disabledColor: Colors.grey,
                                            color:
                                                Get.theme.colorScheme.primary,
                                            onPressed: nextSong.value
                                                ? () async {
                                                    nextSong.value = false;
                                                    assetsAudioPlayer
                                                        .next()
                                                        .whenComplete(() =>
                                                            nextSong.value =
                                                                true);
                                                  }
                                                : null,
                                            icon: Icon(Icons.skip_next_rounded,
                                                size: 25.sp),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          : const SizedBox.shrink();
    },
  );
}
