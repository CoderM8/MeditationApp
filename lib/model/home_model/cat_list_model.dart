import 'dart:convert';

CatListModel catListModelFromJson(String str) =>
    CatListModel.fromJson(json.decode(str));

String catListModelToJson(CatListModel data) => json.encode(data.toJson());

class CatListModel {
  CatListModel({required this.relaxMeditation});

  List<RelaxMeditation> relaxMeditation;

  factory CatListModel.fromJson(Map<String, dynamic> json) => CatListModel(
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
      {required this.totalRecords,
      required this.cid,
      required this.categoryName,
      required this.categoryImage,
      required this.categoryImageThumb});

  String totalRecords;
  String cid;
  String categoryName;
  String categoryImage;
  String categoryImageThumb;

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        totalRecords: json["total_records"],
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryImageThumb: json["category_image_thumb"],
      );

  Map<String, dynamic> toJson() => {
        "total_records": totalRecords,
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_image_thumb": categoryImageThumb
      };
}
