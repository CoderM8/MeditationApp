// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ProfileModel ProfileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String ProfileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({required this.relaxMeditation});

  final List<RelaxMeditation> relaxMeditation;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
      {required this.success,
      required this.userId,
      required this.name,
      required this.userImage,
      required this.birthDate,
      required this.email,
      required this.phone});

  final String success;
  final String userId;
  final String name;
  final String userImage;
  final String birthDate;
  final String email;
  final String phone;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        success: json["success"],
        userId: json["user_id"] ?? '',
        name: json["name"] ?? '',
        userImage: json["user_image"],
        birthDate: json["birth_date"] ?? '',
        email: json["email"],
        phone: json["phone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user_id": userId,
        "name": name,
        "user_image": userImage,
        "birth_date": birthDate,
        "email": email,
        "phone": phone
      };
}
