// To parse this JSON data, do
//
//     final getFavouriteModel = getFavouriteModelFromJson(jsonString);

import 'dart:convert';

GetFavouriteModel getFavouriteModelFromJson(String str) =>
    GetFavouriteModel.fromJson(json.decode(str));

String getFavouriteModelToJson(GetFavouriteModel data) =>
    json.encode(data.toJson());

class GetFavouriteModel {
  List<RelaxMeditation>? relaxMeditation;

  GetFavouriteModel({
    this.relaxMeditation,
  });

  factory GetFavouriteModel.fromJson(Map<String, dynamic> json) =>
      GetFavouriteModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation!.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  String? totalSongs;
  String? totalSongsFav;
  String? id;
  String? mp3Type;
  String? mp3Title;
  String? mp3Url;
  String? mp3Image;
  String? mp3Thumbnail;
  String? mp3Description;
  String? totalRate;
  String? totalViews;
  String? rateAvg;
  String? totalDownload;
  bool? isFavourite;
  String? cid;
  String? categoryName;
  String? categoryImage;
  String? categoryImageThumb;

  RelaxMeditation({
    this.totalSongs,
    this.totalSongsFav,
    this.id,
    this.mp3Type,
    this.mp3Title,
    this.mp3Url,
    this.mp3Image,
    this.mp3Thumbnail,
    this.mp3Description,
    this.totalRate,
    this.totalViews,
    this.rateAvg,
    this.totalDownload,
    this.isFavourite,
    this.cid,
    this.categoryName,
    this.categoryImage,
    this.categoryImageThumb,
  });

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        totalSongs: json["total_songs"],
        totalSongsFav: json["total_songs_fav"],
        id: json["id"],
        mp3Type: json["mp3_type"],
        mp3Title: json["mp3_title"],
        mp3Url: json["mp3_url"],
        mp3Image: json["mp3_image"],
        mp3Thumbnail: json["mp3_thumbnail"],
        mp3Description: json["mp3_description"],
        totalRate: json["total_rate"],
        totalViews: json["total_views"],
        rateAvg: json["rate_avg"],
        totalDownload: json["total_download"],
        isFavourite: json["is_favourite"],
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryImageThumb: json["category_image_thumb"],
      );

  Map<String, dynamic> toJson() => {
        "total_songs": totalSongs,
        "total_songs_fav": totalSongsFav,
        "id": id,
        "mp3_type": mp3Type,
        "mp3_title": mp3Title,
        "mp3_url": mp3Url,
        "mp3_image": mp3Image,
        "mp3_thumbnail": mp3Thumbnail,
        "mp3_description": mp3Description,
        "total_rate": totalRate,
        "total_views": totalViews,
        "rate_avg": rateAvg,
        "total_download": totalDownload,
        "is_favourite": isFavourite,
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_image_thumb": categoryImageThumb,
      };
}
