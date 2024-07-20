import 'dart:convert';

class SleepStoryModel {
  List<RelaxMeditation> relaxMeditation;

  SleepStoryModel({
    required this.relaxMeditation,
  });

  factory SleepStoryModel.fromRawJson(String str) =>
      SleepStoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SleepStoryModel.fromJson(Map<String, dynamic> json) =>
      SleepStoryModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  String totalSongs;
  String id;
  Mp3Type mp3Type;
  String mp3Title;
  String mp3Url;
  String mp3Description;
  String forKids;
  String totalRate;
  String totalViews;
  String rateAvg;
  String totalDownload;
  String cid;
  String categoryName;
  String categoryImage;
  String categoryImageThumb;

  RelaxMeditation({
    required this.totalSongs,
    required this.id,
    required this.mp3Type,
    required this.mp3Title,
    required this.mp3Url,
    required this.mp3Description,
    required this.forKids,
    required this.totalRate,
    required this.totalViews,
    required this.rateAvg,
    required this.totalDownload,
    required this.cid,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryImageThumb,
  });

  factory RelaxMeditation.fromRawJson(String str) =>
      RelaxMeditation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        totalSongs: json["total_songs"],
        id: json["id"],
        mp3Type: mp3TypeValues.map[json["mp3_type"]]!,
        mp3Title: json["mp3_title"],
        mp3Url: json["mp3_url"],
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
        "id": id,
        "mp3_type": mp3TypeValues.reverse[mp3Type],
        "mp3_title": mp3Title,
        "mp3_url": mp3Url,
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

enum Mp3Type { LOCAL, SERVER_URL }

final mp3TypeValues =
    EnumValues({"local": Mp3Type.LOCAL, "server_url": Mp3Type.SERVER_URL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
