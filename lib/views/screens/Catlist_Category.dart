// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/Music_controller/all_song_controller.dart';
import 'package:meditation/constant/audio_constant.dart';
import 'package:meditation/model/Music_model/cat_list_id_model.dart';
import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';
import 'package:lottie/lottie.dart';
import '../../constant/constant.dart';
import 'songplayerscreen/songplayer.dart';

class CatListCategory extends StatefulWidget {
  CatListCategory({required this.id, required this.name});

  String id;
  String name;

  @override
  State<CatListCategory> createState() => _CatListCategoryState();
}

class _CatListCategoryState extends State<CatListCategory> {
  final AllSongController catListIdSongCategory = Get.put(AllSongController());
  @override
  void initState() {
    super.initState();
    catListIdSongCategory.categoryidservice(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset("assets/images/Home Screen.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 33.h),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return BottomNavigator();
                                },
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_back,
                              color: Constant.whiteColor, size: 24.sp),
                        ),
                        SizedBox(width: 84.w),
                        Center(child: textTitle(widget.name))
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: StreamBuilder<CatListIdModel?>(
                      stream:
                          catListIdSongCategory.categoryidserviceModel.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData ||
                            snapshot.connectionState == ConnectionState.done) {
                          return GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 15.w, right: 15.w),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 400 / 520),
                            itemCount: snapshot.data!.relaxMeditation!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 2.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 164.18.h,
                                      width: 164.18.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          color: Constant.whiteColor),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: InkWell(
                                          onTap: () async {
                                            showLoader(context);
                                            songListModel.clear();
                                            for (int i = 0;
                                                i <
                                                    snapshot
                                                        .data!
                                                        .relaxMeditation!
                                                        .length;
                                                i++) {
                                              songListModel.add(SongListModel(
                                                id: snapshot.data!
                                                    .relaxMeditation![i].cid
                                                    .toString(),
                                                image: snapshot
                                                    .data!
                                                    .relaxMeditation![i]
                                                    .categoryImage!,
                                                title: snapshot
                                                    .data!
                                                    .relaxMeditation![i]
                                                    .mp3Title!,
                                                url: snapshot
                                                    .data!
                                                    .relaxMeditation![i]
                                                    .mp3Url!,
                                              ));
                                            }
                                            await selectSong(index: index)
                                                .whenComplete(
                                                    () => hideLoader(context));
                                            Get.to(
                                                () => SongScreen(
                                                      categoryName: snapshot
                                                              .data
                                                              ?.relaxMeditation?[
                                                                  index]
                                                              .categoryName ??
                                                          '',
                                                      id: snapshot
                                                              .data!
                                                              .relaxMeditation![
                                                                  index]
                                                              .id ??
                                                          '',
                                                    ),
                                                transition: Transition.native,
                                                duration:
                                                    const Duration(seconds: 1));
                                            // songController.addSongs(
                                            //     index,
                                            //     snapshot.data!.relaxMeditation![index].mp3Url!,
                                            //     snapshot.data!.relaxMeditation![index].cid,
                                            //     snapshot.data!.relaxMeditation![index].mp3Title!,
                                            //     snapshot.data!.relaxMeditation![index].categoryName!,
                                            //     snapshot.data!.relaxMeditation![index].mp3Image!);
                                            // Get.to(
                                            //   SingleSongScreen(index: index, data: snapshot.data!.relaxMeditation![index]),
                                            // );
                                          },
                                          child: Image.network(
                                              snapshot
                                                  .data!
                                                  .relaxMeditation![index]
                                                  .categoryImage!,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 10.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          snapshot.data!.relaxMeditation![index]
                                              .mp3Title!,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Constant.whiteColor),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          snapshot.data!.relaxMeditation![index]
                                              .categoryName!,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Lottie.network(
                                "https://assets7.lottiefiles.com/packages/lf20_va081n22.json"),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
    );
  }
}
