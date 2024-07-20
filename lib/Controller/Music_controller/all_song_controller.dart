import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meditation/model/Music_model/all_song_model.dart'
    as all_song;
import 'package:meditation/model/Music_model/cat_list_id_model.dart';

import '../../Services/authentication_services/BaseNetworkApi.dart';

class AllSongController
    extends GetxController {
  all_song.AllSongModel? allSongData;
  CatListIdModel? catListId;
  RxInt catIndex = 0.obs;
  RxBool isForYou = true.obs;
  RxBool cat = true.obs;
  RxList catList = [].obs;
  RxString idCat = "".obs;

  ///  allSongModel Controller
  Rx<all_song.AllSongModel?>
      allSongModel =
      all_song.AllSongModel(
          relaxMeditation: []).obs;
  RxList<all_song.RelaxMeditation?>
      allSongModelList =
      <all_song.RelaxMeditation>[].obs;

  Future<void> allSongModelApi() async {
    allSongModel.value?.relaxMeditation
        ?.clear();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      allSongModelList.clear();
    });

    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"all_songs","package_name":"com.eng.audiobook","page":"1"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      allSongModel.value =
          all_song.AllSongModel
              .fromJson(jsonData);
      allSongModel
          .value?.relaxMeditation
          ?.forEach((element) {
        allSongModelList.add(element);
      });
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMTHING WRONG');
    }
    allSongModel.refresh();
  }

  /// categoryidservice Controller
  Rx<CatListIdModel>
      categoryidserviceModel =
      CatListIdModel(
          relaxMeditation: []).obs;

  Future<void> categoryidservice(
      id) async {
    categoryidserviceModel
        .value.relaxMeditation
        ?.clear();
    var response =
        await BaseNetworkApi().apiPost(
            body:
                '{"method_name":"cat_songs","package_name":"com.eng.audiobook","cat_id":"$id","page":"1"}');
    if (response != null) {
      final jsonData =
          jsonDecode(response);
      categoryidserviceModel.value =
          CatListIdModel.fromJson(
              jsonData);
    } else {
      Get.snackbar(
          'AUTHENTICATION ERROR',
          'SOMETHING IS WRONG');
    }
    categoryidserviceModel.refresh();
  }
}
