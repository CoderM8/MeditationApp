// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

MeditationSection MeditationSectionFromJson(String str) =>
    MeditationSection.fromJson(json.decode(str));

String MeditationSectionToJson(MeditationSection data) =>
    json.encode(data.toJson());

class MeditationSection {
  MeditationSection({required this.relaxMeditation});

  final List<RelaxMeditation> relaxMeditation;

  factory MeditationSection.fromJson(Map<String, dynamic> json) =>
      MeditationSection(
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

  final String totalHomeSection;
  final String id;
  final String sectionTitle;
  final String songsList;

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
