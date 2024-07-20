// ignore_for_file: unnecessary_null_comparison

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/views/screens/loadingscreen/loader.dart';

class Constant {
  static Color whiteColor = Color(0xffFFFFFF);
  static Color blackColor = Color(0xFF000000);
  static Color redColor = Color(0xFFFF0202);
  static Color greyColor = Color(0xFF504F4F);
  static Color darkThemeColor = Color(0xff002D38);
  static Color lightThemeColor = Color(0xff084E60);
  static Color alertDialogColor = Color(0xff071217);
  static Color titleColor = Color(0xff071B21);
  static Color blueGreyColor = Color(0xFF90A4AE);
  static Color kTransparent = Colors.transparent;
}

bool mode = false;

class Api {
  static const mainApi =
      'https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/api.php';
  // static const mainApi =
  //       'https://vocsyinfotech.in/vocsy/laravel/Meditation_For_Relax/api.php';
}

RxBool isSkip = false.obs;

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => const Loading(),
  );
}

void hideLoader(BuildContext context) {
  Navigator.of(context).pop(const Loading());
}

class Onboarding {
  final String imgUrl;
  final String description;

  Onboarding({required this.imgUrl, required this.description});
}

List<Meditations> mList = [
  Meditations(imgUrl: "assets/images/Rectangle 30.jpg", title: "Sleep"),
  Meditations(imgUrl: "assets/images/Rectangle 31.jpg", title: "Sleep Well"),
  Meditations(
      imgUrl: "assets/images/Group 193.jpg", title: "Sleep When You’re.."),
];

class Meditations {
  final String imgUrl;
  final String title;

  Meditations({required this.imgUrl, required this.title});
}
// Widget loaderAnimation = Lottie.asset('assets/Lottie/loader.json');

List<Story> sList = [
  Story(
      imgUrl: "assets/images/Rectangle 30 (4).jpg",
      title: "Hammock Naps with the.."),
  Story(
      imgUrl: "assets/images/Rectangle 31 (2).jpg",
      title: "Afternoon Nap in the park"),
  Story(imgUrl: "assets/images/Rectangle 32 (1).jpg", title: "The Cosmic Dwn"),
];

class Themes {
  static final light =
      ThemeData.light().copyWith(colorScheme: ColorScheme.light());
  static final dark =
      ThemeData.dark().copyWith(colorScheme: ColorScheme.dark());

  ThemeMode get theme =>
      loadThemeFromBox() != null ? ThemeMode.dark : ThemeMode.light;

  Future<bool> loadThemeFromBox() async {
    mode = (LocalStorageServices.box.read("isDark") == null
        ? false
        : await LocalStorageServices.box.read("isDark"));
    return mode;
  }

  _saveThemeToBox(Future<bool> isDarkMode) async {
    bool isCheck = await isDarkMode;
    LocalStorageServices.box.write('isDark', isCheck);
  }

  void switchTheme() {
    Get.changeThemeMode(
        loadThemeFromBox() != null ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(loadThemeFromBox());
  }
}

class Story {
  final String imgUrl;
  final String title;

  Story({required this.imgUrl, required this.title});
}

List audio = [];

void goToScreen(BuildContext context, String screenName) {
  Navigator.pushNamed(context, '/$screenName');
}

List<Audio> audios = <Audio>[];

List image = [
  'assets/icons/Group 1.svg',
  'assets/icons/flower.svg',
  'assets/icons/stone.svg',
  'assets/icons/smile.svg',
  'assets/icons/yoga.svg',
  'assets/icons/lotus.svg',
  'assets/icons/sleep.svg'
];
List filledImage = [
  'assets/icons/FV1.svg',
  'assets/icons/FV2.svg',
  'assets/icons/FV3.svg',
  'assets/icons/FV4.svg',
  'assets/icons/FV5.svg',
  'assets/icons/FV6.svg',
  'assets/icons/FV7.svg'
];
List title = [
  "Reduce Anxiety",
  "Reduce Stress",
  "Build self Esteem",
  "Increase Happiness",
  "Improve Performance",
  "Develop Gratitude",
  "Better Sleep"
];

List title1 = [
  "Not interested",
  "Fall a sleep faster",
  "Help relaxing",
  "Reduce stress or anxiety",
  "Manage emotions",
  "Learn mindfulness"
];
