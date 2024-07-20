import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({Key? key, this.hint, this.onPress, this.title, this.erroelogin})
      : super(key: key);

  // final TextEditingController controller;

  final String? hint;
  String? title;
  Function()? onPress;
  bool? obs = false;
  final String? erroelogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132.w,
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Align(
        child: Text(
          title!,
          style: TextStyle(fontSize: 15.sp),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
