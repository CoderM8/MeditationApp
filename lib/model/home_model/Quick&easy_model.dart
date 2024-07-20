import 'dart:convert';

QuickEasyModel quickEasyModelFromJson(String str) =>
    QuickEasyModel.fromJson(json.decode(str));

String quickEasyModelToJson(QuickEasyModel data) => json.encode(data.toJson());

class QuickEasyModel {
  QuickEasyModel({required this.relaxMeditation});

  List<RelaxMeditation> relaxMeditation;

  factory QuickEasyModel.fromJson(Map<String, dynamic> json) => QuickEasyModel(
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
      {required this.totalHomeSection,
      required this.id,
      required this.sectionTitle,
      required this.songsList});

  String totalHomeSection;
  String id;
  String sectionTitle;
  String songsList;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        totalHomeSection: json["total_home_section"],
        id: json["id"],
        sectionTitle: json["section_title"],
        songsList: json["songs_list"],
      );

  Map<String, dynamic> toJson() => {
        "total_home_section": totalHomeSection,
        "id": id,
        "section_title": sectionTitle,
        "songs_list": songsList
      };
}
