import 'package:get/get.dart';
import 'package:meditation/model/Sleep/SleepHomeModel.dart';
import '../../model/Sleep/SleepHomeSectionIdModel.dart';
import '../authentication_services/BaseNetworkApi.dart';
import '../localstorage/local_storage_services.dart';

class SleepServices {
  Future<SleepHomeModel?> sleepHomeServices() async {
    var uid = await LocalStorageServices.box.read('uid');
    print('UserI== $uid');
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"sleep_home_section","package_name":"com.eng.audiobook"}');
    // print('RESPONSE BODY ++++ $response');
    if (response != null) {
      return sleepHomeModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }

  Future<SleepHomeSectionIdModel?> sleepHomeSectionFromId({id}) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"sleep_home_section_id","package_name":"com.eng.audiobook","sleep_homesection_id":$id,"page":"1"}');

    if (response != null) {
      return sleepHomeSectionIdModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
    return null;
  }
}
