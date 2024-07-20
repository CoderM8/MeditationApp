// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:meditation/model/profilemodel/profile_model.dart' as profile;
import 'package:meditation/model/homemodel/update_profile_model.dart';
import 'package:meditation/model/profilemodel/change_password_model.dart';
import 'package:meditation/services/home_services/changepassword_services.dart';
import 'package:meditation/services/profileservices/profile_service.dart';

import '../Services/authentication_services/BaseNetworkApi.dart';
import '../services/local_storage_service.dart';

class ProfileController extends GetxController {
  RxBool meditation = false.obs;
  RxBool sleepReminder = false.obs;
  profile.ProfileModel? profileData;
  UpdateProfileModel? updateProfileModel;
  ChangePasswordModel? changePasswordData;

  RxString userEmail = ''.obs;
  RxString profilePhoto = ''.obs;
  RxString username = ''.obs;
  RxString phone = ''.obs;

  Rx<profile.ProfileModel> profileModel =
      profile.ProfileModel(relaxMeditation: []).obs;
  RxList<profile.RelaxMeditation> profileList = <profile.RelaxMeditation>[].obs;
  Future<void> profileService() async {
    var uid = await LocalStorageServices().box.read('uid');
    print('PROFILE SERVICE = user id == $uid');

    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"user_profile","package_name":"com.eng.audiobook","user_id":"$uid"}');

    if (response != null) {
      final jsonData = jsonDecode(response);
      profileModel.value = profile.ProfileModel.fromJson(jsonData);
      profileModel.value.relaxMeditation.forEach((element) {
        profileList.add(element);
      });
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }

  Future<UpdateProfileModel?> UpdateProfile(
      {email, name, phone, image, required String bDate}) async {
    updateProfileModel = await ProfileService().profileUpdateService(
        email: email, name: name, phone: phone, birthdate: bDate, image: image);
    return updateProfileModel;
  }

  Future<ChangePasswordModel?> changePass({current, newp, confirm}) async {
    changePasswordData = await ChangepasswordService()
        .passwordService(confirm: confirm, current: current, newp: newp)
        .whenComplete(() => Get.back());
    return changePasswordData;
  }
}
