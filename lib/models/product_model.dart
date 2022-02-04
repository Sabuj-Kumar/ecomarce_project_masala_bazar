import 'dart:convert';

ProductModel productModelFromString(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToString(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.code, //
    required this.name, //
    required this.brandCode, //
    required this.brandName, //
    required this.categoryCode, //
    this.categoryName, //
    required this.price,
    required this.isDcrProduct,
    required this.tp,
    required this.vat,
    required this.bp,
    required this.mrp,
    required this.costPrice,
    this.dp,
    this.productImage,
    this.nativeName,
    this.masterSkuQty,
    this.serial,
    this.nonReturnable,
    this.tags, //
  });

  late String code;
  late String name;
  late String brandCode;
  late String brandName;
  late String categoryCode;
  String? categoryName;
  late double price;
  late bool isDcrProduct;
  late double tp;
  late double vat;
  late double bp;
  late double mrp;
  late double costPrice;
  double? dp;
  String? productImage;
  String? nativeName;
  double? masterSkuQty;
  int? serial;
  bool? nonReturnable;
  String? tags;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        code: json["Code"],
        name: json["Name"],
        brandCode: json["BrandCode"],
        brandName: json["BrandName"],
        categoryCode: json["CategoryCode"],
        categoryName: json["CategoryName"],
        price: json["Price"]?.toDouble(),
        isDcrProduct: json["IsDCRProduct"] ?? false,
        tp: json["TP"]?.toDouble(),
        vat: json["VAT"]?.toDouble(),
        bp: json["BP"]?.toDouble(),
        mrp: json["MRP"]?.toDouble(),
        costPrice: json["CostPrice"]?.toDouble(),
        dp: json["DP"]?.toDouble(),
        productImage: json["ProductImage"],
        nativeName: json["NativeName"],
        masterSkuQty: json["MasterSkuQty"],
        serial: json["Serial"],
        nonReturnable: json["NonReturnable"],
        tags: json["Tags"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "BrandCode": brandCode,
        "BrandName": brandName,
        "CategoryCode": categoryCode,
        "CategoryName": categoryName,
        "Price": price,
        "IsDCRProduct": isDcrProduct,
        "TP": tp,
        "VAT": vat,
        "BP": bp,
        "MRP": mrp,
        "CostPrice": costPrice,
        "DP": dp,
        "ProductImage": productImage,
        "NativeName": nativeName,
        "MasterSkuQty": masterSkuQty,
        "Serial": serial,
        "NonReturnable": nonReturnable,
        "Tags": tags,
      };

  factory ProductModel.fromDBJson(Map<String, dynamic> json) => ProductModel(
        code: json["Code"],
        name: json["Name"],
        brandCode: json["BrandCode"],
        brandName: json["BrandName"],
        categoryCode: json["CategoryCode"],
        categoryName: json["CategoryName"],
        price: json["Price"],
        isDcrProduct: json["IsDCRProduct"],
        tp: json["TP"].toDouble(),
        vat: json["VAT"]?.toDouble(),
        bp: json["BP"]?.toDouble(),
        mrp: json["MRP"]?.toDouble(),
        costPrice: json["CostPrice"]?.toDouble(),
        dp: json["DP"]?.toDouble(),
        productImage: json["ProductImage"],
        nativeName: json["NativeName"],
        masterSkuQty: json["MasterSkuQty"],
        serial: json["Serial"],
        nonReturnable: json["NonReturnable"],
        tags: json["Tags"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "brandCode": brandCode,
        "brandName": brandName,
        "categoryCode": categoryCode,
        "categoryName": categoryName,
        "tags": tags,
        "fullObject": json.encode(toJson())
      };
}
