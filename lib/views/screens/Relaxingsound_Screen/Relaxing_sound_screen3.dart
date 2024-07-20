import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/views/screens/Breathcircle_2.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../../constant/constant.dart';
import '../../../generated/l10n.dart';

class RelaxingSoundThree extends StatefulWidget {
  final String? imageUrl;
  final String? songUrl;
  RelaxingSoundThree({Key? key, this.imageUrl, this.songUrl}) : super(key: key);

  @override
  _RelaxingSoundThreeState createState() => _RelaxingSoundThreeState();
}

class _RelaxingSoundThreeState extends State<RelaxingSoundThree> {
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
              height: 80.0.h,
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
            Styles.regular("Choose your duration",
                fs: 18.sp, c: Constant.whiteColor),
            Spacer(),
            buildTimePicker(),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => BreathCircleSecond(
                      songUrl: widget.songUrl,
                      imageUrl: widget.imageUrl,
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
            mode: CupertinoTimerPickerMode.hm,
            onTimerDurationChanged: (duration) =>
                setState(() => this.duration = duration),
          ),
        ),
      );
}
