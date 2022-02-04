import 'dart:convert';

DistributorModel distributorModelFromString(String str) =>
    DistributorModel.fromJson(json.decode(str));

String distributorModelToString(DistributorModel data) =>
    json.encode(data.toJson());

class DistributorModel {
  DistributorModel({
    required this.code,
    required this.name,
    this.nativeName,
    this.address,
    this.mobile,
    this.bin,
  });

  late String code;
  late String name;
  String? nativeName;
  String? address;
  String? mobile;
  String? bin;

  factory DistributorModel.fromJson(Map<String, dynamic> json) =>
      DistributorModel(
        code: json["Code"],
        name: json["Name"],
        nativeName: json["NativeName"],
        address: json["Address"],
        mobile: json["Mobile"],
        bin: json["BIN"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "NativeName": nativeName,
        "Address": address,
        "Mobile": mobile,
        "BIN": bin,
      };

  factory DistributorModel.fromDBJson(Map<String, dynamic> json) =>
      DistributorModel(
        code: json["code"],
        name: json["name"],
        nativeName: json["nativeName"],
        address: json["address"],
        mobile: json["mobile"],
        bin: json["bin"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "nativeName": nativeName,
        "address": address,
        "mobile": mobile,
        "bin": bin,
      };
}
