import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({required this.relaxMeditation});

  List<RelaxMeditation> relaxMeditation;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        relaxMeditation: List<RelaxMeditation>.from(json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION": List<dynamic>.from(relaxMeditation.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  RelaxMeditation({required this.userId, required this.name, required this.email, required this.msg, required this.authId, required this.success});

  String userId;
  String name;
  String email;
  String msg;
  String authId;
  String success;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) => RelaxMeditation(
        userId: json["user_id"] ?? '',
        name: json["name"],
        email: json["email"],
        msg: json["msg"],
        authId: json["auth_id"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {"user_id": userId, "name": name, "email": email, "msg": msg, "auth_id": authId, "success": success};
}
