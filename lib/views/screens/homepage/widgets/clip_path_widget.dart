import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../Controller/controller_constant.dart';
import '../../../../model/MultiSelectChip/multi_select_chip_model.dart';
import '../../../../constant/constant.dart';
import 'curved_bottom_widget.dart';
import 'multi_select_chip_widget.dart';

class ClipPathWidget extends StatefulWidget {
  ClipPathWidget({Key? key}) : super(key: key);

  @override
  State<ClipPathWidget> createState() => _ClipPathWidgetState();
}

class _ClipPathWidgetState extends State<ClipPathWidget> {
  @override
  void initState() {
    super.initState();
    kHomeController.multiChipServiceApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5, top: 45.h),
      child: ClipPath(
        clipper: CurvedBottomClipper(),
        child: Obx(() {
          return AnimatedContainer(
            height: kHomeController.height.value,
            duration: Duration(seconds: 1),
            child: GlassmorphicContainer(
              blur: 5,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              border: 1,
              height: kHomeController.height.value,
              borderRadius: 15.sp,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0.w.h),
                    child: Obx(() {
                      return Visibility(
                        visible: kHomeController.visible.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            StreamBuilder<MultiSelectChipModel?>(
                                stream:
                                    kHomeController.getMultiChipModel.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData ||
                                      snapshot.connectionState ==
                                          ConnectionState.done) {
                                    List<String> chips = [];

                                    for (var i = 0;
                                        i <
                                            snapshot
                                                .data!.relaxMeditation.length;
                                        i++) {
                                      chips.add(snapshot.data!
                                          .relaxMeditation[i].feelingName);
                                    }
                                    return MultiSelectChip(
                                      chips,
                                      onSelectionChanged: (selectedList) {
                                        kHomeController.selectedReportList!
                                            .value = selectedList;
                                        kHomeController.isDropdown.value =
                                            !kHomeController.isDropdown.value;
                                        kHomeController.visibles.value = false;
                                        kHomeController.height.value =
                                            kHomeController.height.value > 100
                                                ? 100
                                                : 500;
                                        kHomeController.visible.value =
                                            !kHomeController.visible.value;
                                        var assort = snapshot
                                            .data!.relaxMeditation
                                            .indexWhere((element) => element
                                                .feelingName
                                                .toString()
                                                .contains(
                                                    selectedList.toString()));
                                        kHomeController.id = snapshot.data!
                                            .relaxMeditation[assort].feelingId;
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                            SizedBox(height: 19.h),
                            Column(
                              children: [
                                Obx(() {
                                  return Padding(
                                    padding: kHomeController.isReadMore.value ==
                                            false
                                        ? EdgeInsets.only(
                                            right: 120.w, left: 120.w)
                                        : EdgeInsets.only(
                                            right: 100.w, left: 100.w),
                                    child: Visibility(
                                      visible: kHomeController.visiblest.value,
                                      child: InkWell(
                                        onTap: () {
                                          kHomeController.isReadMore.value =
                                              !kHomeController.isReadMore.value;
                                          kHomeController.visiblest.value =
                                              kHomeController.visible.value ==
                                                      true
                                                  ? true
                                                  : false;
                                          kHomeController.visibles.value =
                                              kHomeController.height.value > 500
                                                  ? false
                                                  : true;
                                          kHomeController.height.value == 650
                                              ? 300.h
                                              : 650.h;
                                        },
                                        child: Container(
                                          height: 32.h,
                                          width: kHomeController
                                                      .isReadMore.value ==
                                                  true
                                              ? 100.w
                                              : 80.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(115),
                                              color: Constant.whiteColor),
                                          padding: EdgeInsets.all(10.w.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                (kHomeController
                                                        .isReadMore.value
                                                    ? 'Read Less'
                                                    : ' More'),
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                              Icon(
                                                Icons.expand_more,
                                                size: 20.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: kHomeController.visibles.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          MultiSelectChip(
                            kHomeController.moreReportList,
                            onSelectionChanged: (selectedList) {
                              kHomeController.selectedReportList!.value =
                                  selectedList;
                            },
                          ),
                          // Text(selectedReportList.toString()),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
