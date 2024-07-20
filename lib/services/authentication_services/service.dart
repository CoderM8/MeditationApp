import 'package:get/get.dart';
import 'package:meditation/model/authentication_model/login_model.dart';
import 'package:meditation/services/authentication_services/BaseNetworkApi.dart';

class Service {
  Future<LoginModel?> loginService(
      {required String email, required String password}) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"user_login","package_name":"com.eng.audiobook","type":"Normal","email":"${email.toString()}","password":"${password.toString()}"}');
    print('RESPONSE BODY ++++ $response');
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
