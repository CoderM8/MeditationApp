import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/constant.dart';
import 'package:meditation/services/local_storage_service.dart';
import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../../generated/l10n.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    navigatetohome();
    super.initState();
  }

  var register;
  navigatetohome() async {
    register = LocalStorageServices().box.read('uid');
    await Future.delayed(const Duration(seconds: 5));
    Get.off(() => register == null ? OnBoardingScreen() : BottomNavigator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 326.h),
            child: Center(
              /// ===================Logo String===================
              child: /*Styles.regular(S.of(context).logo, fs: 50.sp, fw: FontWeight.bold)*/
                  Image.asset(
                'assets/Logo/Meditation_logo.jpg',
                height: 200.h,
                width: 200.0.w,
              ),
            ),
          ),

          /// ===================Take Breath===================
          SizedBox(height: 23.h),
          Center(
            child: Styles.regular(S.of(context).takeBreath,
                fs: 20.sp, c: Constant.titleColor),
          ),
        ],
      ),
    );
  }
}
