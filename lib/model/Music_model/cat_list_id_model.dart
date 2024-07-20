// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

CatListIdModel CatListIdModelFromJson(String str) =>
    CatListIdModel.fromJson(json.decode(str));

String CatListIdModelToJson(CatListIdModel data) => json.encode(data.toJson());

/// RELAX_MEDITATION : [{"total_records":"2","cat_id":"6","status":"1","id":"8","mp3_type":"local","mp3_title":"Demo 7","mp3_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/792888_mp3.mp3","mp3_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/31405_mp3_thumb.jpg","mp3_thumbnail":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/31405_mp3_thumb.jpg","mp3_artist":"","mp3_description":"<p>https://vocsyinfotech.website/envanto/admin_panel/Meditation_For_Relax/uploads/12121_Meditation.mp3</p>\r\n","total_rate":"0","rate_avg":"0","total_views":"0","total_download":"0","cid":"6","category_name":"Transcendental ","category_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/96628_category.jpg","category_image_thumb":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/96628_category.jpg"},{"total_records":"2","cat_id":"6","status":"1","id":"7","mp3_type":"server_url","mp3_title":"Demo 6","mp3_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/954588_mp3.mp3","mp3_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/61455_mp3_thumb.jpg","mp3_thumbnail":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/61455_mp3_thumb.jpg","mp3_artist":"","mp3_description":"<p>https://vocsyinfotech.website/envanto/admin_panel/Meditation_For_Relax/uploads/12121_Meditation.mp3</p>\r\n","total_rate":"0","rate_avg":"0","total_views":"0","total_download":"0","cid":"6","category_name":"Transcendental ","category_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/96628_category.jpg","category_image_thumb":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/96628_category.jpg"}]

class CatListIdModel {
  CatListIdModel({List<RelaxMeditation>? relaxMeditation}) {
    _relaxMeditation = relaxMeditation;
  }

  CatListIdModel.fromJson(dynamic json) {
    if (json['RELAX_MEDITATION'] != null) {
      _relaxMeditation = [];
      json['RELAX_MEDITATION'].forEach((v) {
        _relaxMeditation?.add(RelaxMeditation.fromJson(v));
      });
    }
  }
  List<RelaxMeditation>? _relaxMeditation;
  CatListIdModel copyWith({List<RelaxMeditation>? relaxMeditation}) =>
      CatListIdModel(relaxMeditation: relaxMeditation ?? _relaxMeditation);
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

/// total_records : "2"
/// cat_id : "6"
/// status : "1"
/// id : "8"
/// mp3_type : "local"
/// mp3_title : "Demo 7"
/// mp3_url : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/792888_mp3.mp3"
/// mp3_image : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/31405_mp3_thumb.jpg"
/// mp3_thumbnail : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/31405_mp3_thumb.jpg"
/// mp3_artist : ""
/// mp3_description : "<p>https://vocsyinfotech.website/envanto/admin_panel/Meditation_For_Relax/uploads/12121_Meditation.mp3</p>\r\n"
/// total_rate : "0"
/// rate_avg : "0"
/// total_views : "0"
/// total_download : "0"
/// cid : "6"
/// category_name : "Transcendental "
/// category_image : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/96628_category.jpg"
/// category_image_thumb : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/96628_category.jpg"

class RelaxMeditation {
  RelaxMeditation(
      {String? totalRecords,
      String? catId,
      String? status,
      String? id,
      String? mp3Type,
      String? mp3Title,
      String? mp3Url,
      String? mp3Image,
      String? mp3Thumbnail,
      String? mp3Artist,
      String? mp3Description,
      String? totalRate,
      String? rateAvg,
      String? totalViews,
      String? totalDownload,
      String? cid,
      String? categoryName,
      String? categoryImage,
      String? categoryImageThumb}) {
    _totalRecords = totalRecords;
    _catId = catId;
    _status = status;
    _id = id;
    _mp3Type = mp3Type;
    _mp3Title = mp3Title;
    _mp3Url = mp3Url;
    _mp3Image = mp3Image;
    _mp3Thumbnail = mp3Thumbnail;
    _mp3Artist = mp3Artist;
    _mp3Description = mp3Description;
    _totalRate = totalRate;
    _rateAvg = rateAvg;
    _totalViews = totalViews;
    _totalDownload = totalDownload;
    _cid = cid;
    _categoryName = categoryName;
    _categoryImage = categoryImage;
    _categoryImageThumb = categoryImageThumb;
  }

  RelaxMeditation.fromJson(dynamic json) {
    _totalRecords = json['total_records'];
    _catId = json['cat_id'];
    _status = json['status'];
    _id = json['id'];
    _mp3Type = json['mp3_type'];
    _mp3Title = json['mp3_title'];
    _mp3Url = json['mp3_url'];
    _mp3Image = json['mp3_image'];
    _mp3Thumbnail = json['mp3_thumbnail'];
    _mp3Artist = json['mp3_artist'];
    _mp3Description = json['mp3_description'];
    _totalRate = json['total_rate'];
    _rateAvg = json['rate_avg'];
    _totalViews = json['total_views'];
    _totalDownload = json['total_download'];
    _cid = json['cid'];
    _categoryName = json['category_name'];
    _categoryImage = json['category_image'];
    _categoryImageThumb = json['category_image_thumb'];
  }
  String? _totalRecords;
  String? _catId;
  String? _status;
  String? _id;
  String? _mp3Type;
  String? _mp3Title;
  String? _mp3Url;
  String? _mp3Image;
  String? _mp3Thumbnail;
  String? _mp3Artist;
  String? _mp3Description;
  String? _totalRate;
  String? _rateAvg;
  String? _totalViews;
  String? _totalDownload;
  String? _cid;
  String? _categoryName;
  String? _categoryImage;
  String? _categoryImageThumb;
  RelaxMeditation copyWith(
          {String? totalRecords,
          String? catId,
          String? status,
          String? id,
          String? mp3Type,
          String? mp3Title,
          String? mp3Url,
          String? mp3Image,
          String? mp3Thumbnail,
          String? mp3Artist,
          String? mp3Description,
          String? totalRate,
          String? rateAvg,
          String? totalViews,
          String? totalDownload,
          String? cid,
          String? categoryName,
          String? categoryImage,
          String? categoryImageThumb}) =>
      RelaxMeditation(
          totalRecords: totalRecords ?? _totalRecords,
          catId: catId ?? _catId,
          status: status ?? _status,
          id: id ?? _id,
          mp3Type: mp3Type ?? _mp3Type,
          mp3Title: mp3Title ?? _mp3Title,
          mp3Url: mp3Url ?? _mp3Url,
          mp3Image: mp3Image ?? _mp3Image,
          mp3Thumbnail: mp3Thumbnail ?? _mp3Thumbnail,
          mp3Artist: mp3Artist ?? _mp3Artist,
          mp3Description: mp3Description ?? _mp3Description,
          totalRate: totalRate ?? _totalRate,
          rateAvg: rateAvg ?? _rateAvg,
          totalViews: totalViews ?? _totalViews,
          totalDownload: totalDownload ?? _totalDownload,
          cid: cid ?? _cid,
          categoryName: categoryName ?? _categoryName,
          categoryImage: categoryImage ?? _categoryImage,
          categoryImageThumb: categoryImageThumb ?? _categoryImageThumb);
  String? get totalRecords => _totalRecords;
  String? get catId => _catId;
  String? get status => _status;
  String? get id => _id;
  String? get mp3Type => _mp3Type;
  String? get mp3Title => _mp3Title;
  String? get mp3Url => _mp3Url;
  String? get mp3Image => _mp3Image;
  String? get mp3Thumbnail => _mp3Thumbnail;
  String? get mp3Artist => _mp3Artist;
  String? get mp3Description => _mp3Description;
  String? get totalRate => _totalRate;
  String? get rateAvg => _rateAvg;
  String? get totalViews => _totalViews;
  String? get totalDownload => _totalDownload;
  String? get cid => _cid;
  String? get categoryName => _categoryName;
  String? get categoryImage => _categoryImage;
  String? get categoryImageThumb => _categoryImageThumb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_records'] = _totalRecords;
    map['cat_id'] = _catId;
    map['status'] = _status;
    map['id'] = _id;
    map['mp3_type'] = _mp3Type;
    map['mp3_title'] = _mp3Title;
    map['mp3_url'] = _mp3Url;
    map['mp3_image'] = _mp3Image;
    map['mp3_thumbnail'] = _mp3Thumbnail;
    map['mp3_artist'] = _mp3Artist;
    map['mp3_description'] = _mp3Description;
    map['total_rate'] = _totalRate;
    map['rate_avg'] = _rateAvg;
    map['total_views'] = _totalViews;
    map['total_download'] = _totalDownload;
    map['cid'] = _cid;
    map['category_name'] = _categoryName;
    map['category_image'] = _categoryImage;
    map['category_image_thumb'] = _categoryImageThumb;
    return map;
  }
}
