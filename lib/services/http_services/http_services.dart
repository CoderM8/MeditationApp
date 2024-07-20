import 'package:http/http.dart' as http;
import 'package:meditation/model/homemodel/singlesongmodel.dart';
import 'package:meditation/model/homemodel/user_favourite_model.dart';
import '../../Constant/constant.dart';
import '../../model/homemodel/favourite_model.dart';

class HttpService {
  Future<SingleSongModel> getSongs({
    String? songId,
    String? userId,
  }) async {
    final response = await http.post(Uri.parse(Api.mainApi), body: {
      'data':
          '{"method_name":"single_song","package_name":"com.eng.audiobook","page":"2","user_id":"$userId","mp3_id":"$songId"}'
    });
    return singleSongModelFromJson(response.body);
  }

  Future<FavouriteModel> favouriteSong({String? postId}) async {
    final response = await http.post(Uri.parse(Api.mainApi), body: {
      'data':
          '{"method_name":"favourite_post","package_name":"com.eng.audiobook","post_id":"$postId","type":""}'
    });
    return favouriteModelFromJson(response.body);
  }

  Future<GetFavouriteModel> getFavouriteSong({String? userId}) async {
    final response = await http.post(Uri.parse(Api.mainApi), body: {
      'data':
          '{"method_name":"get_favourite_post","package_name":"com.eng.audiobook","type":""}'
    });
    return getFavouriteModelFromJson(response.body);
  }
}
