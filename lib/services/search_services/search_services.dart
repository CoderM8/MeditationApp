import 'package:get/get.dart';
import '../../model/search_model/search_model.dart';
import '../authentication_services/BaseNetworkApi.dart';
import '../localstorage/local_storage_services.dart';

class SearchServices {
  Future<SearchModel?> searchService(String searchText) async {
    var uid = await LocalStorageServices.box.read('uid');

    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"all_search","package_name":"com.eng.audiobook","page":"1","user_id":"$uid","search_type":"","search_text":"$searchText"}');

    if (response != null) {
      return SearchModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
