import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/buttonWidget_constant.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_screen.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_first_screen.dart';
import 'package:meditation/views/utils/buttonwidget.dart';
import 'package:meditation/views/utils/textwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Controller/controller_constant.dart';
import '../../../constant/image_constant.dart';
import '../../../generated/l10n.dart';

class OnBoardingScreenFive extends StatelessWidget {
  const OnBoardingScreenFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            /// ===================Background Image===================
            Positioned.fill(
              child: Container(
                child: Image.asset(onBoarding4BackImage, fit: BoxFit.cover),
              ),
            ),

            /// ===================Back Arrow Icon===================
            Positioned(
              top: 30,
              left: 20,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),

                /// ===================Description String===================
                SizedBox(height: 20.h),
                Styles.regular(S.of(context).areYouInterested,
                    c: Constant.whiteColor, fs: 18.sp),

                /// ===================SubDescription String===================
                SizedBox(height: 5.h),
                Styles.regular(S.of(context).selectAll,
                    c: Constant.whiteColor, fs: 12.sp),

                /// ===================Listview===================
                SizedBox(height: 30.h),
                Column(
                  children: List.generate(
                    title1.length,
                    (index) => GestureDetector(
                      onTap: () {
                        if (konBoardingController.isSelected
                            .contains(title1[index])) {
                          konBoardingController.isSelected
                              .remove(title1[index]);
                        } else {
                          konBoardingController.isSelected.add(title1[index]);
                        }
                        print(
                            'isSelected value  ====> ${konBoardingController.isSelected}');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.h),
                        child: CustomButtonModel(
                          title: title1[index],
                        ),
                      ),
                    ),
                  ),
                ),

                /// ===================Continue===================
                // SizedBox(height: 90.h),
                Spacer(
                  flex: 6,
                ),
                ButtonWidget(
                    title: S.of(context).continueButton,
                    titleColor: Colors.black,
                    onTap: () {
                      if (konBoardingController.isSelected.isNotEmpty) {
                        konBoardingController.isSelected.clear();
                        Get.to(() => SignInFirstScreen());
                      } else {
                        Get.snackbar('ERROR !!', 'Please choose any one',
                            backgroundColor: Colors.red.withOpacity(0.4),
                            colorText: Constant.whiteColor);
                      }
                    }),
                // ButtonWidget(onClicked: onClicked)
                // botton(
                //   colors: Constant.whiteColor,
                //   titles: S.of(context).continueButton,
                //   context: context,
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) {
                //           return
                //         },
                //       ),
                //     );
                //   },
                // ),

                /// ===================Skip For Now===================
                // SizedBox(height: 30.h),
                Spacer(),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => SignInScreen());
                      },
                      child: Styles.regular(S.of(context).skipForNow,
                          c: Constant.whiteColor)),
                ),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
