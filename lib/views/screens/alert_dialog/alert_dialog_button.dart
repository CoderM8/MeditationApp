import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/constant.dart';

class AlertDialogButton extends StatelessWidget {
  AlertDialogButton({required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await onTap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: Constant.whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: Constant.whiteColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
