import 'dart:convert';

import 'package:get/get.dart';
import 'package:meditation/model/privacy_policy_model.dart';

import '../Services/authentication_services/BaseNetworkApi.dart';

class AppInfoController extends GetxController {
  /// category Controller
  Rx<AppInfoModel> appInfoModel = AppInfoModel(relaxMeditation: []).obs;
  void appInfoService() async {
    appInfoModel.value.relaxMeditation?.clear();
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"app_details","package_name":"app_privacy_policy"}');
    if (response != null) {
      final jsonData = jsonDecode(response);
      appInfoModel.value = AppInfoModel.fromJson(jsonData);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    appInfoModel.refresh();
  }

  @override
  void onInit() {
    appInfoService();
    super.onInit();
  }
}
