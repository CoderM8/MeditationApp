import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/common_text_widget.dart';
import 'package:meditation/constant/constant.dart';

class SubSectionWidget extends StatelessWidget {
  SubSectionWidget(
      {required this.img, required this.title, required this.subtitle});

  final String img, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Constant.whiteColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          CommonTextWidget(
              title: title, textColor: Constant.whiteColor, fontSize: 14.sp),
          CommonTextWidget(
              title: subtitle, textColor: Constant.whiteColor, fontSize: 10.sp),
        ],
      ),
    );
  }
}
