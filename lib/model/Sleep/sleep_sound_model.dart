// To parse this JSON data, do
//
//     final sleepSound = sleepSoundFromJson(jsonString);

import 'dart:convert';

SleepSound sleepSoundFromJson(String str) =>
    SleepSound.fromJson(json.decode(str));

String sleepSoundToJson(SleepSound data) => json.encode(data.toJson());

class SleepSound {
  List<RelaxMeditation>? relaxMeditation;

  SleepSound({
    this.relaxMeditation,
  });

  factory SleepSound.fromJson(Map<String, dynamic> json) => SleepSound(
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
  String? sleepsoundName;
  String? sleepsoundImage;
  SleepsoundType? sleepsoundType;
  String? sleepsoundUrl;
  String? status;
  String? id;
  String? counts;

  RelaxMeditation({
    this.sleepsoundName,
    this.sleepsoundImage,
    this.sleepsoundType,
    this.sleepsoundUrl,
    this.status,
    this.id,
    this.counts,
  });

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        sleepsoundName: json["sleepsound_name"],
        sleepsoundImage: json["sleepsound_image"],
        sleepsoundType: sleepsoundTypeValues.map[json["sleepsound_type"]]!,
        sleepsoundUrl: json["sleepsound_url"],
        status: json["status"],
        id: json["id"],
        counts: json["counts"],
      );

  Map<String, dynamic> toJson() => {
        "sleepsound_name": sleepsoundName,
        "sleepsound_image": sleepsoundImage,
        "sleepsound_type": sleepsoundTypeValues.reverse[sleepsoundType],
        "sleepsound_url": sleepsoundUrl,
        "status": status,
        "id": id,
        "counts": counts,
      };
}

enum SleepsoundType { LOCAL }

final sleepsoundTypeValues = EnumValues({"local": SleepsoundType.LOCAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
