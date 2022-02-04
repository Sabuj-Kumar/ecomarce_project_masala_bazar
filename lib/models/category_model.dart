import 'dart:convert';

CategoryModel categoryModelFromString(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToString(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.code,
    required this.name,
    this.parent,
  });

  late String code;
  late String name;
  String? parent;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        code: json["Code"],
        name: json["Name"],
        parent: json["Parent"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "Parent": parent,
      };

  factory CategoryModel.fromDBJson(Map<String, dynamic> json) => CategoryModel(
        code: json["code"],
        name: json["name"],
        parent: json["parent"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "parent": parent,
      };
}
