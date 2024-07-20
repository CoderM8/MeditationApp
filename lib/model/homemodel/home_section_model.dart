// import 'dart:convert';
//
// HomeSectionModel? homeSectionModelFromJson(String str) => HomeSectionModel.fromJson(json.decode(str));
//
// String homeSectionModelToJson(HomeSectionModel? data) => json.encode(data!.toJson());
//
//   class HomeSectionModel {
//   HomeSectionModel({
//     required this.relaxMeditation,
//   });
//
//   final List<RelaxMeditation?>? relaxMeditation;
//
//   factory HomeSectionModel.fromJson(Map<String, dynamic> json) => HomeSectionModel(
//         relaxMeditation:
//             json["RELAX_MEDITATION"] == null ? [] : List<RelaxMeditation?>.from(json["RELAX_MEDITATION"]!.map((x) => RelaxMeditation.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "RELAX_MEDITATION": relaxMeditation == null ? [] : List<dynamic>.from(relaxMeditation!.map((x) => x!.toJson())),
//       };
// }
//
// class RelaxMeditation {
//   RelaxMeditation({
//     required this.totalSongs,
//     required this.id,
//     required this.mp3Type,
//     required this.mp3Title,
//     required this.mp3Url,
//     required this.mp3Image,
//     required this.mp3Thumbnail,
//     required this.mp3Description,
//     required this.totalRate,
//     required this.totalViews,
//     required this.rateAvg,
//     required this.totalDownload,
//     required this.isFavourite,
//     required this.cid,
//     required this.categoryName,
//     required this.categoryImage,
//     required this.categoryImageThumb,
//   });
//
//   final String? totalSongs;
//   final String? id;
//   final String? mp3Type;
//   final String? mp3Title;
//   final String? mp3Url;
//   final String? mp3Image;
//   final String? mp3Thumbnail;
//   final String? mp3Description;
//   final String? totalRate;
//   final String? totalViews;
//   final String? rateAvg;
//   final String? totalDownload;
//   final bool? isFavourite;
//   final String? cid;
//   final String? categoryName;
//   final String? categoryImage;
//   final String? categoryImageThumb;
//
//   factory RelaxMeditation.fromJson(Map<String, dynamic> json) => RelaxMeditation(
//         totalSongs: json["total_songs"],
//         id: json["id"],
//         mp3Type: json["mp3_type"],
//         mp3Title: json["mp3_title"],
//         mp3Url: json["mp3_url"],
//         mp3Image: json["mp3_image"],
//         mp3Thumbnail: json["mp3_thumbnail"],
//         mp3Description: json["mp3_description"],
//         totalRate: json["total_rate"],
//         totalViews: json["total_views"],
//         rateAvg: json["rate_avg"],
//         totalDownload: json["total_download"],
//         isFavourite: json["is_favourite"],
//         cid: json["cid"],
//         categoryName: json["category_name"],
//         categoryImage: json["category_image"],
//         categoryImageThumb: json["category_image_thumb"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "total_songs": totalSongs,
//         "id": id,
//         "mp3_type": mp3Type,
//         "mp3_title": mp3Title,
//         "mp3_url": mp3Url,
//         "mp3_image": mp3Image,
//         "mp3_thumbnail": mp3Thumbnail,
//         "mp3_description": mp3Description,
//         "total_rate": totalRate,
//         "total_views": totalViews,
//         "rate_avg": rateAvg,
//         "total_download": totalDownload,
//         "is_favourite": isFavourite,
//         "cid": cid,
//         "category_name": categoryName,
//         "category_image": categoryImage,
//         "category_image_thumb": categoryImageThumb,
//       };
// }

// To parse this JSON data, do
//
//     final homeSectionModel = homeSectionModelFromJson(jsonString);

import 'dart:convert';

HomeSectionModel homeSectionModelFromJson(String str) =>
    HomeSectionModel.fromJson(json.decode(str));

String homeSectionModelToJson(HomeSectionModel data) =>
    json.encode(data.toJson());

class HomeSectionModel {
  List<RelaxMeditation>? relaxMeditation;

  HomeSectionModel({
    this.relaxMeditation,
  });

  factory HomeSectionModel.fromJson(Map<String, dynamic> json) =>
      HomeSectionModel(
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
