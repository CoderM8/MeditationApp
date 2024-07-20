// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

MultiSelectChipModel MultiSelectChipModelFromJson(String str) =>
    MultiSelectChipModel.fromJson(json.decode(str));

String MultiSelectChipModelToJson(MultiSelectChipModel data) =>
    json.encode(data.toJson());

class MultiSelectChipModel {
  MultiSelectChipModel({required this.relaxMeditation});

  List<RelaxMeditation> relaxMeditation;

  factory MultiSelectChipModel.fromJson(Map<String, dynamic> json) =>
      MultiSelectChipModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  RelaxMeditation(
      {required this.feelingId,
      required this.feelingName,
      required this.feelingImage,
      required this.feelingType,
      required this.feelingTag,
      required this.feelingDescription,
      required this.feelingUrl,
      required this.status});

  String feelingId;
  String feelingName;
  String feelingImage;
  String feelingType;
  String feelingTag;
  String feelingDescription;
  String feelingUrl;
  String status;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        feelingId: json["feeling_id"],
        feelingName: json["feeling_name"],
        feelingImage: json["feeling_image"],
        feelingType: json["feeling_type"],
        feelingTag: json["feeling_tag"],
        feelingDescription: json["feeling_description"],
        feelingUrl: json["feeling_url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "feeling_id": feelingId,
        "feeling_name": feelingName,
        "feeling_image": feelingImage,
        "feeling_type": feelingType,
        "feeling_tag": feelingTag,
        "feeling_description": feelingDescription,
        "feeling_url": feelingUrl,
        "status": status
      };
}
