import 'package:flutter/cupertino.dart';
import 'package:meditation/Services/authentication_services/BaseNetworkApi.dart';

import '../../Constant/constant.dart';
import '../../model/authentication_model/signUpTypeNormalModel.dart';

class AuthService {
  Future<SignUpTypeNormalModel?> signup(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      required String type}) async {
    print(''
        'NAme  === $name');
    print('NAme  === $password');
    print('NAme  === $email');
    showLoader(context);
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"user_register","package_name":"com.eng.audiobook","type":"Normal","email":"${email.toString()}","name": "${name.toString()}","password":"${password.toString()}"}');
    print("bodyyyyyyyyyyyyyyyyyyyyyy =a ${response}");
    if (response != null) {
      hideLoader(context);
      return signUpTypeNormalModelFromJson(response);
    } else {
      hideLoader(context);
      return null;
    }
  }
}
