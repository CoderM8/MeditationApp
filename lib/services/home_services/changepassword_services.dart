import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation/model/profilemodel/change_password_model.dart';
import 'package:meditation/services/authentication_services/BaseNetworkApi.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';

class ChangepasswordService {
  Future<ChangePasswordModel?> passwordService({current, newp, confirm}) async {
    var uid = await LocalStorageServices.box.read('uid');
    print('user id ====== $uid');
    String response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"change_password","package_name":"com.eng.audiobook","user_id":"$uid","current_password":"$current","new_password":"$newp","confirm_password":"$confirm"}');
    print('RESPONSE BODY ++++ $response');

    if (response.isNotEmpty) {
      final jsonData = jsonDecode(response);
      final relaxMeditationList = jsonData['RELAX_MEDITATION'] as List;
      final firstElement = relaxMeditationList[0];
      final msg = firstElement['msg'];
      Get.snackbar('Password Updated', msg,
          backgroundColor: Colors.green.withOpacity(0.5));
      return changePasswordModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
