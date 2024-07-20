import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meditation/Controller/search_controller.dart' as Search;
import 'package:meditation/common_text_widget.dart';
import 'package:meditation/model/search_model/search_model.dart';
import 'package:lottie/lottie.dart';
import '../../../constant/constant.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final Search.SearchController searchController =
      Get.put(Search.SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 950.h,
          // padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: Image.asset("assets/images/Home Screen.jpg",
                      fit: BoxFit.cover),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    GlassmorphicContainer(
                      height: 60.h,
                      width: 400.w,
                      blur: 170,
                      borderRadius: 0,
                      border: 5,
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
                          Color(0xFFFFFFFF).withOpacity(0.5),
                          Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Icon(Icons.arrow_back_ios_new_rounded,
                                  size: 20.sp, color: Colors.black),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Constant.titleColor),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Obx(
                        () {
                          return Column(
                            children: [
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller:
                                    searchController.searchTextController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.done,
                                onChanged: (value) {
                                  searchController.searchString!.value = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.blackColor)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.blackColor)),
                                  hintText: 'Search here.....',
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.blackColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.blackColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.blackColor)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.blackColor,
                                          width: 2)),
                                  //labelText: 'Life story',
                                  filled: true,
                                  fillColor: Constant.whiteColor,
                                  hintStyle:
                                      TextStyle(color: Constant.greyColor),
                                  prefixIcon: Icon(Icons.search,
                                      size: 26.sp, color: Constant.blackColor),
                                ),
                              ),
                              SizedBox(height: 10),
                              SingleChildScrollView(
                                child: SizedBox(
                                  height: 630.h,
                                  child: FutureBuilder<SearchModel?>(
                                    future:
                                        searchController.searchMeditationSong(
                                            searchText: searchController
                                                .searchString!.value),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState ==
                                              ConnectionState.done) {
                                        return ListView.separated(
                                          itemCount: snapshot
                                              .data!.relaxMeditation!.length,
                                          itemBuilder: (context, index) {
                                            return GlassmorphicContainer(
                                              height: 80.h,
                                              width: 400.w,
                                              blur: 100,
                                              borderRadius: 20.r,
                                              border: 5,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 15.h),
                                              borderGradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Constant.whiteColor
                                                      .withOpacity(0.05),
                                                  Constant.whiteColor
                                                      .withOpacity(0.05),
                                                ],
                                              ),
                                              linearGradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Constant.whiteColor
                                                      .withOpacity(0.5),
                                                  Constant.whiteColor
                                                      .withOpacity(0.5),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 10.h),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  /* mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,*/
                                                  children: [
                                                    Container(
                                                      height: 70.h,
                                                      width: 70.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.r),
                                                        color:
                                                            Colors.transparent,
                                                        image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                            '${snapshot.data!.relaxMeditation![index].relaxSoundImage}',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonTextWidget(
                                                            title:
                                                                '${snapshot.data!.relaxMeditation![index].relaxSoundName}',
                                                            textColor: Constant
                                                                .whiteColor,
                                                            fontSize: 16.sp),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(height: 10.h);
                                          },
                                        );
                                      } else {
                                        return Center(
                                            child: Lottie.network(
                                                "https://assets8.lottiefiles.com/packages/lf20_WjWoQM.json"));
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
