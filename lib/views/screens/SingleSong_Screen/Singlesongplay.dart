// // ignore_for_file: must_be_immutable
//
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:meditation/Controller/song_controller.dart';
// import 'package:meditation/Controller/homescreen_controller.dart';
// import 'package:meditation/model/play/position_seek_widget.dart';
// import 'package:meditation/views/utils/bottom_sheet/playing_controls.dart';
// import '../../constant.dart';
//
// class BottomSheetBody extends StatelessWidget {
//   var data;
//   final String backgroundImage;
//
//   BottomSheetBody({Key? key, this.data, required this.backgroundImage}) : super(key: key);
//   final SongController songController = Get.put(SongController());
//   final HomeController getCategory = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Container(
//                 child: Image.network(backgroundImage, fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               height: 812.h,
//               width: 375.w,
//               child: Column(
//                 children: [
//                   SizedBox(height: 30.h),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30.0.w),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: SvgPicture.asset("assets/icons/dropdown.svg", width: 11.w, height: 20.h, fit: BoxFit.scaleDown),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30.0.w, top: 0.h, right: 30.w),
//                     child: Column(
//                       children: [
//                         Text(
//                           songController.getTitle.value,
//                           style: TextStyle(fontSize: 20.sp, color: Constant.whiteColor),
//                         ),
//                         SizedBox(height: 5.h),
//                         Text(
//                           songController.subTitle.value,
//                           style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Constant.whiteColor),
//                         ),
//                         SizedBox(height: 188.h),
//                         Stack(
//                           children: <Widget>[
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 40.w),
//                                   child: songController.assetsAudioPlayer.builderLoopMode(
//                                     builder: (context, loopMode) {
//                                       return PlayerBuilder.isPlaying(
//                                         player: songController.assetsAudioPlayer,
//                                         builder: (context, isPlaying) {
//                                           return PlayingControlls(
//                                               isPlaying: isPlaying,
//                                               onPrevious: () {
//                                                 print(' onPrevious Song play thy gyu');
//                                                 songController.assetsAudioPlayer.previous();
//                                                 print('PREVIOUS SONG');
//                                               },
//                                               onPlay: () {
//                                                 /*songController.unlockk();
//                                               songController.status.value ==
//                                                       true
//                                                   ? songController.status.value
//                                                   : songController
//                                                       .status.value = true;
//                                               if (songController.unlock.value) {
//                                                 songController.openPlayer(
//                                                     startIndex: 0,
//                                                     audioUrl: songController
//                                                         .songUrl.value,
//                                                   album: songController.subTitle.value,
//                                                   title: songController.getTitle.value,
//                                                   metasImage: songController.images.value
//                                                 );
//                                               }*/
//                                                 songController.assetsAudioPlayer.playOrPause();
//                                                 songController.update();
//                                                 isPlaying ? songController.data.value = true : songController.data.value = false;
//                                                 print('PLAY PAUSE SONG');
//                                               },
//                                               onNext: () {
//                                                 print('onNext Song play thy gyu');
//                                                 songController.assetsAudioPlayer.next();
//                                                 print('NEXT SONG');
//                                               },
//                                               priwidht: 50,
//                                               prihight: 50,
//                                               nextwidth: 50,
//                                               nexthight: 50,
//                                               playwidth: 80,
//                                               playhight: 80,
//                                               iconStopSize: 0,
//                                               iconStopHeight: 0,
//                                               iconStopWidth: 0,
//                                               iconexthight: 26,
//                                               iconextwidth: 27,
//                                               icoplayhight: 38,
//                                               icoplaywidth: 28,
//                                               icoprihight: 26,
//                                               icopriwidht: 27);
//                                         },
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(height: 180.h),
//                                 songController.assetsAudioPlayer.builderRealtimePlayingInfos(
//                                   builder: (context, RealtimePlayingInfos infos) {
//                                     return Column(
//                                       children: [
//                                         PositionSeekWidget(
//                                           currentPosition: infos.currentPosition,
//                                           duration: infos.duration,
//                                           seekTo: (to) {
//                                             songController.assetsAudioPlayer.seek(to);
//                                           },
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                                 SizedBox(height: 53.h),
//                                 Row(
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           height: 34.h,
//                                           width: 150.w,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(20.r),
//                                             color: Colors.white10,
//                                             image: DecorationImage(
//                                               fit: BoxFit.fill,
//                                               image: AssetImage('assets/icons/Rectangle2.png'),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(left: 11.w, top: 10.h, bottom: 9.h),
//                                           child: Row(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {},
//                                                 child: Row(
//                                                   children: [
//                                                     SvgPicture.asset('assets/icons/music.svg', height: 15.h, width: 25.w),
//                                                     SizedBox(width: 5.w),
//                                                     Text(
//                                                       'Background Sounds',
//                                                       style: TextStyle(fontSize: 10.sp, color: Constant.whiteColor),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(width: 110.w),
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           height: 34.h,
//                                           width: 34.w,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             image: DecorationImage(
//                                               fit: BoxFit.fill,
//                                               image: AssetImage('assets/icons/Rectangle2.png'),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: InkWell(
//                                               onTap: () {},
//                                               child: SvgPicture.asset('assets/icons/unfilled_heart.svg'),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
