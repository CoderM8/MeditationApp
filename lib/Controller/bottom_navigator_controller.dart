import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation/views/screens/homepage/home_screen.dart';
import 'package:meditation/views/screens/meditation/Meditationpage.dart';
import 'package:meditation/views/screens/music/Musicpage.dart';
import 'package:meditation/views/screens/profile/Profilepage.dart';
import 'package:meditation/views/screens/sleep/sleep_screen.dart';
// import 'package:we_slide/we_slide.dart';

class BottomNavigatorController extends GetxController {
  final RxInt index = 0.obs;
  // WeSlideController weSlideController = WeSlideController();
  RxDouble sizes = 0.0.obs;
  RxBool bottomSheetVisibility = false.obs;

  List<Widget> tabPage = [
    HomeScreen(),
    MeditationPage(),
    SleepScreen(),
    MusicPage(),
    ProfilePage(showBack: false),
  ];
}
