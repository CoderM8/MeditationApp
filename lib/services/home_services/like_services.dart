import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:meditation/Services/authentication_services/BaseNetworkApi.dart';
import '../../model/homemodel/favourite_model.dart' as fav;
import '../localstorage/local_storage_services.dart';

class LikeServices {
  fav.FavouriteModel? favmodel;
  Future<fav.FavouriteModel?> likeServices(
      {String? songId, String? userId}) async {
    favmodel?.relaxMeditation.clear();
    var uid = await LocalStorageServices.box.read('uid');
    print('UserI== $uid');
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"favourite_post","package_name":"com.eng.audiobook","page":"1","post_id":"$songId","user_id":"$uid","type":"song"}');
    if (response != null) {
      return fav.favouriteModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMETHING IS WRONG');
    }
    return null;
  }

  // Future<GetFavouriteModel?> userFavouriteServices({String? userId}) async {
  //   var uid = await LocalStorageServices.box.read('uid');
  //   print('UserI== $uid');
  //   var response = await BaseNetworkApi()
  //       .apiPost(body: '{"method_name":"get_favourite_post","package_name":"com.eng.audiobook","page":"1","user_id":"$uid","type":"song"}');
  //   if (response != null) {
  //     print('like response ====================> $response');
  //     return getFavouriteModelFromJson(response);
  //   } else {
  //     Get.snackbar('Like Error', 'SOMETHING IS WRONG');
  //   }
  //   return null;
  // }
}
