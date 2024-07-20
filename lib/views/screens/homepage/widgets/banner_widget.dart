// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/screens/Dailymeditationpage.dart';
import 'package:meditation/views/screens/Sliderreminderchoosepage.dart';
import 'package:meditation/views/screens/songplayerscreen/songplayer.dart';

import '../../../../Controller/homescreen_controller.dart';
import '../../../../Services/authentication_services/home_service.dart';
import '../../../../constant/audio_constant.dart';
import '../../../../constant/constant.dart';
import '../../../../constant/image_constant.dart';

class BannerWidget extends StatefulWidget {
  final String? selectedId;
  String? bannerId;
  final String? selectedReportList;
  var id;

  BannerWidget(
      {Key? key,
      this.selectedId,
      this.selectedReportList,
      this.id,
      this.bannerId})
      : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final HomeController homeController = Get.put(HomeController());
  getBannerData() async {
    homeController.home = await HomeService().homeService();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getBannerData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0.w),
      height: 200.h,
      width: 475.w,
      child: ListView.builder(
        reverse: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeController.home?.relaxMeditation.homeBanner.length,
        itemBuilder: (context, index) {
          var data = homeController.home?.relaxMeditation.homeBanner[index];
          // if(index==1){
          //   return SizedBox();
          // }
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 170.h,
                width: 210.63.w,
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.sp),

                  /// =================== Network Image ===================
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          maxHeight: 500,
                          maxWidth: 500,
                          data?.bannerImage ??
                              'https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/Meditation.png'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 10.h, left: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// =================== Set Reminder ===================
                      InkWell(
                        onTap: () async {
                          if (index == 0) {
                            // showLoader(context);
                            // songListModel.clear();
                            // for (int i = 0; i < snapshot.data!.relaxMeditation!.length; i++) {
                            //
                            // }
                            // await selectSong(index: index).whenComplete(() => hideLoader(context));
                            Get.to(() => Dailymeditationpage(
                                mp3Title: data!.mp3List[0].mp3Title,
                                categoryImage: data.mp3List[0].mp3Image,
                                categoryName: data.mp3List[0].categoryName,
                                isFavourite: data.mp3List[0].isFavourite,
                                mp3Description: data.mp3List[0].mp3Title,
                                mp3Url: data.mp3List[0].mp3Url,
                                id: data.mp3List[0].id));
                          } else {
                            Get.to(() => SliderReminderChoosePage(
                                selectedId: data!.mp3List[0].id));
                          }
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 23.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: '◉ ',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.green),
                              children: <TextSpan>[
                                TextSpan(
                                  text: index == 0
                                      ? 'DAILY MEDITATION'
                                      : index == 1
                                          ? 'Set Reminder'
                                          : data?.mp3List[0].categoryName,
                                  style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// =================== Play Icon ===================
                      InkWell(
                        onTap: () async {
                          if (index == 0) {
                            // showLoader(context);
                            // songListModel.clear();
                            // for (int i = 0; i < snapshot.data!.relaxMeditation!.length; i++) {
                            //   songListModel.add(
                            //     SongListModel(
                            //         id: snapshot.data!.relaxMeditation![i].id.toString(),
                            //         image: snapshot.data!.relaxMeditation![i].mp3Image!,
                            //         title: snapshot.data!.relaxMeditation![i].mp3Title!,
                            //         url: snapshot.data!.relaxMeditation![i].mp3Url!),
                            //   );
                            // }
                            // await selectSong(index: index).whenComplete(() => hideLoader(context));
                            Get.to(() => Dailymeditationpage(
                                  id: data!.mp3List[0].id,
                                  mp3Title: data.mp3List[0].mp3Title,
                                  categoryImage: data.mp3List[0].mp3Image,
                                  categoryName: data.mp3List[0].categoryName,
                                  isFavourite: data.mp3List[0].isFavourite,
                                  mp3Description: data.mp3List[0].mp3Title,
                                  mp3Url: data.mp3List[0].mp3Url,
                                ));
                          } /*
                          else if(index==1){
                            Get.to(()=>SliderReminderPlayPage(data?.mp3List[0].id));
                          }*/
                          else {
                            showLoader(context);
                            songListModel.clear();
                            for (int i = 0; i < (data!.mp3List.length); i++) {
                              songListModel.add(
                                SongListModel(
                                    id: data.mp3List[i].id.toString(),
                                    image: data.mp3List[i].mp3Image,
                                    title: data.mp3List[i].mp3Title,
                                    url: data.mp3List[i].mp3Url),
                              );
                            }
                            await selectSong(index: index)
                                .whenComplete(() => hideLoader(context));
                            Get.to(
                              () => SongScreen(
                                categoryName: data.mp3List[0].categoryName,
                                id: data.mp3List[0].id,
                              ),
                              transition: Transition.native,
                            );
                          }
                        },
                        child: Center(
                          child: SvgPicture.asset(homePlayIcon,
                              height: 50.h, width: 50.w),
                        ),
                      ),

                      /// =================== Text ===================
                      SizedBox(
                        width: 160.w,
                        child: Text(
                          data?.mp3List[0].mp3Title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Constant.whiteColor, fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*/// =================== Favourite Icon ===================
                          InkWell(
                            onTap: () {
                              homeController.homeFavouriteSong(snapshot.data!.relaxMeditation![index].id);
                              snapshot.data!.relaxMeditation![index].isFavourite == false
                                  ? Get.snackbar('Added', 'Added successfully')
                                  : Get.snackbar('Removed', 'Removed successfully');
                            },
                            child: Icon(snapshot.data!.relaxMeditation![index].isFavourite == false ? Icons.favorite_border : Icons.favorite_outlined,
                                size: 25.sp, color: Constant.redColor),
                          ),*/
            ],
          );
        },
      ),
    );
  }
}
