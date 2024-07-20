// // ignore_for_file: must_be_immutable
//
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// // import 'package:meditation/Controller/song_controller.dart';
// import 'package:meditation/Controller/bottom_navigator_controller.dart';
// import 'package:meditation/Controller/homescreen_controller.dart';
// // import 'package:meditation/Controller/song_details_controller.dart';
// import 'package:meditation/Controller/song_player_controller/song_player_controller.dart';
//
// // import '../../constant.dart';
// import '../../../Constant/constant.dart';
//
// import '../../utils/bottom_sheet/playing_controls.dart';
//
// class SingleSongScreen extends StatelessWidget {
//   SingleSongScreen({Key? key, this.data, required this.index, this.id}) : super(key: key);
//   int index;
//   var data;
//
//   String? id;
//
//   final HomeController getCategory = Get.put(HomeController());
//   final SongPlayerController songController = Get.put(SongPlayerController());
//   final BottomNavigatorController bottomNavigatorController = Get.put(BottomNavigatorController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           /// =================== Background Image ===================
//           Positioned.fill(
//             child: Container(
//               child: Image.network(data!.mp3Image, fit: BoxFit.cover),
//             ),
//           ),
//           Container(
//             height: 812.h,
//             width: 375.w,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 30.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 30.0.w, top: 25.h),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Icon(Icons.arrow_back, color: Constant.whiteColor, size: 24.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 100.w, top: 236.h),
//                   child: PlayerBuilder.isPlaying(
//                     player: songController.assetsAudioPlayer,
//                     builder: (context, isPlaying) {
//                       print('Song playing value===== $isPlaying');
//                       return PlayingControlls(
//                           isPlaying: isPlaying,
//                           onPrevious: () {
//                             print(' onPrevious Song play thy gyu');
//                             songController.assetsAudioPlayer.previous();
//                             print('PREVIOUS SONG');
//                           },
//                           onPlay: () {
//                             songController.unlockk();
//                             songController.status.value == true ? songController.status.value : songController.status.value = true;
//                             if (songController.unlock.value) {
//                               songController.assetsAudioPlayer.builderLoopMode(
//                                 builder: (context, loopMode) {
//                                   return songController.assetsAudioPlayer.builderCurrent(
//                                     builder: (BuildContext context, Playing playing) {
//                                       songController.images.value = songController.find(audios, playing.audio.assetAudioPath).metas.image!.path;
//                                       songController.data.value = true;
//                                       return Container();
//                                     },
//                                   );
//                                 },
//                               );
//                               print("playing song${data!.mp3Url}");
//                               songController.openPlayer(
//                                   audioUrl: data!.mp3Url,
//                                   startIndex: index,
//                                   metasImage: data!.mp3Image,
//                                   title: data!.mp3Title,
//                                   album: data!.categoryName);
//                               songController.getTitle.value = data!.mp3Title;
//                               songController.songUrl.value = data!.mp3Url;
//                               songController.subTitle.value = data!.categoryName;
//                               songController.images.value = data!.mp3Image;
//                             }
//                             songController.assetsAudioPlayer.playOrPause();
//                             print('PLAY PAUSE SONG');
//                           },
//                           onNext: () {
//                             print('onNext Song play thy gyu');
//                             songController.assetsAudioPlayer.next();
//                             print('NEXT SONG');
//                           },
//                           priwidht: 30,
//                           prihight: 30,
//                           nextwidth: 30,
//                           nexthight: 30,
//                           playwidth: 60,
//                           playhight: 60,
//                           iconStopWidth: 0,
//                           iconStopHeight: 0,
//                           iconStopSize: 0,
//                           iconexthight: 15,
//                           iconextwidth: 0,
//                           icoplayhight: 38,
//                           icoplaywidth: 28,
//                           icoprihight: 15,
//                           icopriwidht: 15);
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 58.h),
//                 Column(
//                   children: [
//                     Text(
//                       data!.mp3Title.isEmpty ? " " : data!.mp3Title,
//                       style: TextStyle(fontSize: 20.sp, color: Constant.whiteColor),
//                     ),
//                     SizedBox(height: 3.h),
//                     Text(
//                       data!.categoryName.isEmpty ? " " : data!.categoryName,
//                       style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Constant.whiteColor),
//                     ),
//                     SizedBox(height: 23.h),
//                     Padding(
//                       padding: EdgeInsets.only(left: 31.0.w, right: 30.w),
//                       child: Center(
//                         child: Html(
//                           data: """${data!.mp3Description.isEmpty ? " " : data!.mp3Description}""",
//                           shrinkWrap: true,
//                           style: {
//                             "body": Style(fontSize: FontSize(12.0.sp), color: Constant.whiteColor),
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text('data', style: TextStyle(color: Colors.white)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
