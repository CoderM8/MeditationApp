import 'dart:convert';

Relaxingsoundmusic relaxingsoundmusicFromJson(String str) =>
    Relaxingsoundmusic.fromJson(json.decode(str));

String relaxingsoundmusicToJson(Relaxingsoundmusic data) =>
    json.encode(data.toJson());

class Relaxingsoundmusic {
  Relaxingsoundmusic({
    required this.relaxMeditation,
  });

  List<RelaxMeditation> relaxMeditation;

  factory Relaxingsoundmusic.fromJson(Map<String, dynamic> json) =>
      Relaxingsoundmusic(
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
    required this.relaxsoundName,
    required this.relaxsoundImage,
    required this.relaxsoundType,
    required this.relaxsoundUrl,
    required this.status,
  });

  String relaxsoundName;
  String relaxsoundImage;
  String relaxsoundType;
  String relaxsoundUrl;
  String status;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        relaxsoundName: json["relaxsound_name"],
        relaxsoundImage: json["relaxsound_image"],
        relaxsoundType: json["relaxsound_type"],
        relaxsoundUrl: json["relaxsound_url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "relaxsound_name": relaxsoundName,
        "relaxsound_image": relaxsoundImage,
        "relaxsound_type": relaxsoundType,
        "relaxsound_url": relaxsoundUrl,
        "status": status,
      };
}
