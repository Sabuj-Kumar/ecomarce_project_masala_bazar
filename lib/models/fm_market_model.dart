import 'dart:convert';

FmMarketModel fmMarketModelFromString(String str) =>
    FmMarketModel.fromJson(json.decode(str));

String fmMarketModelToString(FmMarketModel data) => json.encode(data.toJson());

class FmMarketModel {
  FmMarketModel({
    required this.code,
    required this.name,
    this.distributorCode,
    this.fFCode,
  });

  String code;
  String name;
  String? distributorCode;
  String? fFCode;

  factory FmMarketModel.fromJson(Map<String, dynamic> json) => FmMarketModel(
        distributorCode: json["DistributorCode"],
        fFCode: json["FFCode"],
        code: json["Code"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "DistributorCode": distributorCode,
        "FFCode": fFCode,
        "Code": code,
        "Name": name,
      };

  factory FmMarketModel.fromDBJson(Map<String, dynamic> json) => FmMarketModel(
        distributorCode: json["distributorCode"],
        fFCode: json["fFCode"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toDBJson() => {
        "distributorCode": distributorCode,
        "fFCode": fFCode,
        "code": code,
        "name": name,
      };
}
