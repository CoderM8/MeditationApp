import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/constant/constant.dart';

class AlertDialogView extends StatelessWidget {
  AlertDialogView(
      {required this.title,
      required this.content,
      required this.height,
      required this.width});

  final String title;
  final Widget content;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            child: content),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Constant.titleColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.r),
              topRight: Radius.circular(7.r),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                color: Constant.whiteColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
