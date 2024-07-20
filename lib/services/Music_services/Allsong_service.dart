import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:meditation/Services/authentication_services/BaseNetworkApi.dart';
import 'package:meditation/model/Music_model/all_song_model.dart';

class AllSongServices {
  Future<AllSongModel?> allSongServices() async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"all_songs","package_name":"com.eng.audiobook","page":"1"}');
    print('RESPONSE Allsongservices ++++ $response');
    if (response != null) {
      return AllSongModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }
}
