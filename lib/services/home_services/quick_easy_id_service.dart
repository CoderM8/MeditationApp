import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:meditation/Services/authentication_services/BaseNetworkApi.dart';
import 'package:meditation/model/home_model/quick_easy_id_model.dart';

class Quickeasyidservices {
  Future<QuickEasyIdModel?> Quickidservices(String id) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"home_section_id_2","package_name":"com.eng.audiobook","homesection_id_2":"$id","page":"1"}');
    // print('RESPONSE Quickeasyidservices ++++ $response');
    if (response != null) {
      return quickEasyIdModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
