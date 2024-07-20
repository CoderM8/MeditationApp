import 'dart:convert';

FavouriteModel favouriteModelFromJson(String str) =>
    FavouriteModel.fromJson(json.decode(str));

String favouriteModelToJson(FavouriteModel data) => json.encode(data.toJson());

class FavouriteModel {
  FavouriteModel({
    required this.relaxMeditation,
  });

  final List<RelaxMeditation> relaxMeditation;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  RelaxMeditation({
    required this.msg,
    required this.success,
  });

  final String msg;
  late final String success;

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
