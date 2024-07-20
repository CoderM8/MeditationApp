import 'package:get/get.dart';
import 'package:meditation/Services/authentication_services/Login_service.dart';

import '../../model/authentication_model/login_model.dart';

class LoginController extends GetxController {
  var email;
  var uId;
  LoginModel? loginModel;

  Future<LoginModel?> login({String? email, String? password}) async {
    loginModel = await Service()
        .loginService(email: email ?? '', password: password ?? '');
    return loginModel;
  }
}
