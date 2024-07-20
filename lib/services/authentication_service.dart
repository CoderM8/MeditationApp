import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:meditation/main.dart';
import 'package:meditation/model/authentication_model/signup_models.dart';
import '../Constant/constant.dart';
import '../model/authentication_model/login_model.dart';
import '../model/update_profile/update_profile_model.dart';
import 'local_storage_service.dart';

class AuthenticationServices {
  /// Normal type Registration
  Future<SignUpModel?> userNormalRegistration({required String email, required XFile? image, required String name, required String password, required String phone, required String? authId}) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(Api.mainApi));
      print("object : ${image!.path}");
      request.fields['method_name'] = 'user_register';
      request.fields['type'] = 'Normal';
      request.fields['email'] = email;
      request.fields["name"] = name;
      request.fields["password"] = password;
      request.fields["phone"] = phone;
      request.files.add(await http.MultipartFile.fromPath('user_image', image.path));
      final response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        return signUpModelFromJson(response.body);
      }
    } catch (e) {}
    return null;
  }

  /// Google registration

  Future<SignUpModel?> userGoogleRegistration({required String email, required String image, required String name, required String password, required String phone, required String authId}) async {
    var body = {
      'data':
          '{"method_name": "user_register","package_name": "com.eng.meditationforrelax","type": "Google","email": "$email","name": "$name","password": "","phone": "$phone","birth_date": "","auth_id": "$authId","user_image": "$image"}'
    };
    final response = await http.post(Uri.parse(Api.mainApi), body: body);
    if (response.body.isNotEmpty) {
      logger.i(response.body);
    }

    SignUpModel signUpModel = signUpModelFromJson(response.body);
    await LocalStorageServices().setString(signUpModel.relaxMeditation[0].userId, 'uid');
    return signUpModel;
  }

  Future<SignUpModel?> userAppleRegistration({required String email, required String image, required String name, required String password, required String phone, required String authId}) async {
    var body = {
      'data':
          '{"method_name": "user_register","package_name": "com.eng.meditationforrelax","type": "apple","email": "$email","name": "$name","password": "","phone": "$phone","birth_date": "","auth_id": "$authId","user_image": "$image"}'
    };
    final response = await http.post(Uri.parse(Api.mainApi), body: body);
    if (response.body.isNotEmpty) {
      logger.i(response.body);
    }

    SignUpModel signUpModel = signUpModelFromJson(response.body);
    await LocalStorageServices().setString(signUpModel.relaxMeditation[0].userId, 'uid');
    return signUpModel;
  }

  /// Facebook registration

  Future<SignUpModel?> userFaceBookRegistration({required String email, required String image, required String name, required String password, required String phone, required String authId}) async {
    var body = {
      "method_name": "user_register",
      "type": "Facebook",
      "email": email,
      "user_image": image,
      "name": name,
      "password": password,
      "phone": phone,
      "auth_id": authId,
    };
    final response = await http.post(Uri.parse(Api.mainApi), body: body);
    return signUpModelFromJson(response.body);
  }

  /// Login
  Future<LoginModel> userLogin({
    required String email,
    required String password,
  }) async {
    var body = {
      "method_name": "user_login",
      "email": email,
      "password": password,
    };
    final response = await http.post(Uri.parse(Api.mainApi), body: body);
    print('sdlzfjkkdsnfgdjkdbg=========${response.body}');
    return loginModelFromJson(response.body);
  }

  ///update profile
  Future<UpdateProfileModel?> updateProfile({
    required String userId,
    required XFile? image,
    required String name,
    required String phone,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(Api.mainApi));
      request.fields['method_name'] = 'user_profile_update';
      request.fields['user_id'] = userId;
      request.fields["name"] = name;
      request.fields["phone"] = phone;
      request.files.add(await http.MultipartFile.fromPath('user_image', image!.path));
      final response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        return updateProfileModelFromJson(response.body);
      }
    } catch (e) {}
    return null;
  }
}
