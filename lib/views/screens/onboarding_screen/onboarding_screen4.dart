import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/controller_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/onboarding_screen/onboarding_screen5.dart';
import 'package:meditation/views/utils/buttonwidget.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../constant/buttonWidget_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../generated/l10n.dart';

class OnBoardingScreenFour extends StatefulWidget {
  const OnBoardingScreenFour({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenFourState createState() => _OnBoardingScreenFourState();
}

class _OnBoardingScreenFourState extends State<OnBoardingScreenFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w,
        height: 812.h,
        child: Stack(
          children: [
            /// ===================Background Image===================
            Positioned.fill(
              child: Container(
                child: Image.asset(onBoarding4BackImage, fit: BoxFit.cover),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 50.h, /* left: 40.w*/
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// ===================Close Icon===================
                  /*   Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Constant.blueGreyColor,
                    ),
                    height: 30.h,
                    width: 30.w,
                    child: Icon(Icons.close, color: Constant.whiteColor),
                  ),*/

                  /// ===================Description String===================
                  SizedBox(height: 20.h),
                  Styles.regular(S.of(context).whatBrings,
                      c: Constant.whiteColor, fs: 18.sp),

                  /// ===================SubDescription String===================
                  SizedBox(height: 5.h),
                  Styles.regular(S.of(context).wellPersonalize,
                      c: Constant.whiteColor, fs: 12.sp),

                  /// ===================Listview===================
                  SizedBox(height: 30.h),
                  Column(
                    children: List.generate(
                      image.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.h),
                        child: GestureDetector(
                          onTap: () {
                            if (konBoardingController.isSelected
                                .contains(title[index])) {
                              konBoardingController.isSelected
                                  .remove(title[index]);
                            } else {
                              konBoardingController.isSelected
                                  .add(title[index]);
                            }
                            print(
                                'isSelected value  ====> ${konBoardingController.isSelected}');
                          },
                          child: CustomButtonModel(
                            title: title[index],
                            isImage: true,
                            Filledsvg: filledImage[index],
                            svg: image[index],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// ===================Continue===================
                  // SizedBox(height: 90.h),
                  Spacer(),
                  ButtonWidget(
                      borderRadius: 34.sp,
                      title: S.of(context).continueButton,
                      titleColor: Colors.black,
                      onTap: () {
                        if (konBoardingController.isSelected.isNotEmpty) {
                          konBoardingController.isSelected.clear();
                          Get.to(() => OnBoardingScreenFive());
                        } else {
                          Get.snackbar('ERROR !!', 'Please choose any one',
                              backgroundColor: Colors.red.withOpacity(0.4),
                              colorText: Constant.whiteColor);
                        }
                      }),

                  // botton(
                  //   colors: Constant.whiteColor,
                  //   titles:S.of(context).continueButton,
                  //   context: context,
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return OnBoardingScreenFive();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
