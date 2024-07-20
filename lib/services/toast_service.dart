import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/constant.dart';

class ToastService {
  toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 15.sp,
      textColor: mode == false ? Constant.whiteColor : Constant.blackColor,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor:
          mode == false ? Constant.blackColor : Constant.whiteColor,
    );
  }
}
