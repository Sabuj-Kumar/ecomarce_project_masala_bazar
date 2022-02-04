import 'dart:convert';

UnitModel unitModelFromString(String str) =>
    UnitModel.fromJson(json.decode(str));

String unitModelToStringFromJson(UnitModel data) => json.encode(data.toJson());

class UnitModel {
  UnitModel({
    required this.title,
    required this.id,
    required this.skuValue,
    required this.isSku,
  });

  late String title;
  late String id;
  late double skuValue;
  late bool isSku;

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        title: json["Title"],
        id: json["Id"],
        skuValue: json["SKUValue"].toDouble(),
        isSku: json["IsSKU"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Id": id,
        "SKUValue": skuValue,
        "IsSKU": isSku,
      };

  factory UnitModel.fromDBJson(Map<String, dynamic> json) => UnitModel(
        title: json["title"],
        id: json["id"].toDouble(),
        skuValue: json["skuValue"],
        isSku: json["isSku"],
      );

  Map<String, dynamic> toDBJson() => {
        "title": title,
        "id": id,
        "skuValue": skuValue,
        "isSku": isSku,
      };
}
