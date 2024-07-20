import 'dart:convert';

ForgotPassword forgotPasswordFromJson(String str) =>
    ForgotPassword.fromJson(json.decode(str));

String forgotPasswordToJson(ForgotPassword data) => json.encode(data.toJson());

class ForgotPassword {
  ForgotPassword({required this.relaxMeditation});

  List<RelaxMeditation> relaxMeditation;

  factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
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
