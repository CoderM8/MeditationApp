import 'dart:convert';

/// RELAX_MEDITATION : [{"msg":"Like or Unlike successflly...!","success":"1"}]

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));

String likeModelToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  LikeModel({List<RelaxMeditation>? relaxMeditation}) {
    _relaxMeditation = relaxMeditation;
  }

  LikeModel.fromJson(dynamic json) {
    if (json['RELAX_MEDITATION'] != null) {
      _relaxMeditation = [];
      json['RELAX_MEDITATION'].forEach((v) {
        _relaxMeditation?.add(RelaxMeditation.fromJson(v));
      });
    }
  }
  List<RelaxMeditation>? _relaxMeditation;
  LikeModel copyWith({List<RelaxMeditation>? relaxMeditation}) =>
      LikeModel(relaxMeditation: relaxMeditation ?? _relaxMeditation);
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

/// msg : "Like or Unlike successflly...!"
/// success : "1"

class RelaxMeditation {
  RelaxMeditation({String? msg, String? success}) {
    _msg = msg;
    _success = success;
  }

  RelaxMeditation.fromJson(dynamic json) {
    _msg = json['msg'];
    _success = json['success'];
  }
  String? _msg;
  String? _success;
  RelaxMeditation copyWith({String? msg, String? success}) =>
      RelaxMeditation(msg: msg ?? _msg, success: success ?? _success);
  String? get msg => _msg;
  String? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    map['success'] = _success;
    return map;
  }
}
