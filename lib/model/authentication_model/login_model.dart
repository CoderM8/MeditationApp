import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({required this.relaxMeditation});

  final List<RelaxMeditation> relaxMeditation;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
      {required this.userId,
      required this.name,
      required this.email,
      required this.msg,
      required this.authId,
      required this.success});

  final String userId;
  final String name;
  final String email;
  final String msg;
  final String authId;
  final String success;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        userId: json["user_id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        msg: json["msg"] ?? '',
        authId: json["auth_id"] ?? '',
        success: json["success"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "msg": msg,
        "auth_id": authId,
        "success": success
      };
}
