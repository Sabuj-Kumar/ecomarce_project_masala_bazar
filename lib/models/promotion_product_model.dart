import 'dart:convert';

PromotionProductModel promotionProductModelFromString(String str) =>
    PromotionProductModel.fromJson(json.decode(str));

String promotionProductModelToString(PromotionProductModel data) =>
    json.encode(data.toJson());

class PromotionProductModel {
  PromotionProductModel({
    required this.code,
    required this.name,
    required this.title,
    required this.id,
  });

  String title;
  String id;
  String code;
  String name;

  factory PromotionProductModel.fromJson(Map<String, dynamic> json) =>
      PromotionProductModel(
        title: json["Title"],
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Id": id,
        "Code": code,
        "Name": name,
      };

  factory PromotionProductModel.fromDBJson(Map<String, dynamic> json) =>
      PromotionProductModel(
        title: json["title"],
        id: json["id"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toDBJson() => {
        "title": title,
        "id": id,
        "code": code,
        "name": name,
      };
}
