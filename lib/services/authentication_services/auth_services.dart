import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:meditation/model/authentication_model/forgot_password_screen.dart';
import 'package:meditation/model/authentication_model/login_model.dart';
import 'BaseNetworkApi.dart';

class AuthService {
  Future<ForgotPassword?> forgotService(
      {required String email, required int id}) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"forgot_pass","package_name":"com.eng.audiobook","user_id":"$id","user_email":"$email"}');
    print("email $email");
    print("id $id");
    print("*/*/*/*/*/*/*/-----------$response");

    if (response != null) {
      Map<String, dynamic> data = json.decode(response);
      String message = data['RELAX_MEDITATION'][0]['msg'];
      Fluttertoast.showToast(
          msg: message,
          fontSize: 20.0,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          backgroundColor: Colors.black);
      return forgotPasswordFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING WRONG');
    }
    return null;
  }

  ///==================================gooogle login=================================================
  Future<LoginModel?> loginService(
      {required String email, required String password}) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"user_login","package_name":"com.eng.audiobook","type":"Normal","email":"${email.toString()}","password":"${password.toString()}"}');
    print("email $email");
    print("password $password");
    if (response != null) {
      return loginModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
