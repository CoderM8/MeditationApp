import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meditation/Controller/bottom_navigator_controller.dart';
import 'package:meditation/Controller/song_details_controller.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

import '../../../generated/l10n.dart';
import '../../../main.dart';
import '../alert_dialog/exit_app.dart';

class BottomNavigator extends StatefulWidget {
  final Function()? onPlay;
  final int tab;

  BottomNavigator({this.tab = 0, this.onPlay});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final BottomNavigatorController bottomNavigatorController =
      Get.put(BottomNavigatorController());

  SongDetailsController songDetailsController =
      Get.put(SongDetailsController());
  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// second code
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop(context);
      },
      child: StreamBuilder<int>(
          stream: bottomNavigatorController.index.stream,
          builder: (context, snapshot) {
            return Scaffold(
              extendBody: true,
              bottomNavigationBar: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Spacer(),
                  slidablePanelHeader(
                    context: context,
                    onTap: () async {
                      try {
                        Get.to(
                          () => SongScreen(
                            id: assetsAudioPlayer
                                    .current.value?.audio.audio.metas.id ??
                                '',
                            categoryName: '',
                          ),
                          transition: Transition
                              .native, /* duration: const Duration(seconds: 1)*/
                        );
                      } catch (error, link) {
                        logger.log(Level.error, 'error :: $error',
                            stackTrace: link);
                      }
                    },
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide.none),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.7),
                          Colors.black
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.2, 0.3, 0.4, 0.6, 0.8, 1],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                    child: BottomNavigationBar(
                        backgroundColor: Colors.transparent,
                        landscapeLayout:
                            BottomNavigationBarLandscapeLayout.centered,
                        type: BottomNavigationBarType.values[0],
                        selectedItemColor: const Color(0xffffffff),
                        unselectedItemColor: Colors.grey,
                        onTap: (index) {
                          bottomNavigatorController.index.value = index;
                        },
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              activeIcon: Image.asset('assets/icons/home.png',
                                  color: Colors.white, height: 20.h),
                              icon: Image.asset('assets/icons/home.png',
                                  color: Colors.grey, height: 20.h),
                              label: S.of(context).home),
                          BottomNavigationBarItem(
                              activeIcon: Image.asset(
                                  'assets/icons/meditation.png',
                                  color: Colors.white,
                                  height: 20.h),
                              icon: Image.asset('assets/icons/meditation.png',
                                  color: Colors.grey, height: 20.h),
                              label: S.of(context).meditation),
                          BottomNavigationBarItem(
                              activeIcon: Image.asset('assets/icons/sleep.png',
                                  color: Colors.white, height: 20.h),
                              icon: Image.asset('assets/icons/sleep.png',
                                  color: Colors.grey, height: 20.h),
                              label: S.of(context).sleepText),
                          BottomNavigationBarItem(
                              activeIcon: Image.asset('assets/icons/music.png',
                                  color: Colors.white, height: 20.h),
                              icon: Image.asset('assets/icons/music.png',
                                  color: Colors.grey, height: 20.h),
                              label: S.of(context).music),
                          BottomNavigationBarItem(
                              activeIcon: Image.asset(
                                  'assets/icons/profile.png',
                                  color: Colors.white,
                                  height: 20.h),
                              icon: Image.asset('assets/icons/profile.png',
                                  color: Colors.grey, height: 20.h),
                              label: S.of(context).profile),
                        ],
                        currentIndex: bottomNavigatorController.index.value),
                  ),
                ],
              ),
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: IndexedStack(
                    index: bottomNavigatorController.index.value,
                    children: bottomNavigatorController.tabPage),
              ),
            );
          }),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExitApp();
      },
    );
    return true;
  }

  /// =================== Bottom Sheet Header ===================
  // Widget bottomSheetHeader({double? panelWidth, double? panelHeight}) {
  //   return Container(
  //     height: panelHeight,
  //     width: panelWidth,
  //     color: Color(0x1FFFFFFF),
  //     child: Padding(
  //       padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h, bottom: 10.h),
  //       child: Row(
  //         children: [
  //           /// =================== Network Image ===================
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(5.r),
  //             child: Image.network(songController.images.value, fit: BoxFit.cover, height: 60.h, width: 50.w),
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               /// =================== Title Text ===================
  //               SizedBox(
  //                 width: 130.w,
  //                 child: Text(
  //                   songController.getTitle.value,
  //                   style: TextStyle(fontSize: 16.sp, color: Constant.blackColor),
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //
  //               /// =================== Subtitle Text ===================
  //               Text(
  //                 songController.subTitle.value,
  //                 style: TextStyle(fontSize: 16.sp, color: Constant.blackColor),
  //               ),
  //             ],
  //           ),
  //
  //           /// =================== Backward Icon ===================
  //           Container(
  //             height: 30.h,
  //             width: 30.h,
  //             decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white38),
  //             child: Center(child: SvgPicture.asset('assets/icons/backward.svg', color: Constant.blackColor, height: 20.h, width: 20.h)),
  //           ),
  //
  //           Container(
  //             height: 30.h,
  //             width: 30.w,
  //             decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white38),
  //             // child: Center(
  //             //   child: InkWell(
  //             //     onTap: onPlay,
  //             //     child: isPlaying
  //             //         ? Icon(Icons.pause, color: Constant.whiteColor, size: 50.sp)
  //             //         : Icon(Icons.play_arrow_rounded, color: Constant.whiteColor, size: 50.sp),
  //             //   ),
  //             // ),
  //           ),
  //
  //           // InkWell(
  //           //   onTap: onPlay,
  //           //   child: isPlaying!
  //           //       ? Icon(Icons.pause, color: Constant.whiteColor, size: 50.sp)
  //           //       : Icon(Icons.play_arrow_rounded, color: Constant.whiteColor, size: 50.sp),
  //           // ),
  //
  //           /// =================== Forward Icon ===================
  //           Container(
  //             height: 30.h,
  //             width: 30.h,
  //             decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white38),
  //             child: Center(child: SvgPicture.asset('assets/icons/forward.svg', color: Constant.blackColor, height: 20.h, width: 20.h)),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //   //     Container(
  //   //   height: panelHeight,
  //   //   width: panelWidth,
  //   //   color: Color(0x1FFFFFFF),
  //   //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
  //   //   child: Row(
  //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   //     crossAxisAlignment: CrossAxisAlignment.center,
  //   //     children: [
  //   //       ClipRRect(
  //   //         borderRadius: BorderRadius.circular(5.r),
  //   //         child: Image.network(songController.images.value, fit: BoxFit.cover, height: 60.h, width: 50.w),
  //   //       ),
  //   //       Column(
  //   //         crossAxisAlignment: CrossAxisAlignment.start,
  //   //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //   //         children: [
  //   //           SizedBox(
  //   //             width: 130.w,
  //   //             child: Text(
  //   //               songController.getTitle.value,
  //   //               style: TextStyle(fontSize: 16.sp, color: Constant.blackColor),
  //   //               overflow: TextOverflow.ellipsis,
  //   //             ),
  //   //           ),
  //   //           Text(
  //   //             songController.subTitle.value,
  //   //             style: TextStyle(fontSize: 16.sp, color: Constant.blackColor),
  //   //           ),
  //   //         ],
  //   //       ),
  //   //       Container(
  //   //         padding: EdgeInsets.only(left: 10.0.w),
  //   //         child: songController.assetsAudioPlayer.builderLoopMode(
  //   //           builder: (context, loopMode) {
  //   //             return PlayerBuilder.isPlaying(
  //   //               player: songController.assetsAudioPlayer,
  //   //               builder: (context, isPlaying) {
  //   //                 return PlayingControlls(
  //   //                     isPlaying: isPlaying,
  //   //                     rewind: () {
  //   //                       songController.assetsAudioPlayer.seekBy(const Duration(seconds: -15));
  //   //                     },
  //   //                     onPlay: () {
  //   //                       songController.assetsAudioPlayer.playOrPause();
  //   //                     },
  //   //                     forward: () {
  //   //                       songController.assetsAudioPlayer.seekBy(const Duration(seconds: 15));
  //   //                     },
  //   //                     onStop: () {
  //   //                       songController.assetsAudioPlayer.pause();
  //   //                       songController.showNotification.value = false;
  //   //                       bottomNavigatorController.weSlideController.hide();
  //   //                       bottomNavigatorController.sizes.value = 0.0;
  //   //                       bottomNavigatorController.bottomSheetVisibility.value = false;
  //   //                     },
  //   //                     priwidht: 15,
  //   //                     prihight: 15,
  //   //                     playwidth: 15,
  //   //                     playhight: 15,
  //   //                     nextwidth: 15,
  //   //                     nexthight: 15,
  //   //                     iconStopHeight: 15,
  //   //                     iconStopSize: 15,
  //   //                     iconStopWidth: 15,
  //   //                     iconexthight: 10,
  //   //                     iconextwidth: 10,
  //   //                     icoplayhight: 10,
  //   //                     icoplaywidth: 10,
  //   //                     icoprihight: 10,
  //   //                     icopriwidht: 10);
  //   //               },
  //   //             );
  //   //           },
  //   //         ),
  //   //       ),
  //   //     ],
  //   //   ),
  //   // );
  // }
}
