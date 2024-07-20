import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation/model/authentication_model/login_model.dart';
import 'package:meditation/services/authentication_services/BaseNetworkApi.dart';

class Service {
  Future<LoginModel?> loginService(
      {required String email, required String password}) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"user_login","package_name":"com.eng.audiobook","type":"Normal","email":"${email.toString()}","password":"${password.toString()}"}');
    if (response != null) {
      print('Response ==== $response');
      Map<String, dynamic> data = jsonDecode(response);
      String successValue = data["RELAX_MEDITATION"][0]["success"];
      print('massage successValue :: $successValue');
      if (successValue.isNotEmpty && successValue == '0') {
        Get.snackbar('Error in Login', data["RELAX_MEDITATION"][0]["msg"],
            animationDuration: Duration(milliseconds: 500),
            backgroundColor: Colors.red.withOpacity(0.5),
            dismissDirection: DismissDirection.horizontal,
            isDismissible: true,
            icon: Icon(Icons.error, color: Colors.white),
            colorText: Colors.white);
      }
      return loginModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
      return null;
    }
  }
}
