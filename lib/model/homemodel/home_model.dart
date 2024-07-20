// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

HomeModel HomeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String HomeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({required this.relaxMeditation});

  final RelaxMeditation relaxMeditation;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        relaxMeditation: RelaxMeditation.fromJson(json["RELAX_MEDITATION"]),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION": relaxMeditation.toJson(),
      };
}

class RelaxMeditation {
  RelaxMeditation(
      {required this.homeBanner,
      required this.trendingBooks,
      required this.latestAlbum,
      required this.latestArtist,
      required this.playlist});

  final List<HomeBanner> homeBanner;
  final List<dynamic> trendingBooks;
  final List<dynamic> latestAlbum;
  final List<dynamic> latestArtist;
  final List<dynamic> playlist;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        homeBanner: List<HomeBanner>.from(
            json["home_banner"].map((x) => HomeBanner.fromJson(x))),
        trendingBooks: List<dynamic>.from(json["trending_books"].map((x) => x)),
        latestAlbum: List<dynamic>.from(json["latest_album"].map((x) => x)),
        latestArtist: List<dynamic>.from(json["latest_artist"].map((x) => x)),
        playlist: List<dynamic>.from(json["playlist"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "home_banner": List<dynamic>.from(homeBanner.map((x) => x.toJson())),
        "trending_books": List<dynamic>.from(trendingBooks.map((x) => x)),
        "latest_album": List<dynamic>.from(latestAlbum.map((x) => x)),
        "latest_artist": List<dynamic>.from(latestArtist.map((x) => x)),
        "playlist": List<dynamic>.from(playlist.map((x) => x)),
      };
}

class HomeBanner {
  HomeBanner(
      {required this.bid,
      required this.bannerTitle,
      required this.bannerSortInfo,
      required this.totalViews,
      required this.bannerImage,
      required this.bannerImageThumb,
      required this.totalSongs,
      required this.mp3List});

  final String bid;
  final String bannerTitle;
  final String bannerSortInfo;
  final String totalViews;
  final String bannerImage;
  final String bannerImageThumb;
  final int totalSongs;
  final List<Mp3List> mp3List;

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        bid: json["bid"],
        bannerTitle: json["banner_title"],
        bannerSortInfo: json["banner_sort_info"],
        totalViews: json["total_views"],
        bannerImage: json["banner_image"],
        bannerImageThumb: json["banner_image_thumb"],
        totalSongs: json["total_songs"],
        mp3List: List<Mp3List>.from(
            json["Mp3_list"].map((x) => Mp3List.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bid": bid,
        "banner_title": bannerTitle,
        "banner_sort_info": bannerSortInfo,
        "total_views": totalViews,
        "banner_image": bannerImage,
        "banner_image_thumb": bannerImageThumb,
        "total_songs": totalSongs,
        "Mp3_list": List<dynamic>.from(mp3List.map((x) => x.toJson())),
      };
}

class Mp3List {
  Mp3List(
      {required this.id,
      required this.mp3Type,
      required this.mp3Title,
      required this.mp3Url,
      required this.mp3Image,
      required this.mp3Thumbnail,
      required this.mp3Duration,
      required this.mp3Description,
      required this.totalRate,
      required this.rateAvg,
      required this.totalViews,
      required this.totalDownload,
      required this.isFavourite,
      required this.cid,
      required this.categoryName,
      required this.categoryImage,
      required this.categoryImageThumb});

  final String id;

  final Mp3Type? mp3Type;
  final String mp3Title;
  final String mp3Url;
  final String mp3Image;
  final String mp3Thumbnail;
  final Mp3Duration? mp3Duration;
  final String mp3Description;
  final String totalRate;
  final String rateAvg;
  final String totalViews;
  final String totalDownload;
  final bool isFavourite;
  final String cid;
  final String categoryName;
  final String categoryImage;
  final String categoryImageThumb;

  factory Mp3List.fromJson(Map<String, dynamic> json) => Mp3List(
        id: json["id"],
        mp3Type: mp3TypeValues.map[json["mp3_type"]],
        mp3Title: json["mp3_title"],
        mp3Url: json["mp3_url"],
        mp3Image: json["mp3_image"],
        mp3Thumbnail: json["mp3_thumbnail"],
        mp3Duration: mp3DurationValues.map[json["mp3_duration"]],
        mp3Description: json["mp3_description"],
        totalRate: json["total_rate"],
        rateAvg: json["rate_avg"],
        totalViews: json["total_views"],
        totalDownload: json["total_download"],
        isFavourite: json["is_favourite"],
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryImageThumb: json["category_image_thumb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mp3_type": mp3TypeValues.reverse![mp3Type],
        "mp3_title": mp3Title,
        "mp3_url": mp3Url,
        "mp3_image": mp3Image,
        "mp3_thumbnail": mp3Thumbnail,
        "mp3_duration": mp3DurationValues.reverse![mp3Duration],
        "mp3_description": mp3Description,
        "total_rate": totalRate,
        "rate_avg": rateAvg,
        "total_views": totalViews,
        "total_download": totalDownload,
        "is_favourite": isFavourite,
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_image_thumb": categoryImageThumb
      };
}

enum Mp3Duration { THE_1_MINUTE_20_SECONDS }

final mp3DurationValues =
    EnumValues({"1 Minute 20 seconds": Mp3Duration.THE_1_MINUTE_20_SECONDS});

enum Mp3Type { SERVER_URL }

final mp3TypeValues = EnumValues({"server_url": Mp3Type.SERVER_URL});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
