import 'dart:convert';
import 'package:get/get.dart';
import 'package:meditation/model/Sleep/SleepHomeModel.dart';
import 'package:meditation/model/Sleep/get_feeling_model.dart' as get_feeling;
import 'package:meditation/services/sleep/sleep_services.dart';
import 'package:meditation/model/Sleep/sleepMeditation_Model.dart'
    as sleep_meditation;
import 'package:meditation/model/Sleep/sleepStory_model.dart' as sleep_story;

import '../Services/authentication_services/BaseNetworkApi.dart';
import '../model/Sleep/SleepHomeSectionIdModel.dart';
import '../model/Sleep/sleep_sound_model.dart' as sleep_sound;
import '../services/local_storage_service.dart';

class SleepController extends GetxController {
  RxInt storyRunningPage = 1.obs;
  RxBool isSleepScreen = false.obs;
  RxInt meditationRunningPage = 0.obs;
  late SleepHomeSectionIdModel sleepHomeSectionIdModel;
  Future<SleepHomeSectionIdModel?> sleepHomeSectionData({id}) async {
    sleepHomeSectionIdModel =
        (await SleepServices().sleepHomeSectionFromId(id: id))!;
    return sleepHomeSectionIdModel;
  }

  /// sleepStory controller
  Rx<sleep_story.SleepStoryModel> sleepStoryModel =
      sleep_story.SleepStoryModel(relaxMeditation: []).obs;
  RxList<sleep_story.RelaxMeditation?> sleepStoryModelList =
      <sleep_story.RelaxMeditation>[].obs;

  Future<void> sleepStoryApi(int page) async {
    String userId = await LocalStorageServices().box.read('uid') ?? '';
    print('user Id ::: $userId');
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"sleep_stories","package_name":"com.eng.audiobook","page":"$page","user_id":$userId}');
    if (response != null) {
      final jsonData = jsonDecode(response);
      sleepStoryModel.value = sleep_story.SleepStoryModel.fromJson(jsonData);
      if (meditationRunningPage.value == 1) {
        for (var element in sleepStoryModel.value.relaxMeditation) {
          sleepStoryModelList.add(element);
        }
      } else {
        for (var element in sleepStoryModel.value.relaxMeditation) {
          sleepStoryModelList.add(element);
        }
        sleepStoryModel.refresh();
      }
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
  }

  RxList<sleep_sound.RelaxMeditation> sleepSoundList =
      <sleep_sound.RelaxMeditation>[].obs;
  Future<void> sleepSoundApi(int page) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"get_sleepsound","package_name":"com.eng.audiobook","page":$page}');
    if (response != null) {
      final jsonData = jsonDecode(response);

      for (var item in jsonData['RELAX_MEDITATION']) {
        sleepSoundList.add(sleep_sound.RelaxMeditation.fromJson(item));
      }
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
  }

  RxList<get_feeling.RelaxMeditation> getFeelingList =
      <get_feeling.RelaxMeditation>[].obs;

  Future<void> getFeelingApi(int page) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"get_feeling","package_name":"com.eng.audiobook","page":$page}');
    if (response != null) {
      final jsonData = jsonDecode(response);
      for (var item in jsonData['RELAX_MEDITATION']) {
        getFeelingList.add(get_feeling.RelaxMeditation.fromJson(item));
      }
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
  }

  // sleepStory controller
  Rx<SleepHomeModel> sleepHomeModel = SleepHomeModel(relaxmeditation: []).obs;

  Future<void> sleepHomeModelApi() async {
    sleepStoryModel.value.relaxMeditation.clear();
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"sleep_home_section","package_name":"com.eng.audiobook"}');
    if (response != null) {
      final jsonData = jsonDecode(response);
      sleepHomeModel.value = SleepHomeModel.fromJson(jsonData);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
    sleepStoryModel.refresh();
  }

  // sleepStory controller
  Rx<sleep_meditation.SleepMeditationModel> sleepMeditationModel =
      sleep_meditation.SleepMeditationModel(relaxMeditation: []).obs;
  RxList<sleep_meditation.RelaxMeditation?> sleepRelaxMeditationList =
      <sleep_meditation.RelaxMeditation>[].obs;

  Future<void> sleepMeditationModelApi(int page) async {
    String userId = await LocalStorageServices().box.read('uid') ?? '';
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"sleep_meditation","package_name":"com.eng.audiobook","page":"$page","user_id":$userId}');
    if (response != null) {
      final jsonData = jsonDecode(response);
      sleepMeditationModel.value =
          sleep_meditation.SleepMeditationModel.fromJson(jsonData);
      if (storyRunningPage.value == 1) {
        for (var element in sleepMeditationModel.value.relaxMeditation ?? []) {
          sleepRelaxMeditationList.add(element);
        }
      } else {
        for (var element in sleepMeditationModel.value.relaxMeditation ?? []) {
          sleepRelaxMeditationList.add(element);
        }
        sleepMeditationModel.refresh();
      }
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
  }
}
