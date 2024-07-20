import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) =>
    ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) =>
    json.encode(data.toJson());

class ChangePasswordModel {
  ChangePasswordModel({required this.relaxMeditation});

  List<RelaxMeditation> relaxMeditation;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  RelaxMeditation({required this.msg, required this.success});

  String msg;
  String success;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        msg: json["msg"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {"msg": msg, "success": success};
}
