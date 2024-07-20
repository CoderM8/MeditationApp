// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/onboarding_screen/onboarding_screen4.dart';
import 'package:meditation/views/utils/buttonwidget.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../../Controller/onboarding_controller.dart';
import '../../../generated/l10n.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  // final OnBoardingController onBoardingController = Get.put(OnBoardingController());

  OnBoardingController c = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    List<Onboarding> onBoardingList = [
      Onboarding(
          imgUrl: "assets/images/onboarding1.svg",
          description: S.of(context).breathYourNegativity),
      Onboarding(
          imgUrl: "assets/images/Frame.svg",
          description: S.of(context).balanceYourBody),
      Onboarding(
          imgUrl: "assets/images/onboarding3.svg",
          description: S.of(context).yogaKeepsYou),
    ];
    return Scaffold(
      body: Container(
        height: 812.h,
        width: 375.w,
        color: Constant.whiteColor,
        child: Column(
          children: [
            SizedBox(height: 60.h),

            /// ===================Meditation String===================
            Styles.regular(S.of(context).meditation, fs: 50.sp, ff: "regular"),
            Expanded(
              child: SizedBox(
                height: 812.h,
                child: PageView.builder(
                  controller: c.controller,
                  onPageChanged: (int index) {
                    c.currentindex.value = index;
                  },
                  itemCount: onBoardingList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        /// ===================Image URL===================
                        SizedBox(height: 70.h),
                        SvgPicture.asset(onBoardingList[index].imgUrl,
                            width: 261.53.w, height: 258.68.h),

                        /// ===================Description===================
                        SizedBox(height: 35.14.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 40.w,
                            ),
                            Flexible(
                              child: Styles.regular(
                                  onBoardingList[index].description,
                                  al: TextAlign.center,
                                  ff: "SFPRODISPLAYMEDIUM.OTF",
                                  fs: 20.sp,
                                  c: Constant.titleColor),
                            ),
                            SizedBox(
                              width: 40.w,
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingList.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  c.currentindex.value++;

                  if (c.currentindex.value != 3) {
                    c.controller.jumpToPage(c.currentindex.value);
                  }

                  if (c.currentindex.value == 3) {
                    Get.offAll(() => OnBoardingScreenFour());
                  }
                },

                /// ===================GetStarted & Next===================
                child: Button(
                    title: c.currentindex.value == onBoardingList.length - 1
                        ? S.of(context).getStarted
                        : S.of(context).next),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 104.h, right: 10.w),
      height: 13.h,
      width: c.currentindex.value == index ? 55 : 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: c.currentindex.value == index
            ? LinearGradient(
                colors: [Constant.titleColor, Constant.titleColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            : LinearGradient(
                colors: [Constant.titleColor, Constant.titleColor],
              ),
      ),
    );
  }
}
