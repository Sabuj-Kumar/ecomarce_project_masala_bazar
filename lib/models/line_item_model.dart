class LineItemModel {
  LineItemModel(
      {this.id,
      this.productId,
      this.productCode = "",
      this.productName = "",
      this.categoryCode,
      this.brandCode,
      this.discountCode,
      this.isOrder = true,
      this.isManualFreeQty,
      this.isSameProduct,
      this.excludeDiscountedItem,
      this.isDiscountApplied = false,
      this.hasChoosenProduct = false,
      this.onProductCode = "",
      this.discountType = "NA",
      this.productType = "Regular",
      this.packSize,
      this.unitPrice = 0,
      this.qty = 0,
      this.discountableQty = 0,
      this.orderFreeQty = 0,
      this.invoiceQty = 0,
      this.invoiceFreeQty = 0,
      this.supplyQty = 0,
      this.freeQty = 0,
      this.supplyTotal = 0,
      this.percentQty = 0,
      this.percentValue = 0,
      this.discountAmount = 0,
      this.discountPercentage = 0,
      this.tp = 0,
      this.vat = 0,
      this.total = 0,
      this.vatTotal = 0,
      this.netTotal = 0,
      this.grossTP = 0,
      this.orderDiscountAmount = 0,
      this.invoiceDiscountAmount = 0,
      this.invoiceNetTotal = 0,
      this.discountableTP = 0,
      this.discountableTPAfter = 0,
      this.choosenQty});

  // ======== PRIMARY DATA ====================
  String? id;
  String? productId;
  String productCode;
  String productName;

  //======== RELATIONAL DATA =========
  String? categoryCode;
  String? brandCode;
  String? discountCode;

  //==========  TYPE/CONDITINAL VERIABLES ====================
  bool? isOrder;
  bool? isManualFreeQty;
  bool? isSameProduct;
  bool? excludeDiscountedItem;
  bool isDiscountApplied;
  bool hasChoosenProduct;
  String? onProductCode;
  String? discountType;
  String? productType;

  //=========  PRICE VERIABLES ==================
  String? packSize;
  double? unitPrice;

  //========= QUANTITY VARIABLES ================
  int qty;
  int discountableQty;
  double? orderFreeQty;
  double? invoiceQty;
  double? invoiceFreeQty;
  double? supplyQty;
  int freeQty;
  double? supplyTotal;
  double percentQty;
  double percentValue;

  //======== AMOUNT VARIABLES ============
  double discountAmount;
  double discountPercentage;
  double tp;
  double vat;
  double total;
  double vatTotal;
  double netTotal;
  double grossTP;
  double? orderDiscountAmount;
  double? invoiceDiscountAmount;
  double? invoiceNetTotal;
  double discountableTP;
  double? discountableTPAfter;

  //======== LOCAL USE VARIABLES ============
  int previousQty = 0;
  String? productImage;
  List<LineItemModel> choosenProducts = [];
  LineItemModel? selectedChoosenProduct;
  int selectedChoosenQty = 0;
  int? choosenQty;

  factory LineItemModel.fromJson(Map<String, dynamic> json) => LineItemModel(
      id: json["ID"],
      productId: json["ProductId"],
      productCode: json["ProductCode"],
      productName: json["ProductName"],
      categoryCode: json["CategoryCode"],
      brandCode: json["BrandCode"],
      discountCode: json["DiscountCode"],
      isOrder: json["IsOrder"],
      isManualFreeQty: json["IsManualFreeQty"],
      isSameProduct: json["IsSameProduct"],
      excludeDiscountedItem: json["ExcludeDiscountedItem"],
      isDiscountApplied: json["IsDiscountApplied"],
      hasChoosenProduct: json["HasChoosenProduct"],
      onProductCode: json["OnProductCode"],
      discountType: json["DiscountType"],
      productType: json["ProductType"],
      packSize: json["PackSize"],
      unitPrice: json["UnitPrice"] ?? 0,
      qty: json["Qty"] ?? 0,
      discountableQty: json["DiscountableQty"] ?? 0,
      orderFreeQty: json["OrderFreeQty"] ?? 0,
      invoiceQty: json["InvoiceQty"] ?? 0,
      invoiceFreeQty: json["InvoiceFreeQty"] ?? 0,
      supplyQty: json["Supply_Qty"] ?? 0,
      freeQty: json["FreeQty"] ?? 0,
      supplyTotal: json["Supply_Total"] ?? 0,
      percentQty: json["PercentQty"] ?? 0,
      percentValue: json["PercentValue"] ?? 0,
      discountAmount: json["DiscountAmount"] ?? 0,
      discountPercentage: json["DiscountPercentage"] ?? 0,
      tp: json["TP"] ?? 0,
      vat: json["VAT"] ?? 0,
      total: json["Total"] ?? 0,
      vatTotal: json["VATTotal"] ?? 0,
      netTotal: json["NetTotal"] ?? 0,
      grossTP: json["GrossTP"] ?? 0,
      orderDiscountAmount: json["OrderDiscountAmount"] ?? 0,
      invoiceDiscountAmount: json["InvoiceDiscountAmount"] ?? 0,
      invoiceNetTotal: json["InvoiceNetTotal"] ?? 0,
      discountableTP: json["DiscountableTP"] ?? 0,
      discountableTPAfter: json["DiscountableTPAfter"] ?? 0,
      choosenQty: json["ChoosenQty"]);

  Map<String, dynamic> toJson() => {
        "ID": id,
        "ProductId": productId,
        "ProductCode": productCode,
        "ProductName": productName,
        "CategoryCode": categoryCode,
        "BrandCode": brandCode,
        "DiscountCode": discountCode,
        "IsOrder": isOrder,
        "IsManualFreeQty": isManualFreeQty,
        "IsSameProduct": isSameProduct,
        "ExcludeDiscountedItem": excludeDiscountedItem,
        "IsDiscountApplied": isDiscountApplied,
        "HasChoosenProduct": hasChoosenProduct,
        "OnProductCode": onProductCode,
        "DiscountType": discountType,
        "ProductType": productType,
        "PackSize": packSize,
        "UnitPrice": unitPrice,
        "Qty": qty,
        "DiscountableQty": discountableQty,
        "OrderFreeQty": orderFreeQty,
        "InvoiceQty": invoiceQty,
        "InvoiceFreeQty": invoiceFreeQty,
        "Supply_Qty": supplyQty,
        "FreeQty": freeQty,
        "Supply_Total": supplyTotal,
        "PercentQty": percentQty,
        "PercentValue": percentValue,
        "DiscountAmount": discountAmount,
        "DiscountPercentage": discountPercentage,
        "TP": tp,
        "VAT": vat,
        "Total": total,
        "VATTotal": vatTotal,
        "NetTotal": netTotal,
        "GrossTP": grossTP,
        "OrderDiscountAmount": orderDiscountAmount,
        "InvoiceDiscountAmount": invoiceDiscountAmount,
        "InvoiceNetTotal": invoiceNetTotal,
        "DiscountableTP": discountableTP,
        "DiscountableTPAfter": discountableTPAfter,
        "ChoosenQty": choosenQty
      };
}
