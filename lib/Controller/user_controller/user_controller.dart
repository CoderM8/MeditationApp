import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  String? userName;
  String? userEmail;
  String? userImage;
  String? userId;
  String? phone;

  RxBool isOnline = true.obs;
  Future<bool> hasNetwork() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id');
    try {
      final result = await InternetAddress.lookup('www.google.com');
      isOnline.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline.value = false;
      return false;
    }
  }

  static const String appShareAndroid = 'https://play.google.com/store';
  static const String appShareIOS = 'https://www.apple.com/in/app-store/';

  @override
  void onInit() {
    getuser();
    hasNetwork();
    super.onInit();
  }

  Future getuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id');
  }

  String getAppShare() {
    if (Platform.isIOS) {
      return appShareIOS;
    } else {
      return appShareAndroid;
    }
  }

  // Future<GetUserUpdateModel> getUpdataController({String? name, String? email, File? image, String? userid, String? phone}) async {
  //   return await HttpService().getUserUpdateService(userImage: image, userId: userid, email: email, name: name, phone: phone);
  // }
}
