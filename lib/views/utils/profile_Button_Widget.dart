// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/constant.dart';

class ProfileButtonPage extends StatelessWidget {
  ProfileButtonPage({
    Key? key,
    this.hint,
    this.onPress,
    this.title,
    this.width,
    this.actionWidget,
    this.height,
    this.icon,
  }) : super(key: key);

  final IconData? icon;
  final String? hint;
  final Widget? actionWidget;
  String? title;
  Function()? onPress;
  bool? obs = false;
  double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 333.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Constant.whiteColor.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.asset(svg!, height: height, width: width),
                Icon(
                  icon!,
                  color: Colors.white,
                ),
                SizedBox(width: 13.w),
                Text(
                  hint ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: actionWidget),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
