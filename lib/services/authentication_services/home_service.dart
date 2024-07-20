import 'dart:async';

import 'package:get/get.dart';
import 'package:meditation/model/homemodel/home_model.dart';
import 'package:meditation/model/homemodel/home_section_model.dart';
import 'package:meditation/services/authentication_services/BaseNetworkApi.dart';

import '../../Controller/homescreen_controller.dart';

class HomeService {
  HomeModel? _homeModel;
  final HomeController homeController = Get.put(HomeController());
  Future<HomeModel?> homeService() async {
    _homeModel?.relaxMeditation.homeBanner.clear();
    var response = await BaseNetworkApi().apiPost(
        body: '{"method_name":"home","package_name":"com.eng.audiobook"}');
    // print('RESPONSE BODY ++++ $response');

    try {
      if (response != null) {
        return HomeModelFromJson(response);
      } else {
        Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
      }
    } catch (error, t) {
      print('error :: $error $t');
    }
    return null;
  }

  Future<HomeSectionModel?> HomesectionFromid({id}) async {
    var response = await BaseNetworkApi().apiPost(
        body:
            '{"method_name":"home_section_id","package_name":"com.eng.audiobook","homesection_id":"$id","page":"1"}');

    if (response != null) {
      return homeSectionModelFromJson(response);
    } else {
      Get.snackbar('AUTHENTICATION ERROR', 'SOMTHING WRONG');
    }
    return null;
  }
}
