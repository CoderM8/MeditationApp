// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

HomeBannerModel homeBannerModelFromJson(String str) =>
    HomeBannerModel.fromJson(json.decode(str));

String homeBannerModelToJson(HomeBannerModel data) =>
    json.encode(data.toJson());

/// RELAX_MEDITATION : [{"total_songs":"3","id":"7","cat_id":"6","mp3_type":"server_url","mp3_title":"Demo 6","mp3_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/954588_mp3.mp3","mp3_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png","mp3_thumbnail":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png","mp3_description":"<p>https://vocsyinfotech.website/envanto/admin_panel/Meditation_For_Relax/uploads/12121_Meditation.mp3</p>\r\n","total_rate":"0","total_views":"0","rate_avg":"0","total_download":"0","is_favourite":false,"cid":"6","category_name":"Transcendental ","category_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/96628_category.jpg","category_image_thumb":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/96628_category.jpg"},{"total_songs":"3","id":"3","cat_id":"8","mp3_type":"local","mp3_title":"Demo 2","mp3_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/107473_mp3.mp3","mp3_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png","mp3_thumbnail":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png","mp3_description":"<p>https://vocsyinfotech.website/envanto/admin_panel/Meditation_For_Relax/uploads/12121_Meditation.mp3</p>\r\n","total_rate":"0","total_views":"0","rate_avg":"0","total_download":"0","is_favourite":false,"cid":"8","category_name":"Loving-kindness","category_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/86718_category.jpg","category_image_thumb":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/86718_category.jpg"},{"total_songs":"3","id":"2","cat_id":"4","mp3_type":"local","mp3_title":"Demo","mp3_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/126652_mp3.mp3","mp3_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png","mp3_thumbnail":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png","mp3_description":"<p>Demo</p>\r\n","total_rate":"0","total_views":"0","rate_avg":"0","total_download":"0","is_favourite":false,"cid":"4","category_name":"Focused","category_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/32464_category.jpg","category_image_thumb":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/32464_category.jpg"}]

class HomeBannerModel {
  NewHomeBannerModel({
    List<RelaxMeditation>? relaxMeditation,
  }) {
    _relaxMeditation = relaxMeditation;
  }

  HomeBannerModel.fromJson(dynamic json) {
    if (json['RELAX_MEDITATION'] != null) {
      _relaxMeditation = [];
      json['RELAX_MEDITATION'].forEach((v) {
        _relaxMeditation?.add(RelaxMeditation.fromJson(v));
      });
    }
  }
  List<RelaxMeditation>? _relaxMeditation;
  HomeBannerModel copyWith({List<RelaxMeditation>? relaxMeditation}) =>
      NewHomeBannerModel(relaxMeditation: relaxMeditation ?? _relaxMeditation);
  List<RelaxMeditation>? get relaxMeditation => _relaxMeditation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_relaxMeditation != null) {
      map['RELAX_MEDITATION'] =
          _relaxMeditation?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// total_songs : "3"
/// id : "7"
/// cat_id : "6"
/// mp3_type : "server_url"
/// mp3_title : "Demo 6"
/// mp3_url : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/954588_mp3.mp3"
/// mp3_image : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png"
/// mp3_thumbnail : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/add-image.png"
/// mp3_description : "<p>https://vocsyinfotech.website/envanto/admin_panel/Meditation_For_Relax/uploads/12121_Meditation.mp3</p>\r\n"
/// total_rate : "0"
/// total_views : "0"
/// rate_avg : "0"
/// total_download : "0"
/// is_favourite : false
/// cid : "6"
/// category_name : "Transcendental "
/// category_image : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/96628_category.jpg"
/// category_image_thumb : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/96628_category.jpg"

class RelaxMeditation {
  RelaxMeditation({
    String? totalSongs,
    String? id,
    String? catId,
    String? mp3Type,
    String? mp3Title,
    String? mp3Url,
    String? mp3Image,
    String? mp3Thumbnail,
    String? mp3Description,
    String? totalRate,
    String? totalViews,
    String? rateAvg,
    String? totalDownload,
    bool? isFavourite,
    String? cid,
    String? categoryName,
    String? categoryImage,
    String? categoryImageThumb,
  }) {
    _totalSongs = totalSongs;
    _id = id;
    _catId = catId;
    _mp3Type = mp3Type;
    _mp3Title = mp3Title;
    _mp3Url = mp3Url;
    _mp3Image = mp3Image;
    _mp3Thumbnail = mp3Thumbnail;
    _mp3Description = mp3Description;
    _totalRate = totalRate;
    _totalViews = totalViews;
    _rateAvg = rateAvg;
    _totalDownload = totalDownload;
    _isFavourite = isFavourite;
    _cid = cid;
    _categoryName = categoryName;
    _categoryImage = categoryImage;
    _categoryImageThumb = categoryImageThumb;
  }

  RelaxMeditation.fromJson(dynamic json) {
    _totalSongs = json['total_songs'];
    _id = json['id'];
    _catId = json['cat_id'];
    _mp3Type = json['mp3_type'];
    _mp3Title = json['mp3_title'];
    _mp3Url = json['mp3_url'];
    _mp3Image = json['mp3_image'];
    _mp3Thumbnail = json['mp3_thumbnail'];
    _mp3Description = json['mp3_description'];
    _totalRate = json['total_rate'];
    _totalViews = json['total_views'];
    _rateAvg = json['rate_avg'];
    _totalDownload = json['total_download'];
    _isFavourite = json['is_favourite'];
    _cid = json['cid'];
    _categoryName = json['category_name'];
    _categoryImage = json['category_image'];
    _categoryImageThumb = json['category_image_thumb'];
  }
  String? _totalSongs;
  String? _id;
  String? _catId;
  String? _mp3Type;
  String? _mp3Title;
  String? _mp3Url;
  String? _mp3Image;
  String? _mp3Thumbnail;
  String? _mp3Description;
  String? _totalRate;
  String? _totalViews;
  String? _rateAvg;
  String? _totalDownload;
  bool? _isFavourite;
  String? _cid;
  String? _categoryName;
  String? _categoryImage;
  String? _categoryImageThumb;
  RelaxMeditation copyWith(
          {String? totalSongs,
          String? id,
          String? catId,
          String? mp3Type,
          String? mp3Title,
          String? mp3Url,
          String? mp3Image,
          String? mp3Thumbnail,
          String? mp3Description,
          String? totalRate,
          String? totalViews,
          String? rateAvg,
          String? totalDownload,
          bool? isFavourite,
          String? cid,
          String? categoryName,
          String? categoryImage,
          String? categoryImageThumb}) =>
      RelaxMeditation(
          totalSongs: totalSongs ?? _totalSongs,
          id: id ?? _id,
          catId: catId ?? _catId,
          mp3Type: mp3Type ?? _mp3Type,
          mp3Title: mp3Title ?? _mp3Title,
          mp3Url: mp3Url ?? _mp3Url,
          mp3Image: mp3Image ?? _mp3Image,
          mp3Thumbnail: mp3Thumbnail ?? _mp3Thumbnail,
          mp3Description: mp3Description ?? _mp3Description,
          totalRate: totalRate ?? _totalRate,
          totalViews: totalViews ?? _totalViews,
          rateAvg: rateAvg ?? _rateAvg,
          totalDownload: totalDownload ?? _totalDownload,
          isFavourite: isFavourite ?? _isFavourite,
          cid: cid ?? _cid,
          categoryName: categoryName ?? _categoryName,
          categoryImage: categoryImage ?? _categoryImage,
          categoryImageThumb: categoryImageThumb ?? _categoryImageThumb);
  String? get totalSongs => _totalSongs;
  String? get id => _id;
  String? get catId => _catId;
  String? get mp3Type => _mp3Type;
  String? get mp3Title => _mp3Title;
  String? get mp3Url => _mp3Url;
  String? get mp3Image => _mp3Image;
  String? get mp3Thumbnail => _mp3Thumbnail;
  String? get mp3Description => _mp3Description;
  String? get totalRate => _totalRate;
  String? get totalViews => _totalViews;
  String? get rateAvg => _rateAvg;
  String? get totalDownload => _totalDownload;
  bool? get isFavourite => _isFavourite;
  String? get cid => _cid;
  String? get categoryName => _categoryName;
  String? get categoryImage => _categoryImage;
  String? get categoryImageThumb => _categoryImageThumb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_songs'] = _totalSongs;
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['mp3_type'] = _mp3Type;
    map['mp3_title'] = _mp3Title;
    map['mp3_url'] = _mp3Url;
    map['mp3_image'] = _mp3Image;
    map['mp3_thumbnail'] = _mp3Thumbnail;
    map['mp3_description'] = _mp3Description;
    map['total_rate'] = _totalRate;
    map['total_views'] = _totalViews;
    map['rate_avg'] = _rateAvg;
    map['total_download'] = _totalDownload;
    map['is_favourite'] = _isFavourite;
    map['cid'] = _cid;
    map['category_name'] = _categoryName;
    map['category_image'] = _categoryImage;
    map['category_image_thumb'] = _categoryImageThumb;
    return map;
  }
}
