import 'package:get/get.dart';
import 'package:meditation/Controller/homescreen_controller.dart';
import 'package:meditation/Controller/sleep_controller.dart';

import 'Music_controller/all_song_controller.dart';
import 'onboarding_controller.dart';

HomeController kHomeController = Get.put(HomeController());
OnBoardingController konBoardingController = Get.put(OnBoardingController());
AllSongController kAllSongController = Get.put(AllSongController());
SleepController kSleepController = Get.put(SleepController());
