import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/screens/Breath_Screen/Relax.dart';
import 'package:meditation/views/screens/Breath_Screen/Unwind.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../generated/l10n.dart';
import '../../../services/admobads.dart';
import 'energize.dart';
import 'focus.dart';

class Breath extends StatefulWidget {
  Breath({Key? key}) : super(key: key);

  @override
  _BreathState createState() => _BreathState();
}

class _BreathState extends State<Breath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child:
                SvgPicture.asset('assets/images/Breath.svg', fit: BoxFit.cover),
          ),
          Positioned(
            top: 40.h,
            left: 30.w,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset("assets/icons/logo1.svg",
                  height: 35.h, width: 35.w),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/breath1.png",
                  height: 232.h, width: 203.w),
              Text(
                  textAlign: TextAlign.center,
                  S.of(context).startYourExperience,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  )),
              SizedBox(
                height: 5.h,
              ),
              Text(
                S.of(context).whatWouldYouLikeToFocusOn,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF).withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0.h),
              Center(child: admobads().bannerads()),
              SizedBox(height: 10.0.h),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Color(0xff002D38),
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    context: context,
                    builder: (context) {
                      return Relax();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 65.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: SvgPicture.asset("assets/icons/breath2.svg",
                              height: 17.h, width: 17.w),
                        ),
                        SizedBox(width: 28.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Styles.regular(S.of(context).relax,
                                fs: 16.sp,
                                c: Colors.white,
                                al: TextAlign.start),
                            Styles.regular("4-6 ${S.of(context).breathing}",
                                fs: 12.sp, c: Colors.grey),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0xff002D38),
                      shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      context: context,
                      builder: (context) {
                        return FocusBreath();
                      },
                    );
                  },
                  child: Container(
                    height: 65.h,
                    alignment: Alignment.center,
                    width: 335.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset("assets/icons/breath3.svg",
                            height: 18.h, width: 14.w),
                        SizedBox(width: 28.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Styles.regular(S.of(context).focus,
                                fs: 16.sp,
                                c: Colors.white,
                                al: TextAlign.start),
                            Styles.regular("4-4-4-4 ${S.of(context).breathing}",
                                fs: 12.sp, c: Colors.grey),
                          ],
                        ),
                        Spacer(),

                        /// ******************* lock **********
                        /*  IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),  */
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0xff002D38),
                      shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      context: context,
                      builder: (context) {
                        return UnwindBreath();
                      },
                    );
                  },
                  child: Container(
                    height: 65.h,
                    width: 335.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/icons/breath4.svg",
                            height: 15.h, width: 15.w),
                        SizedBox(width: 28.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Styles.regular(S.of(context).unwind,
                                fs: 16.sp,
                                c: Colors.white,
                                al: TextAlign.start),
                            Styles.regular("4-7-8 ${S.of(context).breathing}",
                                fs: 12.sp, c: Colors.grey),
                          ],
                        ),
                        Spacer(),

                        /// **************** lock *************
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.lock,
                        //     color: Colors.white.withOpacity(0.4),
                        //   ),
                        // ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0xff002D38),
                      shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      context: context,
                      builder: (context) {
                        return EnergizeBreath();
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 65.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/icons/breath5.svg",
                            height: 17.h, width: 17.w),
                        SizedBox(width: 28.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Styles.regular(
                              S.of(context).energize,
                              fs: 16.sp,
                              c: Colors.white,
                            ),
                            Styles.regular("4-2 ${S.of(context).breathing}",
                                fs: 12.sp, c: Colors.grey),
                          ],
                        ),
                        Spacer(),

                        /// **************** lock *************
                        /*  IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),*/
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),

                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
