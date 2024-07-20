import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/Controller/profile_controller.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/profilemodel/profile_model.dart'
    as profile_model;
import 'package:meditation/services/admobads.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_screen.dart';
import 'package:meditation/views/screens/drawer/privacy_policyScreen.dart';
import 'package:meditation/views/screens/profile/Profilepage.dart';
import 'package:share_plus/share_plus.dart';

import '../../../generated/l10n.dart';

class DrawerPage
    extends StatefulWidget {
  final String? accountName;
  final String? accountEmail;
  final String? accountFirstLatter;

  DrawerPage(
      {Key? key,
      this.accountName,
      this.accountEmail,
      this.accountFirstLatter})
      : super(key: key);

  @override
  State<DrawerPage> createState() =>
      _DrawerPageState();
}

class _DrawerPageState
    extends State<DrawerPage> {
  final HomeController homeController =
      Get.put(HomeController());

  final ProfileController
      _profileController =
      Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<
            List<
                profile_model
                .RelaxMeditation>?>(
        stream: _profileController
            .profileList.stream,
        builder: (context, snapshot) {
          return StreamBuilder<bool>(
              stream: isSkip.stream,
              builder:
                  (context, snapshot) {
                if (isSkip.isFalse &&
                    _profileController
                        .profileList
                        .first
                        .userId
                        .isNotEmpty) {
                  return Drawer(
                    child: Container(
                      decoration:
                          BoxDecoration(
                        image:
                            DecorationImage(
                          fit: BoxFit
                              .fill,
                          image: AssetImage(
                              'assets/images/Home Screen.jpg'),
                        ),
                      ),
                      child: Column(
                        // padding: const EdgeInsets.all(0),
                        children: [
                          SizedBox(
                            height:
                                100.h,
                          ),
                          Padding(
                            padding: const EdgeInsets
                                .only(
                                left:
                                    15.0),
                            child: Row(
                              children: [
                                StreamBuilder<
                                        String>(
                                    stream:
                                        imageF.stream,
                                    builder: (context, snapshot) {
                                      return Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.black.withOpacity(0.45), blurRadius: 20)
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: imageF.value.isNotEmpty ? FileImage(File(imageF.value)) : CachedNetworkImageProvider(maxHeight: 500, maxWidth: 500, _profileController.profileList.first.userImage) as ImageProvider,
                                              filterQuality: FilterQuality.low,
                                              fit: BoxFit.cover,
                                            )),
                                      );
                                    }),
                                SizedBox(
                                  width:
                                      30,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _profileController.profileList.first.name,
                                      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(_profileController.profileList.first.email,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white.withOpacity(0.8),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.start),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                              color: Colors
                                  .white,
                              indent:
                                  10,
                              endIndent:
                                  10,
                              height:
                                  50.0.h),
                          ListTile(
                            leading: Icon(
                                Icons
                                    .person,
                                color: Constant
                                    .whiteColor),
                            title: Text(
                                S
                                    .of(
                                        context)
                                    .myProfile,
                                style: TextStyle(
                                    color:
                                        Constant.whiteColor)),
                            onTap: () {
                              Get.to(() =>
                                  ProfilePage(
                                    showBack:
                                        true,
                                  ));
                            },
                          ),
                          ListTile(
                            leading: Icon(
                                Icons
                                    .share,
                                color: Constant
                                    .whiteColor),
                            title: Text(
                              S
                                  .of(context)
                                  .share,
                              style: TextStyle(
                                  color:
                                      Constant.whiteColor),
                            ),
                            onTap:
                                () async {
                              final box =
                                  context.findRenderObject()
                                      as RenderBox?;
                              await Share.share(
                                  'Meditation',
                                  subject:
                                      '${widget.accountName}',
                                  sharePositionOrigin:
                                      box!.localToGlobal(Offset.zero) & box.size);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                                Icons
                                    .privacy_tip_outlined,
                                color: Constant
                                    .whiteColor),
                            title: Text(
                              S
                                  .of(context)
                                  .privacyPolicy,
                              style: TextStyle(
                                  color:
                                      Constant.whiteColor),
                            ),
                            onTap:
                                () async {
                              Get.to(() =>
                                  PrivacyPolicyScreen());
                            },
                          ),

                          /// ========================= Log out ================
                          ListTile(
                            leading: Icon(
                                Icons
                                    .logout,
                                color: Constant
                                    .whiteColor),
                            title: Text(
                              S
                                  .of(context)
                                  .logout,
                              style: TextStyle(
                                  color:
                                      Constant.whiteColor),
                            ),
                            onTap: () {
                              showDialog(
                                context:
                                    context,
                                builder:
                                    (BuildContext
                                        context) {
                                  return AlertDialog(
                                    backgroundColor:
                                        Colors.white60,
                                    content:
                                        SizedBox(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Text(
                                            S.of(context).logout,
                                            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                          ),
                                          Divider(color: Colors.white, thickness: 2),
                                          Text(
                                            S.of(context).areYouSureYouWantToExit,
                                            style: TextStyle(color: Constant.whiteColor, fontSize: 15.sp, fontWeight: FontWeight.w500),
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  LocalStorageServices.box.erase();
                                                  Get.offAll(() => SignInScreen());
                                                },
                                                child: Text(
                                                  S.of(context).yes,
                                                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(S.of(context).no,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0.sp,
                                                    )),
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
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    20.0.w),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [
                                Text(
                                  'version ' +
                                      version.value,
                                  style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                FloatingActionButton(
                                  onPressed:
                                      () {
                                    Get.back();
                                  },
                                  backgroundColor:
                                      Colors.white30,
                                  child:
                                      Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height:
                                20.0,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Drawer(
                    child: Container(
                      decoration:
                          BoxDecoration(
                        image:
                            DecorationImage(
                          fit: BoxFit
                              .fill,
                          image: AssetImage(
                              'assets/images/Home Screen.jpg'),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  50.h),
                          Row(
                            children: [
                              BackButton(
                                color: Colors
                                    .white,
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  350,
                              width:
                                  350,
                              child: Image
                                  .asset(
                                      'assets/images/skipProfileImage.png')),
                          SizedBox(
                              height:
                                  100.h),
                          InkWell(
                            onTap: () {
                              // LocalStorageServices.box.erase();
                              isSkip.value =
                                  false;
                              Get.offAll(
                                  () =>
                                      SignInScreen());
                            },
                            child:
                                Container(
                              height:
                                  65.h,
                              width:
                                  333.w,
                              padding: EdgeInsets.only(
                                  left: 26
                                      .w,
                                  right:
                                      10.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8),
                                  color: Constant
                                      .whiteColor
                                      .withOpacity(0.1)),
                              child:
                                  Row(
                                children: [
                                  Container(
                                    height:
                                        22.h,
                                    width:
                                        22.h,
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                                    child: Icon(Icons.login_outlined,
                                        size: 17,
                                        color: Color(0XFF002D38)),
                                  ),
                                  SizedBox(
                                      width: 13.w),
                                  Text(
                                    S.of(context).logIn,
                                    style:
                                        TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 10.0)),
                                  Icon(
                                      Icons.arrow_forward_ios,
                                      color: Constant.whiteColor,
                                      size: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              });
        });
  }
}
