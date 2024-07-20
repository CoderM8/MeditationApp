import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meditation/Constant/constant.dart';
import 'package:meditation/model/homemodel/user_favourite_model.dart'
    as get_favourite;
import 'package:meditation/services/home_services/like_services.dart';
import '../../Services/authentication_services/BaseNetworkApi.dart';
import '../../model/homemodel/favourite_model.dart';
import '../../services/http_services/http_services.dart';
import '../../services/local_storage_service.dart';
import '../user_controller/user_controller.dart';

class SongPlayerController extends GetxController {
  String? postid;

  SongPlayerController({this.postid});

  final UserController userController = Get.put(UserController());

  RxBool isLike = false.obs;
  RxBool isDownload = false.obs;
  RxBool isdelete = false.obs;
  RxInt runningPage = 1.obs;

  @override
  void onInit() {
    isLike.value = false;
    getfavourite(postid: postid);
    super.onInit();
  }

  getfavourite({String? postid}) async {
    var uid = await LocalStorageServices().box.read('uid');

    isLike.value = false;
    print("=========postId$postid");
    await HttpService()
        .getSongs(
      songId: postid,
      userId: uid,
    )
        .then((value) {
      if (value.relaxMeditation.isNotEmpty) {
        isLike.value = value.relaxMeditation[0].isFavourite;
      }
    });
  }

  Future<FavouriteModel?> favouriteMeditationController(
      {String? userid, String? postid}) async {
    var uid = await LocalStorageServices().box.read('uid');

    print("=========userId$userid");
    return await LikeServices().likeServices(userId: uid, songId: postid);
  }

  // Future<get_favourite.GetFavouriteModel?> getFavouriteAudioController({String? userid}) async {
  //   var uid = await LocalStorageServices().box.read('uid');
  //   return  LikeServices().userFavouriteServices(userId: uid);
  // }
  Rx<get_favourite.GetFavouriteModel?> getFavouriteModel =
      get_favourite.GetFavouriteModel(relaxMeditation: []).obs;
  RxList<get_favourite.RelaxMeditation?> getFavouriteList =
      <get_favourite.RelaxMeditation>[].obs;

  Future<void> userFavouriteServices(BuildContext context, int page) async {
    showLoader(context);
    // getFavouriteList.clear();
    var uid = await LocalStorageServices().box.read('uid');
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"get_favourite_post","package_name":"com.eng.audiobook","page":"$page","user_id":"$uid","type":"song"}');
    if (response != null) {
      var jsonData = jsonDecode(response);
      getFavouriteModel.value =
          get_favourite.GetFavouriteModel.fromJson(jsonData);
      if (runningPage.value == 1) {
        for (var element in getFavouriteModel.value?.relaxMeditation ?? []) {
          getFavouriteList.add(element);
        }
      } else {
        for (var element in getFavouriteModel.value?.relaxMeditation ?? []) {
          getFavouriteList.add(element);
        }
      }
      // getFavouriteModel.value?.relaxMeditation?.forEach((element) {getFavouriteList.add(element);});
      // return getFavouriteModelFromJson(response);
      getFavouriteModel.refresh();
    } else {
      Get.snackbar('Like Error', 'SOMETHING IS WRONG');
    }
    hideLoader(context);
  }
}
