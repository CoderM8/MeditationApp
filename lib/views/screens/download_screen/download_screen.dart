import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Constant/constant.dart';
import '../../../Controller/song_player_controller/song_player_controller.dart';
import '../../../Controller/user_controller/user_controller.dart';
import '../../../constant/audio_constant.dart';
import '../../../constant/databse/database.dart';
import '../../../constant/textwidget_constant.dart';
import '../../../model/download_model/download_model.dart';
import '../songplayerscreen/songplayer.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());
  RxInt? ind;

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
        child: Obx(
          () {
            songPlayerController.isdelete.value;
            return FutureBuilder<List<DownloadSong>>(
              future: DatabaseHelper().getDownloadSongs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              /// =================== Back Arrow ===================

                              BackButton(color: Colors.white),

                              /// =================== Favourite ===================
                              SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width / 3.6),
                              Text('Download',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Constant.whiteColor)),
                            ],
                          ),
                          AnimationLimiter(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () async {
                                    showLoader(context);
                                    songListModel.clear();
                                    for (int i = 0;
                                        i < snapshot.data!.length;
                                        i++) {
                                      songListModel.add(SongListModel(
                                          id: snapshot.data![i].id.toString(),
                                          image: snapshot.data![i].imagepath!,
                                          title: snapshot.data![i].title!,
                                          url: snapshot.data![i].link!));
                                    }
                                    await selectSong(index: index).whenComplete(
                                        () => hideLoader(context));
                                    ind?.value = index;
                                    Get.to(
                                      () => SongScreen(
                                          id: snapshot.data?[index].id
                                                  .toString() ??
                                              '',
                                          categoryName: '',
                                          songImage:
                                              snapshot.data?[index].imagepath ??
                                                  ''),
                                      transition: Transition.native,
                                    );
                                  },
                                  child: AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 300),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.w, vertical: 6.h),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Get.theme.colorScheme
                                                  .onPrimaryContainer,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                /// =================== Image ===================
                                                Container(
                                                  height: 70.h,
                                                  width: 70.w,
                                                  margin: EdgeInsets.all(3.r),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      image: DecorationImage(
                                                          image: FileImage(File(
                                                              snapshot
                                                                  .data![index]
                                                                  .imagepath!)),
                                                          fit: BoxFit.cover)),
                                                ),

                                                /// =================== Title Text ===================
                                                SizedBox(width: 5.w),
                                                SizedBox(
                                                  width: 230.w,
                                                  child: TextWidget.regular(
                                                      snapshot
                                                          .data![index].title!,
                                                      fontFamily:
                                                          "Poppins-Bold",
                                                      fontSize: 16.sp,
                                                      textAlign:
                                                          TextAlign.start,
                                                      textOverflow: TextOverflow
                                                          .ellipsis),
                                                ),

                                                /// =================== Show Dialog ===================
                                                GestureDetector(
                                                  onTap: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Dialog(
                                                          child: SizedBox(
                                                            height: 150.h,
                                                            width: 100.w,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Are you sure delete?',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          20.sp),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        20.h),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.h,
                                                                        width:
                                                                            75.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Constant.greyColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.r),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child: Text(
                                                                              'Cancel',
                                                                              style: TextStyle(color: Constant.whiteColor)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 10
                                                                            .w),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        songPlayerController
                                                                            .isdelete
                                                                            .value = true;
                                                                        songPlayerController
                                                                            .isdelete
                                                                            .value = false;
                                                                        await DatabaseHelper().deleteDownloadSongs(snapshot
                                                                            .data![index]
                                                                            .id!);
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.h,
                                                                        width:
                                                                            75.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0XFF084E60),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.r),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child: Text(
                                                                              'Delete',
                                                                              style: TextStyle(color: Constant.whiteColor)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Icon(Icons.delete,
                                                      size: 25.sp),
                                                ),
                                                SizedBox(width: 10.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          // StreamBuilder<int>(
                          //   stream: ind?.stream,
                          //   builder: (context, snap) {
                          //     return slidablePanelHeader(
                          //       songImage: snapshot.data?[ind?.value??0].imagepath ,
                          //       context: context,
                          //       onTap: () async {
                          //         Get.to(()=>SongScreen(id: assetsAudioPlayer.current.value?.audio.audio.metas.id??'',categoryName :'',songImage:snapshot.data?[ind?.value??0].imagepath ),
                          //             transition: Transition.native, duration: const Duration(seconds: 1));
                          //       },
                          //     );
                          //   }
                          // ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50.0.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
                              Text('Download',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Constant.whiteColor)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text('No Song Downloaded',
                            style: TextStyle(color: Colors.white)),
                        Spacer()
                      ],
                    );
                  }
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.green,
                    highlightColor: Colors.yellow,
                    child: ListView.builder(
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13.w, vertical: 6.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: 348.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
