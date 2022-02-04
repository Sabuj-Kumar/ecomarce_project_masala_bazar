import 'dart:convert';

import 'package:efgecom/models/line_item_model.dart';

DiscountModel discountModelFromString(String str) =>
    DiscountModel.fromJson(json.decode(str));

String discountModelToStringFromJson(DiscountModel data) =>
    json.encode(data.toJson());

class DiscountModel {
  DiscountModel({
    required this.code, //
    required this.name, //
    required this.discountFor, //
    required this.discountOn, //
    this.entityRuleType,
    this.numberRuleType,
    this.numberValue = 0,
    this.numberValueLessEquel = 0,
    this.discountValueType,
    this.discountValue = 0,
    this.hasUserChoice = false,
    this.discountLimitation,
    this.limitationTimes,
    required this.startDateUtc,
    this.startDateFormated,
    required this.endDateUtc,
    this.endDateFormated,
    required this.priority,
    this.categories,
    this.brands,
    this.products,
    this.customerCategorys,
    this.extra,
    this.customers,
    this.freeProducts = "",
    this.freeProductCodes,
    this.freeProductNames,
    this.freeProductIDs,
    this.giftProducts = "",
    this.marketHierarchies,
    this.freeChoosenProducts = "",
    this.customerClasss,
    this.excludeProducts,
    this.excludeDiscountedItem = false,
    this.includeVatForFreeProduct = false,
    this.marketHierarchieCodes,
    this.isActive = false,
    this.isPriorToLineItem,
    this.endDateForFilter,
    // this.choosenProductList,
    this.eachMinLimit,
    this.targetPercentLimit,
    this.discountedItemPolicy,
    this.proRated = false,
    this.creationDate,
    this.modificationDate,
    this.createdBy,
    this.modifiedBy,
    this.id, //
  });

  late String code;
  late String name;
  late int discountFor;
  late int discountOn;
  int? entityRuleType;
  int? numberRuleType;
  int numberValue;
  int numberValueLessEquel;
  int? discountValueType;
  double discountValue;
  bool hasUserChoice;
  int? discountLimitation;
  int? limitationTimes;
  String startDateUtc;
  String? startDateFormated;
  String endDateUtc;
  String? endDateFormated;
  int priority;
  String? categories;
  String? brands;
  String? products;
  String? customerCategorys;
  String? extra;
  String? customers;
  String freeProducts;
  String? freeProductCodes;
  String? freeProductNames;
  String? freeProductIDs;
  String giftProducts;
  String? marketHierarchies;
  String freeChoosenProducts;
  String? customerClasss;
  String? excludeProducts;
  bool excludeDiscountedItem;
  bool includeVatForFreeProduct;
  String? marketHierarchieCodes;
  bool isActive;
  bool? isPriorToLineItem;
  DateTime? endDateForFilter;
  // List<ProductModel>? choosenProductList;
  int? eachMinLimit;
  int? targetPercentLimit;
  int? discountedItemPolicy;
  bool proRated;
  String? creationDate;
  String? modificationDate;
  String? createdBy;
  String? modifiedBy;
  String? id;

  factory DiscountModel.fromJson(Map<String, dynamic> json) => DiscountModel(
        code: json["Code"],
        name: json["Name"],
        discountFor: json["DiscountFor"],
        discountOn: json["DiscountOn"],
        entityRuleType: json["EntityRuleType"],
        numberRuleType: json["NumberRuleType"],
        numberValue: json["NumberValue"] ?? 0,
        numberValueLessEquel: json["NumberValueLessEquel"] ?? 0,
        discountValueType: json["DiscountValueType"],
        discountValue: (json["DiscountValue"] ?? 0).toDouble(),
        hasUserChoice: json["HasUserChoice"] ?? false,
        discountLimitation: json["DiscountLimitation"],
        limitationTimes: json["LimitationTimes"],
        startDateUtc: json["StartDateUtc"],
        startDateFormated: json["StartDateFormated"],
        endDateUtc: json["EndDateUtc"],
        endDateFormated: json["EndDateFormated"],
        priority: json["Priority"] ?? 1,
        categories: json["Categories"],
        brands: json["Brands"],
        products: json["Products"],
        customerCategorys: json["CustomerCategorys"],
        extra: json["Extra"],
        customers: json["Customers"],
        freeProducts: json["FreeProducts"] ?? "",
        freeProductCodes: json["FreeProductCodes"],
        freeProductNames: json["FreeProductNames"],
        freeProductIDs: json["FreeProductIDs"],
        giftProducts: json["GiftProducts"] ?? "",
        marketHierarchies: json["MarketHierarchies"],
        freeChoosenProducts: json["FreeChoosenProducts"] ?? "",
        customerClasss: json["CustomerClasss"],
        excludeProducts: json["ExcludeProducts"],
        excludeDiscountedItem: json["ExcludeDiscountedItem"] ?? false,
        includeVatForFreeProduct: json["IncludeVatForFreeProduct"] ?? false,
        marketHierarchieCodes: json["MarketHierarchieCodes"],
        isActive: json["IsActive"],
        isPriorToLineItem: json["IsPriorToLineItem"],
        endDateForFilter: json["EndDateForFilter"] != null
            ? DateTime.parse(json["EndDateForFilter"])
            : null,
        // choosenProductList: List<ProductModel>.from(
        //     json["ChoosenProductList"].map((x) => ProductModel.fromJson(x))),
        eachMinLimit: json["EachMinLimit"],
        targetPercentLimit: json["TargetPercentLimit"],
        discountedItemPolicy: json["DiscountedItemPolicy"],
        proRated: json["ProRated"] ?? false,
        creationDate: json["CreationDate"],
        modificationDate: json["ModificationDate"],
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "DiscountFor": discountFor,
        "DiscountOn": discountOn,
        "EntityRuleType": entityRuleType,
        "NumberRuleType": numberRuleType,
        "NumberValue": numberValue,
        "NumberValueLessEquel": numberValueLessEquel,
        "DiscountValueType": discountValueType,
        "DiscountValue": discountValue,
        "HasUserChoice": hasUserChoice,
        "DiscountLimitation": discountLimitation,
        "LimitationTimes": limitationTimes,
        "StartDateUtc": startDateUtc,
        "StartDateFormated": startDateFormated,
        "EndDateUtc": endDateUtc,
        "EndDateFormated": endDateFormated,
        "Priority": priority,
        "Categories": categories,
        "Brands": brands,
        "Products": products,
        "CustomerCategorys": customerCategorys,
        "Extra": extra,
        "Customers": customers,
        "FreeProducts": freeProducts,
        "FreeProductCodes": freeProductCodes,
        "FreeProductNames": freeProductNames,
        "FreeProductIDs": freeProductIDs,
        "GiftProducts": giftProducts,
        "MarketHierarchies": marketHierarchies,
        "FreeChoosenProducts": freeChoosenProducts,
        "CustomerClasss": customerClasss,
        "ExcludeProducts": excludeProducts,
        "ExcludeDiscountedItem": excludeDiscountedItem,
        "IncludeVatForFreeProduct": includeVatForFreeProduct,
        "MarketHierarchieCodes": marketHierarchieCodes,
        "IsActive": isActive,
        "IsPriorToLineItem": isPriorToLineItem,
        "EndDateForFilter":
            "${endDateForFilter!.year.toString().padLeft(4, '0')}-${endDateForFilter!.month.toString().padLeft(2, '0')}-${endDateForFilter!.day.toString().padLeft(2, '0')}",
        // "ChoosenProductList":
        //     List<ProductModel>.from(choosenProductList!.map((x) => x.toJson())),
        "EachMinLimit": eachMinLimit,
        "TargetPercentLimit": targetPercentLimit,
        "DiscountedItemPolicy": discountedItemPolicy,
        "ProRated": proRated,
        "CreationDate": creationDate,
        "ModificationDate": modificationDate,
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
        "ID": id,
      };

  factory DiscountModel.fromDBJson(Map<String, dynamic> json) => DiscountModel(
        code: json["Code"],
        name: json["Name"],
        discountFor: json["DiscountFor"],
        discountOn: json["DiscountOn"],
        entityRuleType: json["EntityRuleType"],
        numberRuleType: json["NumberRuleType"],
        numberValue: json["NumberValue"],
        numberValueLessEquel: json["NumberValueLessEquel"],
        discountValueType: json["DiscountValueType"],
        discountValue: json["DiscountValue"].toDouble(),
        hasUserChoice: json["HasUserChoice"],
        discountLimitation: json["DiscountLimitation"],
        limitationTimes: json["LimitationTimes"],
        startDateUtc: json["StartDateUtc"],
        startDateFormated: json["StartDateFormated"],
        endDateUtc: json["EndDateUtc"],
        endDateFormated: json["EndDateFormated"],
        priority: json["Priority"] ?? 1,
        categories: json["Categories"],
        brands: json["Brands"],
        products: json["Products"],
        customerCategorys: json["CustomerCategorys"],
        extra: json["Extra"],
        customers: json["Customers"],
        freeProducts: json["FreeProducts"],
        freeProductCodes: json["FreeProductCodes"],
        freeProductNames: json["FreeProductNames"],
        freeProductIDs: json["FreeProductIDs"],
        giftProducts: json["GiftProducts"],
        marketHierarchies: json["MarketHierarchies"],
        freeChoosenProducts: json["FreeChoosenProducts"],
        customerClasss: json["CustomerClasss"],
        excludeProducts: json["ExcludeProducts"],
        excludeDiscountedItem: json["ExcludeDiscountedItem"],
        includeVatForFreeProduct: json["IncludeVatForFreeProduct"],
        marketHierarchieCodes: json["MarketHierarchieCodes"],
        isActive: json["IsActive"],
        isPriorToLineItem: json["IsPriorToLineItem"],
        endDateForFilter: json["EndDateForFilter"] != null
            ? DateTime.parse(json["EndDateForFilter"])
            : null,
        // choosenProductList: List<ProductModel>.from(
        //     json["ChoosenProductList"].map((x) => ProductModel.fromJson(x))),
        eachMinLimit: json["EachMinLimit"],
        targetPercentLimit: json["TargetPercentLimit"],
        discountedItemPolicy: json["DiscountedItemPolicy"],
        proRated: json["ProRated"],
        creationDate: json["CreationDate"],
        modificationDate: json["ModificationDate"],
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
        id: json["ID"],
      );

  Map<String, dynamic> toDBJson() => {
        "code": code,
        "name": name,
        "discountFor": discountFor,
        "discountOn": discountOn,
        "fullObject": json.encode(toJson())
      };
}

class AppliedDiscountModel {
  late int discountOn;
  late String orderNo;
  late String productCode;
  late String productName;
  late String onProductCode;
  late String onProductName;
  late String discountCode;
  late int discountQty;
  late double discountAmount;
  late int productType;
  List<LineItemModel>? choosenProducts = [];

  AppliedDiscountModel(
      {required this.discountOn,
      required this.orderNo,
      required this.productCode,
      required this.productName,
      required this.onProductCode,
      required this.onProductName,
      required this.discountCode,
      required this.discountQty,
      required this.discountAmount,
      required this.productType,
      choosenProducts});

  factory AppliedDiscountModel.fromJson(Map<String, dynamic> json) =>
      AppliedDiscountModel(
        discountOn: json['DiscountOn'],
        orderNo: json['OrderNo'],
        productCode: json['ProductCode'],
        productName: json['ProductName'],
        onProductCode: json['OnProductCode'],
        onProductName: json['OnProductName'],
        discountCode: json['DiscountCode'],
        discountQty: json['DiscountQty'],
        discountAmount: json['DiscountAmount'],
        productType: json['ProductType'],
      );
  Map<String, dynamic> toJson() => {
        "DiscountOn": discountOn,
        "OrderNo": orderNo,
        "ProductCode": productCode,
        "ProductName": productName,
        "OnProductCode": onProductCode,
        "OnProductName": onProductName,
        "DiscountCode": discountCode,
        "DiscountQty": discountQty,
        "DiscountAmount": discountAmount,
        "ProductType": productType
      };
}

enum DiscountOn {
  nothing,
  lineItem,
  subTotal,
  productGroup,
  lastMonthSalesAmount,
  openSubTotal
}

enum DiscountLimitationType {
  unlimited,
  perUnit,
  inRange,
  subTotal,
  perRangeLowerBound,
}

enum ValidWhen { alone, withOtherDiscount }

enum EntityRuleType {
  any,
  product,
  category,
  brand,
  customerCategory,
  customer,
  combineProducts,
  mHWise,
  customerClass,
  customerType
}

enum NumberRuleType {
  quantity,
  amount,
  percentAmount,
  percentQty,
  rangeAmount,
  rangeQty,
  rangePercentAmount,
  rangePercentQty,
  gMAvgQty,
  gMEachQty,
  gMAvgAmount,
  gMEachAmount,
  anyInvoiceTotalInMonth,
  any,
  unitQty
}

enum DiscountValueType {
  nothing,
  fixedAmount,
  percentAmount,
  freeProduct,
  freeSameProduct,
  promotionalProduct,
  lessUnitPrice,
  freeChoosenProduct,
  openSubTotal
}

enum DiscountFor { nothing, retailer, distributor, fieldForce }

enum ProductBase { any, product, brand, category }

enum CustomerBase { any, customer, markets, distributors }

enum CustomerCategoryBase { any, customerCategory, distributorCategory }

enum DiscountType { primary, secondary }

enum PromotionType { displayProgram, promotionalCard }

enum DiscountItemEligibility { nothing, noMoreDiscount, restOfQty, open }

enum DiscountProductType { cash, product, gift, sameProduct, choosenProduct }
