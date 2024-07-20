import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:meditation/Services/authentication_services/BaseNetworkApi.dart';
import 'package:meditation/model/MultiSelectChip/multi_select_chip_id_model.dart';

class MultiSelectChipidservices {
  Future<MultiSelectChipIdModel?> multichipidservice(String id) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"get_feeling_by_id","package_name":"com.eng.audiobook","feeling_id":"$id"}');
    // print('RESPONSE BODY ++++ $response');
    if (response != null) {
      return MultiSelectChipIdModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
