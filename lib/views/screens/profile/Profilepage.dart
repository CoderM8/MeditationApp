// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import 'package:meditation/Controller/profile_controller.dart';
import 'package:meditation/Controller/user_controller/user_controller.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/generated/l10n.dart';
import 'package:meditation/main.dart';
import 'package:meditation/model/profilemodel/language_model.dart';
import 'package:meditation/model/profilemodel/profile_model.dart'
    as profile_model;
import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/views/screens/EditProfile_Screen/edit_profile_page.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_screen.dart';
import 'package:meditation/views/screens/download_screen/download_screen.dart';
import 'package:meditation/views/screens/homepage/favourite_page.dart';
import 'package:meditation/views/screens/profile/user_info_page.dart';
import 'package:meditation/views/utils/profile_Button_Widget.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../services/admobads.dart';
import 'language_constant.dart';

class ProfilePage extends StatefulWidget {
  bool? showBack;

  ProfilePage({Key? key, this.showBack}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

RxString imageF = ''.obs;

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController profileController = Get.put(ProfileController());

  // Future<void> takePhoto(ImageSource source, context) async {
  //   final ImagePicker _picker = ImagePicker();
  //   File? image = await _picker.pickImage(source: source).then((value) async {
  //     if (value != null) {
  //       imageF.value = value.path;
  //       Get.back();
  //     } else {}
  //     return null;
  //   });
  //   print('File ===== ${image?.path}');
  //   return null;
  // }

  final UserController userController = Get.put(UserController());

  void _changeLanguage(Language language) async {
    await setLocale(language.languageCode).then((val) {
      print("Hello This is Third Screen $val");
      print("Hello This is Third Screen ${S.of(context).profile_Language}");
      MyApp.setLocale(context, val);
    });
  }

  @override
  void initState() {
    profileController.profileService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
          stream: isSkip.stream,
          builder: (context, snapshot) {
            return Stack(
              fit: StackFit.expand,
              children: [
                /// =================== Background Image ===================
                Positioned.fill(
                  child: Container(
                    child: Image.asset(backgroundImage, fit: BoxFit.cover),
                  ),
                ),
                StreamBuilder<List<profile_model.RelaxMeditation>?>(
                    stream: profileController.profileList.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return isSkip.value ||
                                profileController
                                    .profileList.first.userId.isEmpty
                            ? Column(
                                children: [
                                  SizedBox(height: 100.h),
                                  SizedBox(
                                      height: 350,
                                      width: 350,
                                      child: Image.asset(
                                          'assets/images/skipProfileImage.png')),
                                  SizedBox(height: 100.h),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => DownloadScreen());
                                    },
                                    child: Container(
                                      height: 65.h,
                                      width: 333.w,
                                      padding: EdgeInsets.only(
                                          left: 26.w, right: 10.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Constant.whiteColor
                                              .withOpacity(0.1)),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 22.h,
                                            width: 22.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            child: Icon(
                                                Icons.file_download_outlined,
                                                size: 17,
                                                color: Color(0XFF002D38)),
                                          ),
                                          SizedBox(width: 13.w),
                                          Text(
                                            S.of(context).download,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0)),
                                          Icon(Icons.arrow_forward_ios,
                                              color: Constant.whiteColor,
                                              size: 16),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // LocalStorageServices.box.erase();
                                      isSkip.value = false;
                                      Get.offAll(() => SignInScreen());
                                    },
                                    child: Container(
                                      height: 65.h,
                                      width: 333.w,
                                      padding: EdgeInsets.only(
                                          left: 26.w, right: 10.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Constant.whiteColor
                                              .withOpacity(0.1)),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 22.h,
                                            width: 22.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            child: Icon(Icons.login_outlined,
                                                size: 17,
                                                color: Color(0XFF002D38)),
                                          ),
                                          SizedBox(width: 13.w),
                                          Text(
                                            S.of(context).logIn,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0)),
                                          Icon(Icons.arrow_forward_ios,
                                              color: Constant.whiteColor,
                                              size: 16),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SingleChildScrollView(
                                child: Container(
                                  width: 375.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0.w, right: 20.0.w, top: 30.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// =================== Profile Text ===================
                                        // SizedBox(height: 30.h),
                                        Row(
                                          children: [
                                            widget.showBack == true
                                                ? InkWell(
                                                    onTap: () => Get.back(),
                                                    child: SvgPicture.asset(
                                                        "assets/icons/back.svg",
                                                        height: 30.h,
                                                        width: 30.w),
                                                  )
                                                : SizedBox(),
                                            Spacer(),
                                            Center(
                                              child: Styles.regular(
                                                  S.of(context).profile,
                                                  fw: FontWeight.bold,
                                                  fs: 20.sp,
                                                  c: Constant.whiteColor),
                                            ),
                                            Spacer()
                                          ],
                                        ),

                                        /// =================== Username, Email, UserFirstLatter ===================
                                        SizedBox(height: 23.h),
                                        StreamBuilder<
                                                List<
                                                    profile_model
                                                    .RelaxMeditation>?>(
                                            stream: profileController
                                                .profileList.stream,
                                            builder: (context, snapshot) {
                                              if (profileController
                                                  .profileList.isNotEmpty) {
                                                LocalStorageServices.box.write(
                                                    'UserName',
                                                    profileController
                                                        .profileList[0].name);
                                                LocalStorageServices.box.write(
                                                    'UserEmail',
                                                    profileController
                                                        .profileList[0].email);
                                                LocalStorageServices.box.write(
                                                    'UserFirstLetter',
                                                    profileController
                                                        .profileList[0]
                                                        .name[0]);
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          // onTap: () {
                                                          //   showModalBottomSheet(
                                                          //     context: context,
                                                          //     builder: (context) {
                                                          //       return Row(
                                                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          //         children: <Widget>[
                                                          //           /// =================== Camera ===================
                                                          //           Container(
                                                          //             padding: EdgeInsets.only(bottom: 10, top: 10),
                                                          //             height: 70.h,
                                                          //             width: 152.w,
                                                          //             child: ElevatedButton(
                                                          //               style: ElevatedButton.styleFrom(
                                                          //                 shape: RoundedRectangleBorder(
                                                          //                   borderRadius: BorderRadius.circular(10.r), // <-- Radius
                                                          //                 ),
                                                          //                 // backgroundColor: Color(0xff06576A),
                                                          //                 primary: Color(0xff06576A),
                                                          //               ),
                                                          //               child: Row(
                                                          //                 children: <Widget>[
                                                          //                   Image.network(cameraIcon, height: 40.h, width: 40.w, color: Constant.whiteColor),
                                                          //                   SizedBox(width: 8.h),
                                                          //                   Text(
                                                          //                     S.of(context).camera,
                                                          //                     style: TextStyle(color: Colors.white, fontSize: 18.sp, fontFamily: "Roboto regular"),
                                                          //                   ),
                                                          //                 ],
                                                          //               ),
                                                          //               onPressed: () async {
                                                          //                 await takePhoto(ImageSource.camera, context).then((value) {
                                                          //                   profileController.UpdateProfile(
                                                          //                           email: snapshot.data!.relaxMeditation[0].email,
                                                          //                           name: snapshot.data!.relaxMeditation[0].name,
                                                          //                           phone: snapshot.data!.relaxMeditation[0].phone,
                                                          //                           image: imageF.value,
                                                          //                           bDate: snapshot.data!.relaxMeditation[0].birthDate)
                                                          //                       .then((value) {
                                                          //                     Get.snackbar('Profile', '${snapshot.data!.relaxMeditation[0].name}');
                                                          //                   });
                                                          //                 });
                                                          //               },
                                                          //             ),
                                                          //           ),
                                                          //
                                                          //           /// =================== Gallery ===================
                                                          //           SizedBox(width: 15.w),
                                                          //           Container(
                                                          //             height: 52.h,
                                                          //             width: 152.w,
                                                          //             child: ElevatedButton(
                                                          //               style: ElevatedButton.styleFrom(
                                                          //                 shape: RoundedRectangleBorder(
                                                          //                   borderRadius: BorderRadius.circular(10.r),
                                                          //                 ),
                                                          //                 // backgroundColor: Color(0xff06576A),
                                                          //                 primary: Color(0xff06576A),
                                                          //               ),
                                                          //               child: Row(
                                                          //                 children: [
                                                          //                   Image.network(galleryIcon, height: 30.h, width: 30.w, color: Constant.whiteColor),
                                                          //                   SizedBox(width: 15.w),
                                                          //                   Text(
                                                          //                     S.of(context).gallery,
                                                          //                     style: TextStyle(fontFamily: "Roboto regular", color: Colors.white, fontSize: 18.sp),
                                                          //                   ),
                                                          //                 ],
                                                          //               ),
                                                          //               onPressed: () async {
                                                          //                 takePhoto(ImageSource.gallery, context).then((value) {
                                                          //                   profileController.UpdateProfile(
                                                          //                       email: snapshot.data!.relaxMeditation[0].email,
                                                          //                       name: snapshot.data!.relaxMeditation[0].name,
                                                          //                       phone: snapshot.data!.relaxMeditation[0].phone,
                                                          //                       image: imageF.value,
                                                          //                       bDate: snapshot.data!.relaxMeditation[0].birthDate);
                                                          //                 }).then(
                                                          //                   (value) {
                                                          //                     Get.snackbar('Profile', '${snapshot.data!.relaxMeditation[0].name}');
                                                          //                   },
                                                          //                 );
                                                          //               },
                                                          //             ),
                                                          //           ),
                                                          //         ],
                                                          //       );
                                                          //     },
                                                          //   );
                                                          // },
                                                          child: Obx(
                                                            () {
                                                              return Container(
                                                                height: 75.h,
                                                                width: 75.h,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white)),
                                                                child: imageF
                                                                        .value
                                                                        .isNotEmpty
                                                                    ? ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(200),
                                                                        child: Image.file(
                                                                            File(imageF
                                                                                .value),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            width: 130.w,
                                                                            height: 150.h),
                                                                      )
                                                                    : ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(50),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          memCacheHeight:
                                                                              500,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          filterQuality:
                                                                              FilterQuality.low,
                                                                          imageUrl: profileController
                                                                              .profileList[0]
                                                                              .userImage,
                                                                        ),
                                                                      ),
                                                              );
                                                            },
                                                          ),
                                                        ),

                                                        /// =================== Username ===================
                                                        SizedBox(width: 15.w),
                                                        SizedBox(
                                                            width: 160.0.w,
                                                            child: Styles.regular(
                                                                LocalStorageServices
                                                                    .box
                                                                    .read(
                                                                        'UserName'),
                                                                fs: 18.sp,
                                                                c: Constant
                                                                    .whiteColor,
                                                                ov: TextOverflow
                                                                    .ellipsis)),

                                                        /// =================== Info Icon ===================
                                                        Spacer(),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                              () =>
                                                                  UserInfoPage(
                                                                name:
                                                                    '${profileController.profileList[0].name}',
                                                                image:
                                                                    '${profileController.profileList[0].userImage}',
                                                                bdate:
                                                                    '${profileController.profileList[0].birthDate}',
                                                                email:
                                                                    '${profileController.profileList[0].email}',
                                                              ),
                                                            );
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                                  infoIcon,
                                                                  height: 35.h,
                                                                  width: 35.w),
                                                        ),

                                                        /// =================== Setting (Edit Profile)===================
                                                        SizedBox(width: 10.w),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                              () =>
                                                                  EditProfilePage(
                                                                name:
                                                                    '${profileController.profileList[0].name}',
                                                                image:
                                                                    '${profileController.profileList[0].userImage}',
                                                                bDate: DateTime
                                                                    .now(),
                                                                email:
                                                                    '${profileController.profileList[0].email}',
                                                              ),
                                                            );
                                                          },
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                                    settingIcon,
                                                                    height:
                                                                        35.h,
                                                                    width:
                                                                        35.w),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    /// ======================================
                                                    SizedBox(height: 25.h),
                                                    GlassmorphicContainer(
                                                      width: 333.w,
                                                      height: 138.h,
                                                      blur: 200,
                                                      borderRadius: 10.r,
                                                      border: 1.w,
                                                      alignment:
                                                          Alignment.center,
                                                      borderGradient:
                                                          LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xFFFFFFFF)
                                                              .withOpacity(
                                                                  0.05),
                                                          Color((0xFFFFFFFF))
                                                              .withOpacity(
                                                                  0.05),
                                                        ],
                                                      ),
                                                      linearGradient:
                                                          LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xFFFFFFFF)
                                                              .withOpacity(
                                                                  0.08),
                                                          Color((0xFFFFFFFF))
                                                              .withOpacity(
                                                                  0.08),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10.h,
                                                                top: 10.h),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            /// =================== Logo Text ===================
                                                            Text(
                                                              'Logo',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20.sp,
                                                                  color: Constant
                                                                      .whiteColor),
                                                            ),

                                                            /// =================== Hi ... ===================
                                                            Text(
                                                                '''Hi ${profileController.profileList[0].name}, \n In a world where you can be anyone,\n choose to be yourself.''',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14.sp,
                                                                    color: Constant
                                                                        .whiteColor),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),

                                                            /// =================== Date Format ===================
                                                            Text(
                                                              '${DateFormat.MMMMd().format(DateTime.now())}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Color(
                                                                      0XFF7F969B)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0.h),
                                                    Center(
                                                        child: admobads()
                                                            .bannerads()),

                                                    SizedBox(height: 10.0.h),

                                                    /// =================== My Status ===================
                                                    // SizedBox(height: 28.h),
                                                    // Text(
                                                    //   S.of(context).myStatus,
                                                    //   style: TextStyle(
                                                    //       fontSize: 18.sp,
                                                    //       fontWeight: FontWeight.bold,
                                                    //       color: Constant.whiteColor),
                                                    // ),
                                                    // SizedBox(height: 10.h),
                                                    /*GlassmorphicContainer(
                                            width: 333.w,
                                            height: 172.h,
                                            blur: 200,
                                            borderRadius: 10.r,
                                            border: 1.w,
                                            alignment: Alignment.center,
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
                                                Color(0xFFFFFFFF).withOpacity(0.08),
                                                Color((0xFFFFFFFF)).withOpacity(0.08),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                /// =================== Mindful Day Image ===================
                                                Image.asset(mindfulDayImage, height: 60.h, width: 162.w, fit: BoxFit.fill),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    /// =================== Total Sessions ===================
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Image.asset(totalSessionsIcon, height: 25.h),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          S.of(context).totalSessions,
                                                          style: TextStyle(color: Constant.whiteColor, fontSize: 12.sp),
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          '1',
                                                          style: TextStyle(color: Constant.whiteColor, fontSize: 12.sp),
                                                        ),
                                                      ],
                                                    ),

                                                    /// =================== Mindful Minutes ===================
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Image.asset(mindfulMinutesIcon, height: 25.h),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          S
                                                              .of(context)
                                                              .mindfulMinutes,
                                                          style: TextStyle(color: Constant.whiteColor, fontSize: 12.sp),
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          '3 Min',
                                                          style: TextStyle(color: Constant.whiteColor, fontSize: 12.sp),
                                                        ),
                                                      ],
                                                    ),

                                                    /// =================== Longest Streak ===================
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Image.asset(longestStreakIcon, height: 25.h),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          S.of(context).longestStreak,
                                                          style: TextStyle(color: Constant.whiteColor, fontSize: 12.sp),
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        Text(
                                                          '1 Day',
                                                          style: TextStyle(color: Constant.whiteColor, fontSize: 12.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),*/
                                                  ],
                                                );
                                              } else {
                                                return SizedBox();
                                              }
                                            }),
                                        SizedBox(height: 3.h),

                                        Column(
                                          children: [
                                            /// =================== Join Premium ===================
                                            // InkWell(
                                            //   onTap: () {
                                            //     /// payment method baki
                                            //     // Get.to(PremiumPage());
                                            //   },
                                            //   child: ProfileButtonPage(
                                            //     svg: joinPremiumIcon,
                                            //     height: 22.h,
                                            //     width: 22.w,
                                            //     hint: joinPremium,
                                            //     actionWidget: Icon(Icons.arrow_forward_ios, color: Constant.whiteColor, size: 16),
                                            //   ),
                                            // ),

                                            /*/// =================== Badges ===================
                                SizedBox(height: 20.h),
                                InkWell(
                                  onTap: () {
                                    /// stage method baki
                                    // Get.to(BadgesPage());
                                  },
                                  child: ProfileButtonPage(
                                    svg: badgesIcon,
                                    height: 22.h,
                                    width: 22.w,
                                    hint: badges,
                                    actionWidget: Icon(Icons.arrow_forward_ios, color: Constant.whiteColor, size: 16),
                                  ),
                                ),*/

                                            /// =================== My Favourites ===================
                                            // SizedBox(height: 20.h),
                                            InkWell(
                                              onTap: () {
                                                Get.to(() => FavouritePage(
                                                    appbarTitle: S
                                                        .of(context)
                                                        .myFavourite));
                                              },
                                              child: ProfileButtonPage(
                                                  icon: Icons.favorite_border,
                                                  height: 22.h,
                                                  width: 22.w,
                                                  actionWidget: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          Constant.whiteColor,
                                                      size: 16),
                                                  hint: S
                                                      .of(context)
                                                      .myFavourite),
                                            ),

                                            /// =================== Download Button ===================
                                            SizedBox(height: 20.h),
                                            InkWell(
                                              onTap: () {
                                                Get.to(() => DownloadScreen());
                                              },
                                              child: ProfileButtonPage(
                                                  icon: Icons.download,
                                                  height: 22.h,
                                                  width: 22.w,
                                                  actionWidget: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          Constant.whiteColor,
                                                      size: 16),
                                                  hint: S.of(context).download),
                                            ),

                                            //  =================== Change Language ===================
                                            SizedBox(height: 20.h),
                                            InkWell(
                                              onTap: () {},
                                              child: ProfileButtonPage(
                                                icon: Icons.language_sharp,
                                                height: 22.h,
                                                width: 22.w,
                                                actionWidget: SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          1.45,
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton<
                                                        Language>(
                                                      dropdownColor: Constant
                                                          .darkThemeColor,
                                                      isExpanded: true,
                                                      icon: Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: Colors.white,
                                                      ),
                                                      iconSize: 16,
                                                      hint: Text(
                                                        S
                                                            .of(context)
                                                            .changeLanguage,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18.sp),
                                                      ),
                                                      onChanged:
                                                          (Language? language) {
                                                        print(
                                                            "Hello This is Second Screen $language");
                                                        print(
                                                            'Translate ====${S.of(context).profile_Language}');
                                                        _changeLanguage(
                                                            language!);
                                                      },
                                                      items: Language
                                                              .languageList()
                                                          .map<
                                                              DropdownMenuItem<
                                                                  Language>>(
                                                            (e) => DropdownMenuItem<
                                                                    Language>(
                                                                value: e,
                                                                child: ListTile(
                                                                  leading: Text(
                                                                    e.flag,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                    ),
                                                                  ),
                                                                  title: Text(
                                                                    e.name,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            /*/// =================== Meditation Reminder ===================
                                SizedBox(height: 20.h),
                                ProfileButtonPage(
                                  svg: reminderIcon,
                                  height: 22.h,
                                  width: 22.w,
                                  actionWidget: Obx(
                                    () {
                                      return CupertinoSwitch(
                                        value: profileController.meditation.value,
                                        trackColor: Color(0xFFFFFFFF),
                                        activeColor: profileController.meditation.value == true ? Color(0xFF002D38) : Color(0xFFFFFFFF),
                                        thumbColor: profileController.meditation.value == false ? Color(0xFF002D38) : Color(0xFFFFFFFF),
                                        onChanged: (bool value) {
                                          profileController.meditation.value = value;
                                        },
                                      );
                                    },
                                  ),
                                  hint: meditationReminder,
                                ),

                                /// =================== Sleep Reminder ===================
                                SizedBox(height: 20.h),
                                ProfileButtonPage(
                                  svg: reminderIcon,
                                  height: 22.h,
                                  width: 22.w,
                                  actionWidget: Obx(
                                    () {
                                      return CupertinoSwitch(
                                        value: profileController.sleepReminder.value,
                                        activeColor: profileController.sleepReminder.value == true ? Color(0xFF002D38) : Color(0xFFFFFFFF),
                                        trackColor: Color(0xFFFFFFFF),
                                        thumbColor: profileController.sleepReminder.value == true ? Color(0xFFFFFFFF) : Color(0xFF002D38),
                                        onChanged: (bool value) {
                                          profileController.sleepReminder.value = value;
                                        },
                                      );
                                    },
                                  ),
                                  hint: sleepReminder,
                                ),*/

                                            /// =================== Logout Button ===================
                                            SizedBox(height: 20.h),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                      child: SizedBox(
                                                        height: 150.h,
                                                        width: 190.w,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              S
                                                                  .of(context)
                                                                  .areYouSureYouWantToLogOut,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 20.h),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        40.h,
                                                                    width: 75.w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Constant
                                                                          .greyColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.r),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          S.of(context).no,
                                                                          style: TextStyle(color: Constant.whiteColor)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        10.w),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    LocalStorageServices
                                                                        .box
                                                                        .erase();
                                                                    Get.offAll(() =>
                                                                        SignInScreen());
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        40.h,
                                                                    width: 75.w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0XFF084E60),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.r),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          S.of(context).yes,
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
                                              child: ProfileButtonPage(
                                                  icon: Icons.logout,
                                                  height: 22.h,
                                                  width: 22.w,
                                                  actionWidget: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          Constant.whiteColor,
                                                      size: 16),
                                                  hint: S.of(context).logout),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 60.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
              ],
            );
          }),
    );
  }
}
