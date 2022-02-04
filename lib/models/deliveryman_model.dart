import 'dart:convert';

DeliveryManModel deliverymanProductModelFromString(String str) =>
    DeliveryManModel.fromJson(json.decode(str));

String deliverymanProductModelToString(DeliveryManModel data) =>
    json.encode(data.toJson());

class DeliveryManModel {
  DeliveryManModel({
    required this.title,
    required this.id,
    required this.code,
    required this.name,
  });

  String title;
  String id;
  String code;
  String name;

  factory DeliveryManModel.fromJson(Map<String, dynamic> json) =>
      DeliveryManModel(
        title: json["Title"] ?? "",
        id: json["Id"] ?? "",
        code: json["Code"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Id": id,
        "Code": code,
        "Name": name,
      };
}
