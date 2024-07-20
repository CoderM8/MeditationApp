import 'package:get/get.dart';
import 'package:meditation/model/authentication_model/login_model.dart';
import 'package:meditation/services/authentication_services/auth_services.dart';

class LoginController extends GetxController {
  late LoginModel loginModel;
  Future<LoginModel?> login({String? email, String? password}) async {
    print({'message print,$email'});
    print({'message print,$password'});
    loginModel =
        (await AuthService().loginService(email: email!, password: password!))!;

    return loginModel;
  }
}
