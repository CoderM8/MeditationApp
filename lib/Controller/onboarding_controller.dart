// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../views/screens/Login screen/sign_in_first_screen.dart';

class OnBoardingController extends GetxController {
  RxBool isOnBoarding = false.obs;
  void onIntroEnd(context) {
    Get.offAll(() => SignInFirstScreen());
  }

  RxList isSelected = [].obs;
  var currentindex = 0.obs;
  var controller = PageController();

  @override
  void onInit() {
    controller = PageController(initialPage: 0);
  }
}
