import 'dart:convert';

CustomerModel customerModelFromString(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToStringFromJson(CustomerModel data) =>
    json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    required this.code,
    required this.name,
    required this.marketCode,
    this.outstanding,
    this.mobile,
    this.address,
    this.division,
    this.district,
    this.thanaCode,
    this.distributorCode,
    this.distributorName,
    this.invDistributorCode,
    this.classCode,
    this.categoryCode,
    this.categoryName,
    this.mhCodes,
    this.contactNo,
    this.allowSelfOrder,
    this.mhName,
    this.mhLavelName,
    this.mhLavel,
    this.classification,
    this.customerType,
    this.bin,
    this.nativeName,
    this.creditLimit,
    this.lat,
    this.lon,
  });

  late String code; //
  late String name; //
  String? marketCode; //
  double? outstanding;
  String? mobile; //
  String? address;
  String? division;
  String? district;
  String? thanaCode;
  String? distributorCode; //
  String? distributorName; //
  String? invDistributorCode; //
  String? classCode; //
  String? categoryCode; //
  String? categoryName; //
  String? mhCodes; //
  String? contactNo; //
  String? lat;
  String? lon;
  bool? allowSelfOrder;
  String? mhName;
  String? mhLavelName;
  int? mhLavel;
  String? classification; //
  String? customerType; //
  String? bin;
  String? nativeName;
  double? creditLimit;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        code: json["Code"],
        name: json["Name"],
        marketCode: json["MarketCode"],
        outstanding: json["Outstanding"]?.toDouble(),
        mobile: json["Mobile"],
        address: json["Address"],
        division: json["Division"],
        district: json["District"],
        thanaCode: json["ThanaCode"]?.toString(),
        distributorCode: json["DistributorCode"],
        distributorName: json["DistributorName"],
        invDistributorCode: json["InvDistributorCode"],
        classCode: json["ClassCode"],
        categoryCode: json["CategoryCode"],
        categoryName: json["CategoryName"],
        mhCodes: json["MHCodes"],
        contactNo: json["ContactNo"],
        allowSelfOrder: json["AllowSelfOrder"],
        mhName: json["MHName"],
        mhLavelName: json["MHLavelName"],
        mhLavel: json["MHLavel"],
        classification: json["Classification"],
        customerType: json["CustomerType"],
        bin: json["BIN"],
        nativeName: json["NativeName"],
        creditLimit: json["CreditLimit"]?.toDouble(),
        lat: json["Lat"],
        lon: json["Lon"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "MarketCode": marketCode,
        "Outstanding": outstanding,
        "Mobile": mobile,
        "Address": address,
        "Division": division,
        "District": district,
        "ThanaCode": thanaCode,
        "DistributorCode": distributorCode,
        "DistributorName": distributorName,
        "InvDistributorCode": invDistributorCode,
        "ClassCode": classCode,
        "CategoryCode": categoryCode,
        "CategoryName": categoryName,
        "MHCodes": mhCodes,
        "ContactNo": contactNo,
        "AllowSelfOrder": allowSelfOrder,
        "MHName": mhName,
        "MHLavelName": mhLavelName,
        "MHLavel": mhLavel,
        "Classification": classification,
        "CustomerType": customerType,
        "BIN": bin,
        "NativeName": nativeName,
        "CreditLimit": creditLimit,
        "Lat": lat,
        "Lon": lon,
      };

  factory CustomerModel.fromDBJson(Map<String, dynamic> json) => CustomerModel(
        code: json["Code"],
        name: json["Name"],
        marketCode: json["MarketCode"],
        outstanding: json["Outstanding"].toDouble(),
        mobile: json["Mobile"],
        address: json["Address"],
        division: json["Division"],
        district: json["District"],
        thanaCode: json["ThanaCode"],
        distributorCode: json["DistributorCode"],
        distributorName: json["DistributorName"],
        invDistributorCode: json["InvDistributorCode"],
        categoryCode: json["CategoryCode"],
        categoryName: json["CategoryName"],
        mhCodes: json["MHCodes"],
        contactNo: json["ContactNo"],
        allowSelfOrder: json["AllowSelfOrder"],
        mhName: json["MHName"],
        mhLavelName: json["MHLavelName"],
        mhLavel: json["MHLavel"],
        classification: json["Classification"],
        customerType: json["CustomerType"],
        bin: json["BIN"],
        nativeName: json["NativeName"],
        creditLimit: json["CreditLimit"],
        lat: json["Lat"],
        lon: json["Lon"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "marketCode": marketCode,
        "mobile": mobile,
        "distributorCode": distributorCode,
        "distributorName": distributorName,
        "invDistributorCode": invDistributorCode,
        "categoryCode": categoryCode,
        "categoryName": categoryName,
        "mhCodes": mhCodes,
        "contactNo": contactNo,
        "classification": classification,
        "customerType": customerType,
        "fullObject": json.encode(toJson())
      };
}
