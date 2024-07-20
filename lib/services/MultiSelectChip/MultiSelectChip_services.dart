import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:meditation/Services/authentication_services/BaseNetworkApi.dart';
import 'package:meditation/model/MultiSelectChip/multi_select_chip_model.dart';

class MultiSelectChipservices {
  Future<MultiSelectChipModel?> multichipservice() async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"get_feeling","package_name":"com.eng.audiobook"}');
    // print('RESPONSE BODY ++++ $response');
    if (response != null) {
      return MultiSelectChipModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
