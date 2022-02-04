import 'dart:convert';

RouteModel routeModelFromJson(String str) =>
    RouteModel.fromJson(json.decode(str));

String routeModelToJson(RouteModel data) => json.encode(data.toJson());

class RouteModel {
  RouteModel({
    required this.code,
    required this.name,
    this.location,
    this.visitDays,
    this.mhName,
    this.mhLavelName,
    this.distributor,
    this.mhHierarchy,
    this.ffHierarchy,
    this.mhid,
  });

  late String code;
  late String name;
  String? location;
  String? visitDays;
  String? mhName;
  String? mhLavelName;
  String? distributor;
  String? mhHierarchy;
  String? ffHierarchy;
  String? mhid;

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        code: json["Code"],
        name: json["Name"],
        location: json["Location"],
        visitDays: json["VisitDays"],
        mhName: json["MHName"],
        mhLavelName: json["MHLavelName"],
        distributor: json["Distributor"],
        mhHierarchy: json["MHHierarchy"],
        ffHierarchy: json["FFHierarchy"],
        mhid: json["MHID"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "Location": location,
        "VisitDays": visitDays,
        "MHName": mhName,
        "MHLavelName": mhLavelName,
        "Distributor": distributor,
        "MHHierarchy": mhHierarchy,
        "FFHierarchy": ffHierarchy,
        "MHID": mhid,
      };

  factory RouteModel.fromDBJson(Map<String, dynamic> json) => RouteModel(
        code: json['code'],
        name: json["name"],
        location: json["location"],
        visitDays: json["visitDays"],
        mhName: json["mhName"],
        mhLavelName: json["mhLavelName"],
        distributor: json["distributor"],
        mhHierarchy: json["mhHierarchy"],
        ffHierarchy: json["ffHierarchy"],
        mhid: json["mhid"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "location": location,
        "visitDays": visitDays,
        "mhName": mhName,
        "mhLavelName": mhLavelName,
        "distributor": distributor,
        "mhHierarchy": mhHierarchy,
        "ffHierarchy": ffHierarchy,
        "mhid": mhid,
      };
}
