import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/Controller/profile_controller.dart';
import 'package:meditation/common_text_widget.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/constant/image_constant.dart';
import 'package:meditation/generated/l10n.dart';
import 'package:meditation/views/screens/drawer/drawer_page.dart';
import 'package:meditation/views/screens/homepage/widgets/banner_widget.dart';
import 'package:meditation/views/screens/homepage/widgets/choice_chips_widget.dart';
import 'package:meditation/views/screens/homepage/widgets/for_now_widget.dart';
import 'package:meditation/views/screens/homepage/widgets/recommended_widget.dart';
import 'package:meditation/views/screens/homepage/widgets/section_widget.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../Controller/controller_constant.dart';
import '../../../Services/authentication_services/home_service.dart';
import '../../../SplashScreenpage/HomeScreen.dart';
import '../../../services/admobads.dart';
import '../../../services/local_storage_service.dart';
import 'favourite_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  final ProfileController profileController = Get.put(ProfileController());
  String? selectedId;
  List<String> reportList = [
    "Anxious",
    "Tired",
    "Peaceful",
    "Sad",
    "Stressed",
    "Ummotivated",
    "Hopeful",
    "Inadequate",
    "Lonely",
    "i’m in pain",
    "Happy",
    "annoyed",
    "Loving",
    "Eating",
  ];
  bool _visible = false;
  bool _visibles = false;
  bool _visiblest = true;
  bool isReadmore = false;
  String? selectedReportList;
  List<String> morereportList = [
    "On The way",
    "Trying to wake up",
    "Walking",
    "Getting ready to exercise",
    "Eating",
    "Nothing",
    "Learning mindfulness",
    "Trying to sleep",
  ];
  double _height = 120.h;

  void getHomeData() async {
    homeController.home = await HomeService().homeService();
    setState(() {});
  }

  void onRefresh() async {
    // monitor network fetch
    getHomeData();
    kHomeController.categoryService();
    kHomeController.quickServices(context);
    await Future.delayed(Duration(milliseconds: 600));
  }

  @override
  void initState() {
    super.initState();
    getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,

        /// =================== Background Image ===================
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.cover),
        ),

        child: RefreshIndicator(
          onRefresh: () async {
            onRefresh();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// =================== App bar ===================
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: _height * 1.23,
                    child: GlassContainer(
                      blur: 5,
                      borderGradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.2)
                      ]),
                      color: Colors.black.withOpacity(0.2),
                      height: _height * 1.23,
                      width: double.infinity,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 45.h, right: 30.w, left: 30.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /// =================== Square Icon ===================
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => DrawerPage(
                                              /* accountName: profileController.profileList.first.name,
                                                    accountEmail: profileController.profileList.first.email,
                                                    accountFirstLatter: homeController.userFirstLetter.value*/
                                              ),
                                          transition:
                                              Transition.leftToRightWithFade,
                                          curve: Curves.linear,
                                          duration:
                                              Duration(milliseconds: 600));
                                    },
                                    child: SvgPicture.asset(homeSquareIcon,
                                        height: 40.h, width: 40.w),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),

                                  /// =================== Meditation ===================
                                  Styles.regular(S.of(context).meditation,
                                      ff: 'regular',
                                      fs: 40.sp,
                                      c: Constant.whiteColor),

                                  SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// =================== expanded ===================
                                        // GestureDetector(
                                        //   onTap: () {
                                        //     setState(() {
                                        //       _visibles = false;
                                        //       _height = _height > 120.h ? 120.h : 370.h;
                                        //       _visible = !_visible;
                                        //     });
                                        //   },
                                        //   child: SvgPicture.asset(
                                        //     'assets/icons/Group 63.svg',
                                        //     height: 43.h,
                                        //     width: 43.w,
                                        //   ),
                                        // ),
                                        Spacer(),

                                        /// =================== Favourite Icon ===================
                                        StreamBuilder<bool>(
                                            stream: isSkip.stream,
                                            builder: (context, snapshot) {
                                              return isSkip.isTrue
                                                  ? SizedBox()
                                                  : InkWell(
                                                      onTap: () {
                                                        Get.to(
                                                            () => FavouritePage(
                                                                  appbarTitle:
                                                                      'Favourite',
                                                                ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    600),
                                                            curve:
                                                                Curves.linear,
                                                            transition: Transition
                                                                .rightToLeftWithFade);
                                                      },
                                                      child: SvgPicture.asset(
                                                          homeFavouriteIcon,
                                                          height: 40.h,
                                                          width: 40.w),
                                                    );
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Visibility(
                                visible: _visible,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    MultiSelectChip(
                                      reportList,
                                      onSelectionChanged: (selectedList) {
                                        setState(
                                          () {
                                            selectedReportList = selectedList;
                                          },
                                        );
                                      },
                                    ),
                                    //  Text(selectedReportList.toString()),
                                    SizedBox(height: 19.h),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 133, left: 133),
                                          child: Visibility(
                                            visible: _visiblest,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isReadmore = !isReadmore;
                                                  _visiblest = _visible == true
                                                      ? true
                                                      : false;
                                                  _visibles = _height > 370.h
                                                      ? false
                                                      : true;
                                                  _height = _height == 570.h
                                                      ? 370.h
                                                      : 570.h;
                                                });
                                              },
                                              child: Container(
                                                  height: 33.h,
                                                  width:
                                                      isReadmore ? 70.w : 90.w,
                                                  //color: Colors.white,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              115),
                                                      color: Colors.white),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 5),
                                                      Text(
                                                        (isReadmore
                                                            ? 'More'
                                                            : 'Read Less'),
                                                        style: TextStyle(
                                                            fontSize: 11.sp),
                                                      ),
                                                      // SizedBox(width: 5),
                                                      // Spacer(),
                                                      Icon(
                                                        Icons.expand_more,
                                                        size: 12,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Visibility(
                                visible: _visibles,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    MultiSelectChip(
                                      morereportList,
                                      onSelectionChanged: (selectedList) {
                                        setState(
                                          () {
                                            selectedReportList = selectedList;
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 50.0.h,
                                    )
                                    // Text(selectedReportList.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                /// =================== Good Morning Text ===================
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CommonTextWidget(
                      title:
                          '${S.of(context).home_GM}, ${LocalStorageServices().box.read('UserName')}',
                      fontSize: 18.sp,
                      textColor: Constant.whiteColor),
                ),

                /// =================== Banner Widget ===================
                SizedBox(height: 10.h),
                BannerWidget(),

                /// =================== Choice Chip Widget ===================
                SizedBox(height: 10.h),
                ChoiceChipsWidget(),
                SizedBox(height: 10.h),
                Center(child: admobads().bannerads()),

                /// =================== For Now Widget ===================
                SizedBox(height: 20.h),
                ForNowWidget(selectedId: selectedId),

                /// =================== Recommended Widget ===================
                SizedBox(height: 10.h),
                RecommendedWidget(selectedId: homeController.id),
                SizedBox(height: 10.h),
                Center(child: admobads().bannerads()),

                /// =================== Section Widget ===================
                SectionWidget(),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ),
      ),
      // Stack(
      //   children: [
      //     /// =================== Background Image ===================
      //     Positioned.fill(
      //       child: Container(
      //         child: Image.asset(backgroundImage, fit: BoxFit.cover),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 45.h, right: 30.w, left: 30.w),
      //       child: Row(
      //         children: [
      //           /// =================== Square Icon ===================
      //           GestureDetector(
      //             onTap: () {
      //               Get.to(
      //                   DrawerPage(
      //                       accountName: homeController.username.value,
      //                       accountEmail: homeController.userEmail.value,
      //                       accountFirstLatter: homeController.userFirstLetter.value),
      //                   transition: Transition.leftToRight,
      //                   curve: Curves.bounceInOut,
      //                   duration: Duration(seconds: 1));
      //             },
      //             child: SvgPicture.asset(homeSquareIcon, height: 40.h, width: 40.w),
      //           ),
      //
      //           /// =================== Meditation ===================
      //           Spacer(),
      //           Styles.regular(S.of(context).meditation, ff: 'regular', fs: 40.sp, c: Constant.whiteColor),
      //
      //           /// =================== Favourite Icon ===================
      //           Spacer(),
      //           InkWell(
      //             onTap: () {
      //               Get.to(
      //                   FavouritePage(
      //                     appbarTitle: 'Favourite',
      //                   ),
      //                   duration: Duration(seconds: 2),
      //                   curve: Curves.elasticInOut,
      //                   transition: Transition.leftToRightWithFade);
      //             },
      //             child: SvgPicture.asset(homeFavouriteIcon, height: 35.h, width: 35.w),
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     // Obx(
      //     //   () {
      //     //     return AnimatedPadding(
      //     //       padding: EdgeInsets.only(top: homeController.onTap.value == true ? homeController.height.value : homeController.height.value),
      //     //       duration: Duration(milliseconds: 2),
      //     //       child: CustomScrollView(
      //     //         shrinkWrap: true,
      //     //         slivers: [
      //     //           SliverList(
      //     //             delegate: SliverChildListDelegate(
      //     //               [
      //     //                 SizedBox(height: 120.h),
      //     //                 Padding(
      //     //                   padding: EdgeInsets.only(left: 10.0.w),
      //     //                   child: Container(
      //     //                     child: Obx(
      //     //                       () {
      //     //                         return CommonTextWidget(
      //     //                             title: '${S.of(context).home_GM} ${homeController.username.value}',
      //     //                             fontSize: 18.sp,
      //     //                             textColor: Constant.whiteColor);
      //     //                       },
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //                 Column(
      //     //                   children: [
      //     //                     BannerWidget(
      //     //                         id: homeController.id, selectedId: selectedId, selectedReportList: homeController.selectedReportList!.value),
      //     //                     SizedBox(height: 10.h),
      //     //                     ChoiceChipsWidget(),
      //     //                     SizedBox(height: 20.h),
      //     //                     ForNowWidget(selectedId: selectedId),
      //     //                     SizedBox(height: 10.h),
      //     //                     RecommendedWidget(),
      //     //                     // SizedBox(height: 10.h),
      //     //                     SectionWidget(),
      //     //                   ],
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     );
      //     //   },
      //     // ),
      //   ],
      // ),
    );
  }
}
