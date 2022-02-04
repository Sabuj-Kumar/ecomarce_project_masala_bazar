import 'dart:convert';

BankAccountModel discountCardModelFromString(String str) =>
    BankAccountModel.fromJson(json.decode(str));

String discountCardModelToString(BankAccountModel data) =>
    json.encode(data.toJson());

class BankAccountModel {
  BankAccountModel({
    required this.code,
    required this.accountName,
    required this.accountNo,
    this.name,
    this.branchName,
  });

  String code;
  String? name;
  String accountName;
  String accountNo;
  String? branchName;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      BankAccountModel(
        code: json["Code"],
        name: json["Name"],
        accountName: json["AccountName"],
        accountNo: json["AccountNo"],
        branchName: json["BranchName"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "AccountName": accountName,
        "AccountNo": accountNo,
        "BranchName": branchName,
      };

  factory BankAccountModel.fromDBJson(Map<String, dynamic> json) =>
      BankAccountModel(
        code: json["code"],
        name: json["name"],
        accountName: json["accountName"],
        accountNo: json["accountNo"],
        branchName: json["branchName"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "accountName": accountName,
        "accountNo": accountNo,
        "branchName": branchName,
      };    

  
}
