import 'dart:convert';

ProductPriceModel productPriceModelFromString(String str) =>
    ProductPriceModel.fromJson(json.decode(str));

String productPriceModelToString(ProductPriceModel data) =>
    json.encode(data.toJson());

class ProductPriceModel {
  ProductPriceModel(
      {required this.price,
      required this.custCategoryCode, //
      required this.productCode, //
      required this.tp,
      required this.vat,
      required this.bp,
      required this.mrp});

  String custCategoryCode;
  String productCode;
  double price;
  double tp;
  double vat;
  double bp;
  double mrp;

  factory ProductPriceModel.fromJson(Map<String, dynamic> json) =>
      ProductPriceModel(
        price: (json["Price"] ?? 0).toDouble(),
        custCategoryCode: json["CatCode"],
        productCode: json["PrdtCode"],
        tp: (json["TP"] ?? 0).toDouble(),
        vat: (json["VAT"] ?? 0).toDouble(),
        bp: (json["BP"] ?? 0).toDouble(),
        mrp: (json["MRP"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Price": price,
        "CatCode": custCategoryCode,
        "PrdtCode": productCode,
        "TP": tp,
        "VAT": vat,
        "BP": bp,
        "MRP": mrp,
      };

  factory ProductPriceModel.fromDBJson(Map<String, dynamic> json) =>
      ProductPriceModel(
        price: json["Price"],
        custCategoryCode: json["CatCode"],
        productCode: json["PrdtCode"],
        tp: (json["TP"] ?? 0).toDouble(),
        vat: (json["VAT"] ?? 0).toDouble(),
        bp: (json["BP"] ?? 0).toDouble(),
        mrp: (json["MRP"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toDBJson() => {
        "custCategoryCode": custCategoryCode,
        "productCode": productCode,
        "fullObject": json.encode(toJson())
      };
}
