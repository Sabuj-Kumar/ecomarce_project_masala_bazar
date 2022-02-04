import 'dart:convert';

UserModel userModelFromString(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToString(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.brandAllowed,
      this.brandLabel,
      this.categoryAllowed,
      this.categoryLabel,
      this.companyCode,
      this.customerLabel,
      this.discountAllowed,
      this.dcrSource,
      this.downloadUrl,
      this.marketLabel,
      this.productLabel,
      this.tranLabel,
      this.uploadUrl,
      this.fieldForceLabel,
      this.hasOrderDeliveryDate,
      this.hasOrderDescription,
      this.hasOrderPayment,
      this.hasOrderPaymentDescription,
      this.hasOrderShift,
      this.hasInventory,
      this.hasKpi,
      this.hasOrderDateChangable,
      this.systemType,
      this.dcrShift,
      this.workedWith,
      this.location,
      this.orderEntryMenus,
      this.companyType,
      this.allowFreeCustomer,
      this.allowPreLoad,
      this.hasLocationTraking,
      this.isLocationTrakingMendatory,
      this.permisions,
      this.doctorLabel,
      this.hasOrderLocation,
      this.locationRadious,
      this.gpsInterval,
      this.invoiceLabel,
      this.hasProductSerial,
      this.doctorServiceBudgetLevel,
      this.distributorLabel,
      this.visualAidlabel,
      this.ffMarketHierarchyId,
      this.hasPkd,
      this.companyName,
      this.companyAddress,
      this.companyBin,
      this.logo,
      this.doctorServiceLabel,
      this.distributorCode,
      this.ffCode,
      this.ffName,
      this.password,
      this.allowCustomerSelfOrder,
      this.allowSelfOrder,
      this.allowDcr,
      this.thanas,
      this.ffActionType,
      this.ffType,
      this.ffDesignationCode,
      this.ffDesignationName,
      this.currentServerDate,
      this.validBackDate,
      this.jwt});

  bool? brandAllowed;
  String? brandLabel;
  bool? categoryAllowed;
  String? categoryLabel;
  String? companyCode;
  String? customerLabel;
  bool? discountAllowed;
  String? dcrSource;
  String? downloadUrl;
  String? marketLabel;
  String? productLabel;
  String? tranLabel;
  String? uploadUrl;
  String? fieldForceLabel;
  bool? hasOrderDeliveryDate;
  bool? hasOrderDescription;
  bool? hasOrderPayment;
  bool? hasOrderPaymentDescription;
  bool? hasOrderShift;
  bool? hasInventory;
  bool? hasKpi;
  bool? hasOrderDateChangable;
  String? systemType;
  String? dcrShift;
  String? workedWith;
  String? location;
  String? orderEntryMenus;
  String? companyType;
  bool? allowFreeCustomer;
  bool? allowPreLoad;
  bool? hasLocationTraking;
  bool? isLocationTrakingMendatory;
  String? permisions;
  String? doctorLabel;
  bool? hasOrderLocation;
  int? locationRadious;
  int? gpsInterval;
  String? invoiceLabel;
  bool? hasProductSerial;
  int? doctorServiceBudgetLevel;
  String? distributorLabel;
  dynamic visualAidlabel;
  String? ffMarketHierarchyId;
  bool? hasPkd;
  String? companyName;
  String? companyAddress;
  dynamic companyBin;
  String? logo;
  dynamic doctorServiceLabel;
  String? distributorCode;
  String? ffCode;
  String? ffName;
  String? password;
  bool? allowCustomerSelfOrder;
  bool? allowSelfOrder;
  bool? allowDcr;
  String? thanas;
  String? ffActionType;
  String? ffType;
  String? ffDesignationCode;
  String? ffDesignationName;
  DateTime? currentServerDate;
  DateTime? validBackDate;
  String? jwt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      brandAllowed: json["BrandAllowed"],
      brandLabel: json["BrandLabel"],
      categoryAllowed: json["CategoryAllowed"],
      categoryLabel: json["CategoryLabel"],
      companyCode: json["CompanyCode"],
      customerLabel: json["CustomerLabel"],
      discountAllowed: json["DiscountAllowed"],
      dcrSource: json["DCRSource"],
      downloadUrl: json["DownloadURL"],
      marketLabel: json["MarketLabel"],
      productLabel: json["ProductLabel"],
      tranLabel: json["TranLabel"],
      uploadUrl: json["UploadURL"],
      fieldForceLabel: json["FieldForceLabel"],
      hasOrderDeliveryDate: json["hasOrderDeliveryDate"],
      hasOrderDescription: json["hasOrderDescription"],
      hasOrderPayment: json["hasOrderPayment"],
      hasOrderPaymentDescription: json["hasOrderPaymentDescription"],
      hasOrderShift: json["hasOrderShift"],
      hasInventory: json["HasInventory"],
      hasKpi: json["HasKPI"],
      hasOrderDateChangable: json["hasOrderDateChangable"],
      systemType: json["SystemType"],
      dcrShift: json["DCR_Shift"],
      workedWith: json["Worked_With"],
      location: json["Location"],
      orderEntryMenus: json["OrderEntryMenus"],
      companyType: json["CompanyType"],
      allowFreeCustomer: json["AllowFreeCustomer"],
      allowPreLoad: json["AllowPreLoad"],
      hasLocationTraking: json["HasLocationTraking"],
      isLocationTrakingMendatory: json["IsLocationTrakingMendatory"],
      permisions: json["Permisions"],
      doctorLabel: json["DoctorLabel"],
      hasOrderLocation: json["hasOrderLocation"],
      locationRadious: json["LocationRadious"],
      gpsInterval: json["GPSInterval"],
      invoiceLabel: json["InvoiceLabel"],
      hasProductSerial: json["HasProductSerial"],
      doctorServiceBudgetLevel: json["DoctorServiceBudgetLevel"],
      distributorLabel: json["DistributorLabel"],
      visualAidlabel: json["VisualAidlabel"],
      ffMarketHierarchyId: json["FFMarketHierarchyId"],
      hasPkd: json["HasPkd"],
      companyName: json["CompanyName"],
      companyAddress: json["CompanyAddress"],
      companyBin: json["CompanyBIN"],
      logo: json["Logo"],
      doctorServiceLabel: json["DoctorServiceLabel"],
      distributorCode: json["DistributorCode"],
      ffCode: json["ffCode"],
      ffName: json["ffName"],
      password: json["password"],
      allowCustomerSelfOrder: json["AllowCustomerSelfOrder"],
      allowSelfOrder: json["AllowSelfOrder"],
      allowDcr: json["AllowDCR"],
      thanas: json["Thanas"],
      ffActionType: json["FFActionType"],
      ffType: json["FFType"],
      ffDesignationCode: json["FFDesignationCode"],
      ffDesignationName: json["FFDesignationName"],
      currentServerDate: DateTime.parse(json["CurrentServerDate"]),
      validBackDate: DateTime.parse(json["ValidBackDate"]),
      jwt: json["jwt"]);

  Map<String, dynamic> toJson() => {
        "BrandAllowed": brandAllowed,
        "BrandLabel": brandLabel,
        "CategoryAllowed": categoryAllowed,
        "CategoryLabel": categoryLabel,
        "CompanyCode": companyCode,
        "CustomerLabel": customerLabel,
        "DiscountAllowed": discountAllowed,
        "DCRSource": dcrSource,
        "DownloadURL": downloadUrl,
        "MarketLabel": marketLabel,
        "ProductLabel": productLabel,
        "TranLabel": tranLabel,
        "UploadURL": uploadUrl,
        "FieldForceLabel": fieldForceLabel,
        "hasOrderDeliveryDate": hasOrderDeliveryDate,
        "hasOrderDescription": hasOrderDescription,
        "hasOrderPayment": hasOrderPayment,
        "hasOrderPaymentDescription": hasOrderPaymentDescription,
        "hasOrderShift": hasOrderShift,
        "HasInventory": hasInventory,
        "HasKPI": hasKpi,
        "hasOrderDateChangable": hasOrderDateChangable,
        "SystemType": systemType,
        "DCR_Shift": dcrShift,
        "Worked_With": workedWith,
        "Location": location,
        "OrderEntryMenus": orderEntryMenus,
        "CompanyType": companyType,
        "AllowFreeCustomer": allowFreeCustomer,
        "AllowPreLoad": allowPreLoad,
        "HasLocationTraking": hasLocationTraking,
        "IsLocationTrakingMendatory": isLocationTrakingMendatory,
        "Permisions": permisions,
        "DoctorLabel": doctorLabel,
        "hasOrderLocation": hasOrderLocation,
        "LocationRadious": locationRadious,
        "GPSInterval": gpsInterval,
        "InvoiceLabel": invoiceLabel,
        "HasProductSerial": hasProductSerial,
        "DoctorServiceBudgetLevel": doctorServiceBudgetLevel,
        "DistributorLabel": distributorLabel,
        "VisualAidlabel": visualAidlabel,
        "FFMarketHierarchyId": ffMarketHierarchyId,
        "HasPkd": hasPkd,
        "CompanyName": companyName,
        "CompanyAddress": companyAddress,
        "CompanyBIN": companyBin,
        "Logo": logo,
        "DoctorServiceLabel": doctorServiceLabel,
        "DistributorCode": distributorCode,
        "ffCode": ffCode,
        "ffName": ffName,
        "password": password,
        "AllowCustomerSelfOrder": allowCustomerSelfOrder,
        "AllowSelfOrder": allowSelfOrder,
        "AllowDCR": allowDcr,
        "Thanas": thanas,
        "FFActionType": ffActionType,
        "FFType": ffType,
        "FFDesignationCode": ffDesignationCode,
        "FFDesignationName": ffDesignationName,
        "CurrentServerDate":
            "${currentServerDate!.year.toString().padLeft(4, '0')}-${currentServerDate!.month.toString().padLeft(2, '0')}-${currentServerDate!.day.toString().padLeft(2, '0')}",
        "ValidBackDate":
            "${validBackDate!.year.toString().padLeft(4, '0')}-${validBackDate!.month.toString().padLeft(2, '0')}-${validBackDate!.day.toString().padLeft(2, '0')}",
        "jwt": jwt
      };
}
