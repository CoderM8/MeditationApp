import 'package:get/get.dart';
import 'package:meditation/model/homemodel/home_banner_model.dart';
import '../../main.dart';
import '../authentication_services/BaseNetworkApi.dart';
import '../localstorage/local_storage_services.dart';

class HomeBannerServices {
  Future<HomeBannerModel?> homeBannerServices({String? bannerId}) async {
    var uid = await LocalStorageServices.box.read('uid');
    print('UserI== $uid');
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"banner_songs","package_name":"com.eng.audiobook","page":"1","banner_id":"$bannerId","user_id":"$uid"}');

    if (response != null) {
      // print('RESPONSE BODY ++++ $response');
      logger.i('RESPONSE BODY ++++ $response');
      return homeBannerModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
