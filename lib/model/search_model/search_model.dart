// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

/// RELAX_MEDITATION : {"RELAXSOUND_LIST":[{"id":"1","relaxsound_name":"Nature","relaxsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/44302_relax.jpg","relaxsound_type":"server_url","relaxsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/30885_penguinmusic-modern-chillout-12641.mp3","likeslikes":"20"},{"id":"4","relaxsound_name":"Nature","relaxsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/3719_relax.jpg","relaxsound_type":"server_url","relaxsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/30885_penguinmusic-modern-chillout-12641.mp3","likeslikes":"5"}],"SLEEPSOUND_LIST":[{"id":"5","sleepsound_name":"motivational-ident-main","sleepsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/80754_relax.jpg","sleepsound_type":"local","sleepsound_url":"76760_motivational-ident-main-9923.mp3","likes":"0","status":"1"}],"FEELING_LIST":[{"id":"1","feeling_name":"Nature","feeling_tag":"Sleep","feeling_image":"45918_feeling.jpg","feeling_type":"local","feeling_url":"30974_Bewafa-Tera-Muskurana---Jubin-Nautiyal-128-Kbps.mp3","likes":"0","status":"1"},{"id":"4","feeling_name":"Nature","feeling_tag":"Monday","feeling_image":"3719_relax.jpg","feeling_type":"local","feeling_url":"30974_Bewafa-Tera-Muskurana---Jubin-Nautiyal-128-Kbps.mp3","likes":"0","status":"1"}]}

SearchModel SearchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

/// RELAX_MEDITATION : [{"id":"11","relaxsound_name":"Mellomaniac","relaxsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/52495_relax.jpg","relaxsound_type":"server_url","relaxsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/30885_penguinmusic-modern-chillout-12641.mp3","status":"1"},{"id":"12","relaxsound_name":"Watermark","relaxsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/82809_relax.jpg","relaxsound_type":"server_url","relaxsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/30885_penguinmusic-modern-chillout-12641.mp3","status":"1"},{"id":"10","sleepsound_name":"kamamp39s-beatz","sleepsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/7290_relax.jpg","sleepsound_type":"local","sleepsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/2786_kamamp39s-beatz-10452.mp3","status":"1"},{"id":"3","sleepsound_name":"minimal-tech-ambient","sleepsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/22269_relax.jpg","sleepsound_type":"local","sleepsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/51926_minimal-tech-ambient-9965.mp3","status":"1"},{"id":"5","sleepsound_name":"motivational-ident-main","sleepsound_image":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/80754_relax.jpg","sleepsound_type":"local","sleepsound_url":"https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/76760_motivational-ident-main-9923.mp3","status":"1"}]

class SearchModel {
  SearchModel({List<RelaxMeditation>? relaxMeditation}) {
    _relaxMeditation = relaxMeditation;
  }

  SearchModel.fromJson(dynamic json) {
    if (json['RELAX_MEDITATION'] != null) {
      _relaxMeditation = [];
      json['RELAX_MEDITATION'].forEach((v) {
        _relaxMeditation?.add(RelaxMeditation.fromJson(v));
      });
    }
  }
  List<RelaxMeditation>? _relaxMeditation;
  SearchModel copyWith({List<RelaxMeditation>? relaxMeditation}) =>
      SearchModel(relaxMeditation: relaxMeditation ?? _relaxMeditation);
  List<RelaxMeditation>? get relaxMeditation => _relaxMeditation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_relaxMeditation != null) {
      map['RELAX_MEDITATION'] =
          _relaxMeditation?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "11"
/// relaxsound_name : "Mellomaniac"
/// relaxsound_image : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/images/52495_relax.jpg"
/// relaxsound_type : "server_url"
/// relaxsound_url : "https://vocsyinfotech.in/vocsy/flutter/Meditation_For_Relax/uploads/30885_penguinmusic-modern-chillout-12641.mp3"
/// status : "1"

class RelaxMeditation {
  RelaxMeditation(
      {String? id,
      String? relaxSoundName,
      String? relaxSoundImage,
      String? relaxSoundType,
      String? relaxSoundUrl,
      String? status}) {
    _id = id;
    _relaxSoundName = relaxSoundName;
    _relaxSoundImage = relaxSoundImage;
    _relaxSoundType = relaxSoundType;
    _relaxSoundUrl = relaxSoundUrl;
    _status = status;
  }

  RelaxMeditation.fromJson(dynamic json) {
    _id = json['id'];
    _relaxSoundName = json['relaxSound_name'];
    _relaxSoundImage = json['relaxSound_image'];
    _relaxSoundType = json['relaxSound_type'];
    _relaxSoundUrl = json['relaxSound_url'];
    _status = json['status'];
  }
  String? _id;
  String? _relaxSoundName;
  String? _relaxSoundImage;
  String? _relaxSoundType;
  String? _relaxSoundUrl;
  String? _status;
  RelaxMeditation copyWith(
          {String? id,
          String? relaxSoundName,
          String? relaxSoundImage,
          String? relaxSoundType,
          String? relaxSoundUrl,
          String? status}) =>
      RelaxMeditation(
          id: id ?? _id,
          relaxSoundName: relaxSoundName ?? _relaxSoundName,
          relaxSoundImage: relaxSoundImage ?? _relaxSoundImage,
          relaxSoundType: relaxSoundType ?? _relaxSoundType,
          relaxSoundUrl: relaxSoundUrl ?? _relaxSoundUrl,
          status: status ?? _status);
  String? get id => _id;
  String? get relaxSoundName => _relaxSoundName;
  String? get relaxSoundImage => _relaxSoundImage;
  String? get relaxSoundType => _relaxSoundType;
  String? get relaxSoundUrl => _relaxSoundUrl;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['relaxSound_name'] = _relaxSoundName;
    map['relaxSound_image'] = _relaxSoundImage;
    map['relaxSound_type'] = _relaxSoundType;
    map['relaxSound_url'] = _relaxSoundUrl;
    map['status'] = _status;
    return map;
  }
}
