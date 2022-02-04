import 'dart:convert';

DiscountCardModel discountCardModelFromString(String str) =>
    DiscountCardModel.fromJson(json.decode(str));

String discountCardModelToString(DiscountCardModel data) =>
    json.encode(data.toJson());

class DiscountCardModel {
  DiscountCardModel({
    required this.code,
    required this.title,
    this.description,
    this.promoType,
  });

  String code;
  String title;
  String? description;
  String? promoType;

  factory DiscountCardModel.fromJson(Map<String, dynamic> json) =>
      DiscountCardModel(
        description: json["Description"],
        promoType: json["PromoType"],
        code: json["Code"],
        title: json["Title"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Title": title,
        "PromoType": promoType,
        "Description": description,
      };

  factory DiscountCardModel.fromDBJson(Map<String, dynamic> json) =>
      DiscountCardModel(
        description: json["description"],
        promoType: json["promoType"],
        code: json["code"],
        title: json["title"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "title": title,
        "promoType": promoType,
        "description": description,
      };
}
