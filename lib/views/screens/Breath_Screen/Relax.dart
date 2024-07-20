import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/views/screens/Breath_Screen/Unwind.dart';
import 'package:meditation/views/screens/Breath_Screen/energize.dart';
import 'package:meditation/views/screens/Breath_Screen/focus.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../../generated/l10n.dart';
import '../Relaxingsound_Screen/Relaxing_sound_screen2.dart';
import 'BreathCircle/breathcircle_relax.dart';

class Relax extends StatefulWidget {
  const Relax({Key? key}) : super(key: key);

  @override
  _RelaxState createState() => _RelaxState();
}

class _RelaxState extends State<Relax> {
  bool isSelected = false;
  String getMint(int index) {
    if (index == 0) {
      return '1';
    } else if (index == 1) {
      return '2';
    } else {
      return '4';
    }
  }

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
              child: SvgPicture.asset("assets/icons/breath2.svg"),
            ),
          ),
          SizedBox(height: 16.h),
          Styles.regular(S.of(context).breath, c: Constant.whiteColor, fs: 25),
          SizedBox(height: 5.h),
          Styles.regular(
              S.of(context).calmCalmYourMindAndBodyWithLongerExhalations,
              c: Colors.grey,
              fs: 12,
              al: TextAlign.center),
          SizedBox(height: 33.h),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 115.0),
                    child: Column(
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
                  ),
                  SizedBox(width: 43.w),
                  Padding(
                    padding: const EdgeInsets.only(left: 43.0),
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/icons/relax2.svg",
                            height: 18.h, width: 19.w),
                        SizedBox(height: 6),
                        Styles.regular(S.of(context).exhale,
                            c: Colors.grey, fs: 10.sp),
                        SizedBox(height: 7),
                        Styles.regular("6 ${S.of(context).second}",
                            c: Colors.grey, fs: 10.sp),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34),
              Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
                thickness: 2,
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
                            breathScreen: S.of(context).relax),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              StreamBuilder<int>(
                  stream: selectedIndex.stream,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => RelaxBreathCircle(
                                  time: getMint(selectedIndex.value),
                                ));
                          },
                          child: Container(
                            height: 54.h,
                            width: 253.w,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(26.5.r)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 18.h),
                              child: Styles.regular(S.of(context).startSession,
                                  fs: 18,
                                  c: Colors.white,
                                  al: TextAlign.center),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0.h,
                        )
                      ],
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}

class ChooseRoundMinute extends StatefulWidget {
  ChooseRoundMinute(
      {Key? key,
      this.isSelected = false,
      this.index,
      required this.breathScreen})
      : super(key: key);
  bool isSelected;
  final String breathScreen;

  final int? index;

  @override
  _ChooseRoundMinuteState createState() => _ChooseRoundMinuteState();
}

class _ChooseRoundMinuteState extends State<ChooseRoundMinute> {
  List<String> time = [
    '1 min',
    '2 min',
    '4 min',
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('INDEX == ${widget.index}');
        selectedIndex.value = widget.index ?? 0;

        if (widget.index == 3) {
          print('INDEX == IN');
          Navigator.pop(context);
          showModalBottomSheet(
            isScrollControlled: true,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            backgroundColor: Color(0xFF002D38),
            context: context,
            builder: (context) {
              if (widget.breathScreen.contains('Relax')) {
                return MSelectScreenRelax();
              } else if (widget.breathScreen.contains('Focus')) {
                return MSelectScreenFocus();
              } else if (widget.breathScreen.contains('Unwind')) {
                return MSelectScreenUnwind();
              } else {
                return MSelectScreenEnergize();
              }
            },
          );
        }
        setState(
          () {
            widget.isSelected = !widget.isSelected;
          },
        );
      },
      child: StreamBuilder<int>(
          stream: selectedIndex.stream,
          builder: (context, snapshot) {
            return Container(
              height: 65.h,
              width: 65.w,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff06576A).withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 10,
                        offset: Offset(0, 3)),
                  ],
                  border: Border.all(
                      color: selectedIndex.value == widget.index
                          ? Colors.white
                          : Colors.transparent,
                      width: 2)),
              child: widget.index == 3
                  ? Center(
                      child: Icon(Icons.add, color: Colors.white, size: 30),
                    )
                  : Container(
                      width: 70.w,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.0,
                          time[widget.index ?? 0],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
            );
          }),
    );
  }
}

class MSelectScreenRelax extends StatefulWidget {
  MSelectScreenRelax({Key? key}) : super(key: key);

  @override
  _MSelectScreenRelaxState createState() => _MSelectScreenRelaxState();
}

class _MSelectScreenRelaxState extends State<MSelectScreenRelax> {
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
                Get.to(() => RelaxBreathCircle(
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
