import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../Controller/controller_constant.dart';
import '../../constant/constant.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      height: 50.h,
      width: 160.w,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Styles.regular(title,
            fs: 20.sp, c: Constant.whiteColor, al: TextAlign.center),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Constant.titleColor),
    );
  }
}

/// custom
class CustomButtonModel extends StatefulWidget {
  CustomButtonModel(
      {Key? key, this.title, this.svg, this.Filledsvg, this.isImage = false})
      : super(key: key);

  final String? title;
  final String? svg;
  final String? Filledsvg;
  bool isImage;

  @override
  _CustomButtonModelState createState() => _CustomButtonModelState();
}

class _CustomButtonModelState extends State<CustomButtonModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 63.h,
        width: 314.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: !konBoardingController.isSelected.contains(widget.title)
                ? Color(0xff0B3240).withOpacity(0.5)
                : Color(0XFF0B3240),
            border: Border.all(
                color: !konBoardingController.isSelected.contains(widget.title)
                    ? Colors.transparent
                    : Colors.white54,
                width: 1),
            borderRadius: BorderRadius.circular(30.r)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    widget.isImage
                        ? konBoardingController.isSelected
                                .contains(widget.title)
                            ? SvgPicture.asset(
                                widget.Filledsvg ?? '',
                                height: 25.h,
                                // fit: BoxFit.cover,
                                semanticsLabel: 'Acme Logo',
                                width: 25.w,
                              )
                            : SvgPicture.asset(
                                widget.svg ?? '',
                                height: 25.h,
                                // fit: BoxFit.cover,
                                width: 25.w,
                              )
                        : Container(),
                    SizedBox(
                      width: 20..w,
                    ),
                    Text(
                      widget.title!,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
