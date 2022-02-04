import 'dart:convert';

import 'dart:typed_data';

BrandModel brandModelFromString(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToStringFromJson(BrandModel data) =>
    json.encode(data.toJson());

class BrandModel {
  BrandModel({
    required this.code,
    required this.name,
    this.brandImage,
    this.nativeName,
  });

  late String code;
  late String name;
  String? brandImage;
  String? nativeName;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        code: json["Code"],
        name: json["Name"],
        brandImage: json["BrandImage"],
        nativeName: json["NativeName"],
      );

  Map<String, dynamic> toJson() => {
        "BrandImage": brandImage,
        "NativeName": nativeName,
        "Code": code,
        "Name": name,
      };

  factory BrandModel.fromDBJson(Map<String, dynamic> json) => BrandModel(
        brandImage: json["brandImage"] != null
            ? String.fromCharCodes(json["brandImage"])
            : null,
        nativeName: json["nativeName"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toDBJson() => {
        "brandImage": brandImage != null
            ? Uint8List.fromList(brandImage!.codeUnits)
            : null,
        "nativeName": nativeName,
        "code": code,
        "name": name,
      };
}
