import 'dart:convert';

SleepHomeModel sleepHomeModelFromJson(String str) =>
    SleepHomeModel.fromJson(json.decode(str));

String sleepHomeModelToJson(SleepHomeModel data) => json.encode(data.toJson());

/// RELAX_MEDITATION : [{"total_sleep_home_section":"2","id":"2","section_title":"Sleep Section 2","songs_list":"26,17,7"},{"total_sleep_home_section":"2","id":"1","section_title":"Sleep Section 1","songs_list":"16,15,7"}]
class SleepHomeModel {
  SleepHomeModel({
    List<RelaxMeditation>? relaxmeditation,
  }) {
    _relaxmeditation = relaxmeditation;
  }

  SleepHomeModel.fromJson(dynamic json) {
    if (json['RELAX_MEDITATION'] != null) {
      _relaxmeditation = [];
      json['RELAX_MEDITATION'].forEach((v) {
        _relaxmeditation?.add(RelaxMeditation.fromJson(v));
      });
    }
  }
  List<RelaxMeditation>? _relaxmeditation;
  SleepHomeModel copyWith({
    List<RelaxMeditation>? relaxmeditation,
  }) =>
      SleepHomeModel(
        relaxmeditation: relaxmeditation ?? _relaxmeditation,
      );
  List<RelaxMeditation>? get relaxmeditation => _relaxmeditation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_relaxmeditation != null) {
      map['RELAX_MEDITATION'] =
          _relaxmeditation?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// total_sleep_home_section : "2"
/// id : "2"
/// section_title : "Sleep Section 2"
/// songs_list : "26,17,7"

class RelaxMeditation {
  RelaxMeditation({
    String? totalSleepHomeSection,
    String? id,
    String? sectionTitle,
    String? songsList,
  }) {
    _totalSleepHomeSection = totalSleepHomeSection;
    _id = id;
    _sectionTitle = sectionTitle;
    _songsList = songsList;
  }

  RelaxMeditation.fromJson(dynamic json) {
    _totalSleepHomeSection = json['total_sleep_home_section'];
    _id = json['id'];
    _sectionTitle = json['section_title'];
    _songsList = json['songs_list'];
  }
  String? _totalSleepHomeSection;
  String? _id;
  String? _sectionTitle;
  String? _songsList;
  RelaxMeditation copyWith({
    String? totalSleepHomeSection,
    String? id,
    String? sectionTitle,
    String? songsList,
  }) =>
      RelaxMeditation(
        totalSleepHomeSection: totalSleepHomeSection ?? _totalSleepHomeSection,
        id: id ?? _id,
        sectionTitle: sectionTitle ?? _sectionTitle,
        songsList: songsList ?? _songsList,
      );
  String? get totalSleepHomeSection => _totalSleepHomeSection;
  String? get id => _id;
  String? get sectionTitle => _sectionTitle;
  String? get songsList => _songsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_sleep_home_section'] = _totalSleepHomeSection;
    map['id'] = _id;
    map['section_title'] = _sectionTitle;
    map['songs_list'] = _songsList;
    return map;
  }
}
