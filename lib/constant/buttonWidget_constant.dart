import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/utils/textwidget.dart';

class ButtonWidget extends GetView {
  const ButtonWidget(
      {Key? key,
      required this.title,
      required this.titleColor,
      this.buttonColor,
      required this.onTap,
      this.width,
      this.height,
      this.borderRadius,
      this.fontSize,
      this.isBorder = false,
      this.isEmpty = false,
      this.fontWeight,
      this.icon})
      : super(key: key);
  final String title;
  final Color titleColor;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? borderRadius;
  final bool? isBorder;
  final bool? isEmpty;

  final FontWeight? fontWeight;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 50.h,
          width: width ?? 335.w,
          decoration: isEmpty == true
              ? BoxDecoration(
                  color: isBorder == true
                      ? Colors.transparent
                      : buttonColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                  border: isBorder == true
                      ? Border.all(color: Colors.transparent, width: 1.w)
                      : null)
              : BoxDecoration(
                  color: isBorder == true
                      ? Colors.transparent
                      : buttonColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                  border: isBorder == true
                      ? Border.all(color: Colors.transparent, width: 1.w)
                      : null),
          child: Center(
            child: Styles.regular(
              title,
              fs: 15.sp,
              al: TextAlign.center,
            ),
          )),
    );
  }
}
