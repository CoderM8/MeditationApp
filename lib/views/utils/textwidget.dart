// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/constant.dart';

class Styles {
  static Text regular(String text,
      {double? fs,
      String? ff,
      Color? c,
      double? ls,
      TextAlign? al,
      double? h,
      FontWeight? fw,
      bool strike = false,
      int? lns,
      bool underline = false,
      TextOverflow? ov}) {
    return Text(
      text,
      textScaleFactor: 1.0,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      softWrap: true,
      style: TextStyle(
          fontSize: fs ?? 18,
          fontWeight: fw,
          color: c,
          letterSpacing: ls,
          height: h,
          fontFamily: ff,
          decoration: underline
              ? TextDecoration.underline
              : strike
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
    );
  }
}

class TextFieldPage extends StatelessWidget {
  TextFieldPage(
      {Key? key,
      this.svg = "",
      this.hint,
      this.onPress,
      this.height,
      this.width,
      this.controller})
      : super(key: key);

  final String? svg;
  final String? hint;
  double? height, width;
  TextEditingController? controller;
  Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 314.w,
      height: 50.h,
      child: TextFormField(
        cursorColor: Colors.black,
        style: TextStyle(color: Constant.whiteColor),
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(17.0),
            child: SvgPicture.asset(svg!, height: height, width: width),
          ),
          hintStyle: TextStyle(color: Colors.black, fontSize: 15.sp),
          fillColor: Constant.whiteColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}

Widget TextFieldModel({
  Key? key,
  String? svg,
  String? hint,
  double? width,
  double? height,
  Color? borderColor,
  Color? iconColor,
  Color? textColor,
  Color? hintTextColor,
  TextInputType? keyBoardType,
  TextEditingController? controller,
  bool? password,
  String Function(String?)? valid,
}) {
  return TextFormField(
    validator: valid,
    style: TextStyle(color: textColor == null ? Colors.white : textColor),
    controller: controller,
    obscureText: password!,
    keyboardType: keyBoardType,
    decoration: new InputDecoration(
      border: new OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? Constant.whiteColor : borderColor)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? Constant.whiteColor : borderColor)),
      hintText: hint,
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? Constant.whiteColor : borderColor)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? Constant.whiteColor : borderColor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? Constant.whiteColor : borderColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? Constant.whiteColor : borderColor,
              width: 2)),
      //labelText: 'Life story',
      hintStyle: TextStyle(
          color: hintTextColor == null ? Colors.white : hintTextColor),
      prefixIcon: svg != null
          ? Padding(
              padding: EdgeInsets.all(12.0),
              child: SvgPicture.asset(svg,
                  color: iconColor == null ? Constant.whiteColor : iconColor,
                  height: height,
                  width: width),
            )
          : null,
    ),
  );
}

// class Buttons extends StatelessWidget {
//   Buttons({Key? key, required this.title}) : super(key: key);
//   String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 54.h,
//       width: 253.w,
//       decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(26.5.r)),
//       child: Padding(
//         padding: EdgeInsets.only(top: 18.h),
//         child: Styles.regular(S.of(context).startSession, c: Colors.white, al: TextAlign.center),
//       ),
//     );
//   }
// }
