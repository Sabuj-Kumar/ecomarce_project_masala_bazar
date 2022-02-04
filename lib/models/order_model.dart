import 'dart:convert';

import 'package:efgecom/models/discount_model.dart';
import 'package:efgecom/models/line_item_model.dart';

class OrderModel {
  //Local USe Variables
  String? localDbId;
  bool? isSent;

  //API Variables
  int? orderId;
  String? orderNo;
  String? orderDate;
  String? customerCode;
  String? paymentMode;
  String? deliveryDate;
  String? collectionDate;
  String? deliveryShift;
  double? total;
  double? discountAmount;
  double? netTotal;
  double? tpTotal;
  double? vatTotal;
  String? description;
  String? paymentDesc;
  int? orderType;
  String? customerName;
  String? location;
  double? longitude;
  double? latitude;
  double? accuracy;
  String? provider;
  String? refOrderNo;
  bool? isDiscountAdjustToCash;
  List<LineItemModel>? orderDetails = [];
  List<AppliedDiscountModel>? orderDiscounts = [];
  String? marketCode;
  String? distributorCode;
  double? subTotalDiscount;
  double? totalLineDiscount;
  double? subTotalRate;
  double? collectionAmount;
  double? openSubTotalDiscountAmount;
  double? orderTPTotal;
  int? returnType;
  bool? isPrinted;
  double? hashKey;

  OrderModel({
    this.localDbId,
    this.isSent = false,
    this.orderId,
    this.orderNo,
    this.orderDate,
    this.customerCode,
    this.paymentMode,
    this.deliveryDate,
    this.collectionDate,
    this.deliveryShift,
    this.total = 0,
    this.discountAmount = 0,
    this.netTotal = 0,
    this.tpTotal = 0,
    this.vatTotal = 0,
    this.description,
    this.paymentDesc,
    this.orderType,
    this.customerName,
    this.location,
    this.longitude,
    this.latitude,
    this.accuracy,
    this.provider,
    this.refOrderNo,
    this.isDiscountAdjustToCash,
    this.orderDetails,
    this.orderDiscounts,
    this.marketCode,
    this.distributorCode,
    this.subTotalDiscount = 0,
    this.totalLineDiscount = 0,
    this.subTotalRate = 0,
    this.collectionAmount = 0,
    this.openSubTotalDiscountAmount = 0,
    this.orderTPTotal = 0,
    this.returnType,
    this.isPrinted = false,
    this.hashKey,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json["OrderID"],
        orderNo: json["OrderNo"],
        orderDate: json["OrderDate"],
        customerCode: json["CustomerCode"],
        paymentMode: json["PaymentMode"],
        deliveryDate: json["DeliveryDate"],
        collectionDate: json["CollectionDate"],
        deliveryShift: json["DeliveryShift"],
        total: json["Total"],
        discountAmount: json["DiscountAmount"],
        netTotal: json["NetTotal"],
        tpTotal: json["TpTotal"],
        vatTotal: json["VatTotal"],
        description: json["Description"],
        paymentDesc: json["PaymentDesc"],
        orderType: json["OrderType"],
        customerName: json["CustomerName"],
        location: json["Location"],
        longitude: json["Longitude"],
        latitude: json["Latitude"],
        accuracy: json["Accuracy"],
        provider: json["Provider"],
        refOrderNo: json["RefOrderNo"],
        isDiscountAdjustToCash: json["IsDiscountAdjustToCash"],
        orderDetails: json["OrderDetails"]
            .map((el) => LineItemModel.fromJson(el))
            .toList(),
        orderDiscounts: json["OrderDiscounts"]
            .map((el) => AppliedDiscountModel.fromJson(el))
            .toList(),
        marketCode: json["MarketCode"],
        distributorCode: json["DistributorCode"],
        subTotalDiscount: json["SubTotalDiscount"] ?? 0,
        totalLineDiscount: json["TotalLineDiscount"] ?? 0,
        subTotalRate: json["SubTotalRate"] ?? 0,
        collectionAmount: json["CollectionAmount"] ?? 0,
        openSubTotalDiscountAmount: json["OpenSubTotalDiscountAmount"] ?? 0,
        orderTPTotal: json["OrderTPTotal"] ?? 0,
        returnType: json["ReturnType"],
        isPrinted: json["IsPrinted"],
        hashKey: json["HashKey"],
      );

  Map<String, dynamic> toJson() => {
        "OrderID": orderId,
        "OrderNo": orderNo,
        "OrderDate": orderDate,
        "CustomerCode": customerCode,
        "PaymentMode": paymentMode,
        "DeliveryDate": deliveryDate,
        "CollectionDate": collectionDate,
        "DeliveryShift": deliveryShift,
        "Total": total,
        "DiscountAmount": discountAmount,
        "NetTotal": netTotal,
        "TpTotal": tpTotal,
        "VatTotal": vatTotal,
        "Description": description,
        "PaymentDesc": paymentDesc,
        "OrderType": orderType,
        "CustomerName": customerName,
        "Location": location,
        "Longitude": longitude,
        "Latitude": latitude,
        "Accuracy": accuracy,
        "Provider": provider,
        "RefOrderNo": refOrderNo,
        "IsDiscountAdjustToCash": isDiscountAdjustToCash,
        "OrderDetails": List<Map<String, dynamic>>.from(
            orderDetails!.map((el) => el.toJson())),
        "OrderDiscounts": List<Map<String, dynamic>>.from(
            orderDiscounts!.map((el) => el.toJson())),
        "MarketCode": marketCode,
        "DistributorCode": distributorCode,
        "SubTotalDiscount": subTotalDiscount,
        "TotalLineDiscount": totalLineDiscount,
        "SubTotalRate": subTotalRate,
        "CollectionAmount": collectionAmount,
        "OpenSubTotalDiscountAmount": openSubTotalDiscountAmount,
        "OrderTPTotal": orderTPTotal,
        "ReturnType": returnType,
        "IsPrinted": isPrinted,
        "HashKey": hashKey,
      };

  factory OrderModel.fromDBJson(
          Map<String, dynamic> json, String _localDbId, bool _isSent) =>
      OrderModel(
        localDbId: _localDbId,
        isSent: _isSent,
        orderId: json["OrderID"],
        orderNo: json["OrderNo"],
        orderDate: json["OrderDate"],
        customerCode: json["CustomerCode"],
        paymentMode: json["PaymentMode"],
        deliveryDate: json["DeliveryDate"],
        collectionDate: json["CollectionDate"],
        deliveryShift: json["DeliveryShift"],
        total: json["Total"],
        discountAmount: json["DiscountAmount"],
        netTotal: json["NetTotal"],
        tpTotal: json["TpTotal"],
        vatTotal: json["VatTotal"],
        description: json["Description"],
        paymentDesc: json["PaymentDesc"],
        orderType: json["OrderType"],
        customerName: json["CustomerName"],
        location: json["Location"],
        longitude: json["Longitude"],
        latitude: json["Latitude"],
        accuracy: json["Accuracy"],
        provider: json["Provider"],
        refOrderNo: json["RefOrderNo"],
        isDiscountAdjustToCash: json["IsDiscountAdjustToCash"],
        orderDetails: json["OrderDetails"]
            .map((el) => LineItemModel.fromJson(el))
            .toList(),
        orderDiscounts: json["OrderDiscounts"]
            .map((el) => AppliedDiscountModel.fromJson(el))
            .toList(),
        marketCode: json["MarketCode"],
        distributorCode: json["DistributorCode"],
        subTotalDiscount: json["SubTotalDiscount"] ?? 0,
        totalLineDiscount: json["TotalLineDiscount"] ?? 0,
        subTotalRate: json["SubTotalRate"] ?? 0,
        collectionAmount: json["CollectionAmount"] ?? 0,
        openSubTotalDiscountAmount: json["OpenSubTotalDiscountAmount"] ?? 0,
        orderTPTotal: json["OrderTPTotal"] ?? 0,
        returnType: json["ReturnType"],
        isPrinted: json["IsPrinted"],
        hashKey: json["HashKey"],
      );

  Map<String, dynamic> toDBJson() => {
        "localDbId": localDbId,
        "isSent": isSent,
        "orderNo": orderNo,
        "customerCode": customerCode,
        "deliveryDate": deliveryDate,
        "collectionDate": collectionDate,
        "deliveryShift": deliveryShift,
        "total": total,
        "marketCode": marketCode,
        "DistributorCode": distributorCode,
        "returnType": returnType,
        "fullObject": json.encode(toJson())
      };
}
