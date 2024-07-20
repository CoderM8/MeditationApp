import 'package:flutter/material.dart';

class TextWidget {
  static Text regular(String text,
      {double? fontSize,
      String? fontFamily,
      Color? color,
      double? letterSpacing,
      TextAlign? textAlign,
      double? height,
      FontWeight? fontWeight,
      bool strike = false,
      int? maxLines,
      bool underline = false,
      TextOverflow? textOverflow}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: textOverflow,
      softWrap: true,
      style: TextStyle(
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
          height: height,
          fontFamily: fontFamily,
          decoration: underline
              ? TextDecoration.underline
              : strike
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
    );
  }
}
