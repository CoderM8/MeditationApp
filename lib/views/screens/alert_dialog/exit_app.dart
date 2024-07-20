import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/constant/constant.dart';
import 'alert_dialog_button.dart';
import 'alert_dialog_view.dart';

class ExitApp extends StatelessWidget {
  const ExitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constant.darkThemeColor,
      content: AlertDialogView(
        title: "Exit App",
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        content: Column(
          children: [
            Spacer(),
            Spacer(),
            Text(
              "Are you sure you want to exit?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Constant.whiteColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                AlertDialogButton(
                  title: "Yes",
                  onTap: () {
                    exit(0);
                  },
                ),
                Spacer(),
                AlertDialogButton(
                  title: "No",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
