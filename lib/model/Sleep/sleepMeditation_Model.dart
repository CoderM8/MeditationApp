import 'dart:convert';

class SleepMeditationModel {
  List<RelaxMeditation>? relaxMeditation;

  SleepMeditationModel({
    this.relaxMeditation,
  });

  factory SleepMeditationModel.fromRawJson(String str) =>
      SleepMeditationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SleepMeditationModel.fromJson(Map<String, dynamic> json) =>
      SleepMeditationModel(
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
  int? totalPage;
  String? id;
  String? mp3Type;
  String? mp3Title;
  String? mp3Url;
  String? mp3Thumbnail;
  String? mp3Description;
  String? forKids;
  String? totalRate;
  String? totalViews;
  String? rateAvg;
  String? totalDownload;
  String? cid;
  String? categoryName;
  String? categoryImage;
  String? categoryImageThumb;

  RelaxMeditation({
    this.totalSongs,
    this.totalPage,
    this.id,
    this.mp3Type,
    this.mp3Title,
    this.mp3Url,
    this.mp3Thumbnail,
    this.mp3Description,
    this.forKids,
    this.totalRate,
    this.totalViews,
    this.rateAvg,
    this.totalDownload,
    this.cid,
    this.categoryName,
    this.categoryImage,
    this.categoryImageThumb,
  });

  factory RelaxMeditation.fromRawJson(String str) =>
      RelaxMeditation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        totalSongs: json["total_songs"],
        totalPage: json["total_page"],
        id: json["id"],
        mp3Type: json["mp3_type"],
        mp3Title: json["mp3_title"],
        mp3Url: json["mp3_url"],
        mp3Thumbnail: json["mp3_thumbnail"],
        mp3Description: json["mp3_description"],
        forKids: json["for_kids"],
        totalRate: json["total_rate"],
        totalViews: json["total_views"],
        rateAvg: json["rate_avg"],
        totalDownload: json["total_download"],
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryImageThumb: json["category_image_thumb"],
      );

  Map<String, dynamic> toJson() => {
        "total_songs": totalSongs,
        "total_page": totalPage,
        "id": id,
        "mp3_type": mp3Type,
        "mp3_title": mp3Title,
        "mp3_url": mp3Url,
        "mp3_thumbnail": mp3Thumbnail,
        "mp3_description": mp3Description,
        "for_kids": forKids,
        "total_rate": totalRate,
        "total_views": totalViews,
        "rate_avg": rateAvg,
        "total_download": totalDownload,
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_image_thumb": categoryImageThumb,
      };
}
