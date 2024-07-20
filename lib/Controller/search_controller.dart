import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:meditation/model/search_model/search_model.dart';
import '../services/search_services/search_services.dart';

class SearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  SearchModel? searchModel;
  RxString? searchString = ''.obs;

  Future<SearchModel?> searchMeditationSong(
      {required String searchText}) async {
    searchModel = await SearchServices().searchService(searchText);
    return searchModel;
  }
}
