import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final double fontSize;
  const CommonTextWidget(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: textColor, fontSize: fontSize),
    );
  }
}
