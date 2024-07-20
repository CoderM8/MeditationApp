import 'package:get/get.dart';
import 'package:meditation/model/authentication_model/forgot_password_screen.dart';
import 'package:meditation/services/authentication_services/auth_services.dart';

class ForgotController extends GetxController {
  late ForgotPassword forgotPass;
  Future<ForgotPassword?> forgot(
      {required String email, required int id}) async {
    print({'message print,$email'});
    print({'message print,$id'});
    forgotPass = (await AuthService().forgotService(email: email, id: id))!;
    return forgotPass;
  }
}
