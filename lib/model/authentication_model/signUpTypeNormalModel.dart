// To parse this JSON data, do
//
//     final signUpTypeNormalModel = signUpTypeNormalModelFromJson(jsonString);

import 'dart:convert';

SignUpTypeNormalModel signUpTypeNormalModelFromJson(String str) =>
    SignUpTypeNormalModel.fromJson(json.decode(str));

String signUpTypeNormalModelToJson(SignUpTypeNormalModel data) =>
    json.encode(data.toJson());

class SignUpTypeNormalModel {
  List<RelaxMeditation>? relaxMeditation;

  SignUpTypeNormalModel({
    this.relaxMeditation,
  });

  factory SignUpTypeNormalModel.fromJson(Map<String, dynamic> json) =>
      SignUpTypeNormalModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation!.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  String? msg;
  String? success;

  RelaxMeditation({
    this.msg,
    this.success,
  });

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        msg: json["msg"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "success": success,
      };
}
