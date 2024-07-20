import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/Breath_Screen/BreathCircle/breathcircle_energize.dart';
import 'package:meditation/views/screens/Relaxingsound_Screen/Relaxing_sound_screen2.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../generated/l10n.dart';
import 'Relax.dart';

class EnergizeBreath extends StatefulWidget {
  const EnergizeBreath({Key? key}) : super(key: key);

  @override
  _EnergizeBreathState createState() => _EnergizeBreathState();
}

class _EnergizeBreathState extends State<EnergizeBreath> {
  String getMint(int index) {
    if (index == 0) {
      return '1';
    } else if (index == 1) {
      return '2';
    } else {
      return '4';
    }
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0.sp),
                  child: SvgPicture.asset(
                    'assets/icons/logo1.svg',
                    height: 27.h,
                    width: 27.w,
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Container(
              height: 45.h,
              width: 45.w,
              child: SvgPicture.asset("assets/icons/breath5.svg"),
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            children: [
              Styles.regular(S.of(context).energize,
                  c: Constant.whiteColor, fs: 25),
            ],
          ),
          SizedBox(height: 5.h),
          Column(
            children: [
              Styles.regular(S.of(context).energizingYogaPractices,
                  c: Colors.grey, fs: 12, al: TextAlign.center),
            ],
          ),
          SizedBox(height: 33.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset("assets/icons/relax1.svg",
                          height: 18.h, width: 19.w),
                      SizedBox(height: 6),
                      Styles.regular(S.of(context).inhale,
                          c: Colors.grey, fs: 10.sp),
                      SizedBox(height: 7),
                      Styles.regular("4 ${S.of(context).second}",
                          c: Colors.grey, fs: 10.sp),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset("assets/icons/relax2.svg",
                          height: 18.h, width: 19.w),
                      SizedBox(height: 6),
                      Styles.regular(S.of(context).exhale,
                          c: Colors.grey, fs: 10.sp),
                      SizedBox(height: 7),
                      Styles.regular("2 ${S.of(context).second}",
                          c: Colors.grey, fs: 10.sp),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 34),
              Divider(
                thickness: 2,
                indent: 15.w,
                endIndent: 15.w,
                color: Colors.grey,
              ),
              SizedBox(height: 16.h),
              Column(
                children: [
                  Styles.regular(S.of(context).chooseYourDuration,
                      c: Colors.white, fs: 18),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                height: 75.h,
                width: 431.w,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: ChooseRoundMinute(
                            index: index,
                            isSelected: isSelected,
                            breathScreen: S.of(context).energize),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Column(
                children: [
                  StreamBuilder<int>(
                      stream: selectedIndex.stream,
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => EnergizeBreathCircle(
                                  time: getMint(selectedIndex.value),
                                ));
                          },
                          child: Container(
                            height: 53.h,
                            width: 253.w,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(26.5.r)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 18.h),
                              child: Styles.regular(S.of(context).startSession,
                                  fs: 18.sp,
                                  c: Colors.white,
                                  al: TextAlign.center),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20.0.h,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MSelectScreenEnergize extends StatefulWidget {
  MSelectScreenEnergize({Key? key}) : super(key: key);

  @override
  _MSelectScreenEnergizeState createState() => _MSelectScreenEnergizeState();
}

class _MSelectScreenEnergizeState extends State<MSelectScreenEnergize> {
  Duration duration = Duration(hours: 1, minutes: 6);

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset("assets/icons/back.svg",
                      height: 22.h, width: 22.w),
                ),
              ],
            ),
            Styles.regular(S.of(context).chooseYourDuration,
                fs: 18.sp, c: Constant.whiteColor),
            Spacer(),
            buildTimePicker(),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => EnergizeBreathCircle(
                      duration: duration,
                    ));
              },
              child: Container(
                height: 53.h,
                width: 253.w,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(26.5.r)),
                child: Padding(
                  padding: EdgeInsets.only(top: 18.h),
                  child: Styles.regular(S.of(context).startSession,
                      fs: 18, c: Colors.white, al: TextAlign.center),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildTimePicker() => SizedBox(
        height: 250.h,
        width: 335.w,
        child: CupertinoTheme(
          data: CupertinoThemeData(brightness: Brightness.dark),
          child: CupertinoTimerPicker(
            itemExtent: 40,
            backgroundColor: Colors.transparent,
            initialTimerDuration: duration,
            mode: CupertinoTimerPickerMode.ms,
            onTimerDurationChanged: (duration) =>
                setState(() => this.duration = duration),
          ),
        ),
      );
}
