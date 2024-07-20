import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Services/MultiSelectChip/MultiSelectChipid_services.dart';
import 'package:meditation/Services/authentication_services/home_service.dart';
import 'package:meditation/Services/home_services/quick_easy_id_service.dart';
import 'package:meditation/model/MultiSelectChip/multi_select_chip_id_model.dart';
import 'package:meditation/model/MultiSelectChip/multi_select_chip_model.dart';
import 'package:meditation/model/Music_model/relaxing_sound_music_model.dart'
    as relaxing_sound;
import 'package:meditation/model/home_model/Quick&easy_model.dart';
import 'package:meditation/model/home_model/cat_list_model.dart';
import 'package:meditation/model/home_model/quick_easy_id_model.dart';
import 'package:meditation/model/homemodel/favourite_model.dart';
import 'package:meditation/model/homemodel/home_banner_model.dart';
import 'package:meditation/model/homemodel/home_model.dart';
import 'package:meditation/model/homemodel/home_section_model.dart';
import 'package:meditation/model/homemodel/like_model.dart';
import 'package:meditation/model/homemodel/meditation_section.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';

import '../Services/authentication_services/BaseNetworkApi.dart';

class HomeController
    extends GetxController {
  RxBool selected = false.obs;
  RxBool selectAll = false.obs;
  CatListModel? getCategoryData;
  MultiSelectChipModel? getChipData;
  QuickEasyModel? quickEasyData;
  RxBool isDropdown = true.obs;
  RxList isLike = [].obs;
  QuickEasyIdModel? quickEasyIdData;
  RxInt index = 0.obs;
  RxString title = ''.obs;
  MultiSelectChipIdModel? getChipIdData;
  RxString idMulti = "".obs;
  MeditationSection? meditationData;
  RxString? selectedReportList = ''.obs;
  var id;
  RxBool isReadMore = false.obs;
  RxDouble height = 50.h.obs;
  RxBool visible = false.obs;
  RxBool onTap = false.obs;
  RxBool visibles = false.obs;
  RxBool visiblest = true.obs;
  HomeModel? home;
  HomeBannerModel? homeBannerModel;
  HomeSectionModel? homeSection;

  // Relaxingsoundmusic? homeMusic;
  LikeModel? likeData;
  FavouriteModel? favouriteData;
  RxString username = ''.obs;
  RxString userEmail = ''.obs;
  RxString userFirstLetter = ''.obs;

  List<String> moreReportList = [
    "On The way",
    "Trying to wake up",
    "Walking",
    "Getting ready to exercise",
    "Eating",
    "Nothing",
    "Learning mindfulness",
    "Trying to sleep"
  ];

  /// quickAsy Controller

  Rx<QuickEasyModel> quickAsyModel =
      QuickEasyModel(
          relaxMeditation: []).obs;

  void quickServices(
      BuildContext context) async {
    quickAsyModel.value.relaxMeditation
        .clear();
    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"home_section_2","package_name":"com.eng.audiobook"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      quickAsyModel.value =
          QuickEasyModel.fromJson(
              jsonData);
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMETHING IS WRONG');
    }
    quickAsyModel.refresh();
  }

  Rx<QuickEasyModel> homeTabSection =
      QuickEasyModel(
          relaxMeditation: []).obs;

  void homeTabSectionServices(
      BuildContext context) async {
    homeTabSection.value.relaxMeditation
        .clear();
    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"home_section","package_name":"com.eng.audiobook"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      homeTabSection.value =
          QuickEasyModel.fromJson(
              jsonData);
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMETHING IS WRONG');
    }
    homeTabSection.refresh();
  }

  Stream<HomeSectionModel>
      homeTabSectionIDServices({
    required String id,
  }) async* {
    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"home_section_id","package_name":"com.eng.audiobook","homesection_id":$id,"page":"1"}');
    if (response != null) {
      yield homeSectionModelFromJson(
          response);
    } else {
      print(
          'hello this is error ===> !!!!!!!!!!!!!!');
      Get.snackbar('ERROR !!!!',
          'SOMETHING IS WRONG');
    }
  }

  /// relaxingSoundMusic Controller
  Rx<relaxing_sound.Relaxingsoundmusic>
      relaxingSoundMusicModel =
      relaxing_sound.Relaxingsoundmusic(
          relaxMeditation: []).obs;
  RxList<
          relaxing_sound
          .RelaxMeditation?>
      relaxingSoundMusicList =
      <relaxing_sound.RelaxMeditation>[]
          .obs;

  Future<void>
      relaxingSoundMusicApi() async {
    relaxingSoundMusicModel
        .value.relaxMeditation
        .clear();
    WidgetsBinding.instance
        .addPostFrameCallback(
      (timeStamp) {
        relaxingSoundMusicList.clear();
      },
    );

    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"get_relaxsound","package_name":"com.eng.audiobook"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      relaxingSoundMusicModel.value =
          relaxing_sound
                  .Relaxingsoundmusic
              .fromJson(jsonData);

      relaxingSoundMusicModel.value
          .relaxMeditation.reversed
          .forEach((element) {
        relaxingSoundMusicList
            .add(element);
      });
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMTHING WRONG');
    }
    relaxingSoundMusicModel.refresh();
  }

  /// category Controller
  Rx<CatListModel> catListModel =
      CatListModel(relaxMeditation: [])
          .obs;

  void categoryService() async {
    catListModel.value.relaxMeditation
        .clear();
    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"cat_list","package_name":"com.eng.audiobook","page":"1"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      catListModel.value =
          CatListModel.fromJson(
              jsonData);
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMETHING IS WRONG');
    }
    catListModel.refresh();
  }

  /// getMultiChip Controller
  Rx<MultiSelectChipModel>
      getMultiChipModel =
      MultiSelectChipModel(
          relaxMeditation: []).obs;

  void multiChipServiceApi() async {
    getMultiChipModel
        .value.relaxMeditation
        .clear();
    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"get_feeling","package_name":"com.eng.audiobook"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      getMultiChipModel.value =
          MultiSelectChipModel.fromJson(
              jsonData);
      username.value =
          (LocalStorageServices.box
              .read('UserName'))!;
      userEmail.value =
          (LocalStorageServices.box
              .read('UserEmail'))!;
      userFirstLetter.value =
          (LocalStorageServices.box
              .read(
                  'UserFirstLetter'))!;
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMETHING IS WRONG');
    }
    getMultiChipModel.refresh();
    return null;
  }

  /// one code on Future Builder
  Future<HomeSectionModel?>
      homeSectionData({id}) async {
    homeSection = await HomeService()
        .HomesectionFromid(id: id);
    return homeSection;
  }

  Future<QuickEasyIdModel?> getIdQuick(
      {required String id}) async {
    quickEasyIdData =
        await Quickeasyidservices()
            .Quickidservices(id);
    return quickEasyIdData;
  }

  Future<MultiSelectChipIdModel?>
      getIdMultiChip(
          {required String id}) async {
    getChipIdData =
        await MultiSelectChipidservices()
            .multichipidservice(id);
    return getChipIdData;
  }
}
