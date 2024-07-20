import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meditation/constant/constant.dart';
import 'package:meditation/model/profilemodel/profile_model.dart';
import 'package:meditation/model/homemodel/update_profile_model.dart';
import 'package:meditation/services/authentication_services/BaseNetworkApi.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';

class ProfileService {
  Future<ProfileModel?> profileService({uid}) async {
    var uid = await LocalStorageServices.box.read('uid');
    print('PROFILE SERVICE = user id== ${uid}');

    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"user_profile","package_name":"com.eng.audiobook","user_id":"$uid"}');

    if (response != null) {
      print('PROFILE SERVICE === ${response}');
      return ProfileModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }

  Future<UpdateProfileModel?> profileUpdateService(
      {email, name, phone, birthdate, image}) async {
    var uid = await LocalStorageServices.box.read('uid');
    print('UID ==== ${uid}');
    var req = http.MultipartRequest('POST', Uri.parse(Api.mainApi));
    req.fields['data'] =
        '{"method_name":"user_profile_update","package_name":"com.eng.audiobook","user_id":"$uid","email":"$email","name":"$name","phone":"1234567890","birth_date":"$birthdate"}';
    image != null
        ? req.files.add(await http.MultipartFile.fromPath('user_image', image))
        : null;
    http.Response response = await http.Response.fromStream(await req.send());
    print('RESPONSE BODY ++++ ${response.body}');

    return updateProfileModelFromJson(response.body);
  }
}
