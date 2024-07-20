// To parse this JSON data, do
//
//     final getFeeling = getFeelingFromJson(jsonString);

import 'dart:convert';

GetFeeling getFeelingFromJson(String str) =>
    GetFeeling.fromJson(json.decode(str));

String getFeelingToJson(GetFeeling data) => json.encode(data.toJson());

class GetFeeling {
  List<RelaxMeditation>? relaxMeditation;

  GetFeeling({
    this.relaxMeditation,
  });

  factory GetFeeling.fromJson(Map<String, dynamic> json) => GetFeeling(
        relaxMeditation: json["RELAX_MEDITATION"] == null
            ? []
            : List<RelaxMeditation>.from(json["RELAX_MEDITATION"]!
                .map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION": relaxMeditation == null
            ? []
            : List<dynamic>.from(relaxMeditation!.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  String? feelingId;
  String? feelingName;
  String? feelingImage;
  FeelingType? feelingType;
  String? feelingTag;
  String? feelingDescription;
  String? feelingUrl;
  String? status;
  String? counts;

  RelaxMeditation({
    this.feelingId,
    this.feelingName,
    this.feelingImage,
    this.feelingType,
    this.feelingTag,
    this.feelingDescription,
    this.feelingUrl,
    this.status,
    this.counts,
  });

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        feelingId: json["feeling_id"],
        feelingName: json["feeling_name"],
        feelingImage: json["feeling_image"],
        feelingType: feelingTypeValues.map[json["feeling_type"]]!,
        feelingTag: json["feeling_tag"],
        feelingDescription: json["feeling_description"],
        feelingUrl: json["feeling_url"],
        status: json["status"],
        counts: json["counts"],
      );

  Map<String, dynamic> toJson() => {
        "feeling_id": feelingId,
        "feeling_name": feelingName,
        "feeling_image": feelingImage,
        "feeling_type": feelingTypeValues.reverse[feelingType],
        "feeling_tag": feelingTag,
        "feeling_description": feelingDescription,
        "feeling_url": feelingUrl,
        "status": status,
        "counts": counts,
      };
}

enum FeelingType { LOCAL }

final feelingTypeValues = EnumValues({"local": FeelingType.LOCAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
