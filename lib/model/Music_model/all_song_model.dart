// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

AllSongModel AllSongModelFromJson(String str) =>
    AllSongModel.fromJson(json.decode(str));

String AllSongModelToJson(AllSongModel data) => json.encode(data.toJson());

class AllSongModel {
  AllSongModel({List<RelaxMeditation>? relaxMeditation}) {
    _relaxMeditation = relaxMeditation;
  }

  AllSongModel.fromJson(dynamic json) {
    if (json['RELAX_MEDITATION'] != null) {
      _relaxMeditation = [];
      json['RELAX_MEDITATION'].forEach((v) {
        _relaxMeditation?.add(RelaxMeditation.fromJson(v));
      });
    }
  }
  List<RelaxMeditation>? _relaxMeditation;
  AllSongModel copyWith({List<RelaxMeditation>? relaxMeditation}) =>
      AllSongModel(relaxMeditation: relaxMeditation ?? _relaxMeditation);
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

/// total_songs : "17"
/// id : "26"
/// cat_id : "7"
/// mp3_type : "local"
/// mp3_title : "Demo 13"
/// mp3_url : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/7908026_mp3.mp3"
/// mp3_description : "<p>https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/99116_intruder-666.mp3</p>\r\n\r\n<p> </p>\r\n"
/// total_rate : "0"
/// total_views : "0"
/// rate_avg : "0"
/// total_download : "0"
/// is_favourite : false
/// cid : "7"
/// category_name : "Progressive "
/// category_image : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/44068_category.jpg"
/// category_image_thumb : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/thumbs/44068_category.jpg"

class RelaxMeditation {
  RelaxMeditation(
      {String? totalSongs,
      String? id,
      String? catId,
      String? mp3Type,
      String? mp3Title,
      String? mp3Url,
      String? mp3Description,
      String? totalRate,
      String? totalViews,
      String? rateAvg,
      String? totalDownload,
      bool? isFavourite,
      String? cid,
      String? categoryName,
      String? categoryImage,
      String? categoryImageThumb}) {
    _totalSongs = totalSongs;
    _id = id;
    _catId = catId;
    _mp3Type = mp3Type;
    _mp3Title = mp3Title;
    _mp3Url = mp3Url;
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
