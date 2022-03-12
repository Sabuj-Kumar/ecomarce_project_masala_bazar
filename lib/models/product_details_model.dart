class ProductDetails {
  final String? id;
  final String? retailerId;
  final String? productId;
  final String? brandId;
  final String? brandName;
  final String? categoryId;
  final String? categoryName;
  final String? companyId;
  final String? companyName;
  final int? mrp;
  final int? sellingPrice;
  final int? tp;
  final int? vat;
  final String? description;
  final bool maintainStock;
  final int currentStock;
  final int viewCount;
  final int totalSold;
  final bool isActive;
  final int hasWarranty;
  final String? warrantyLimitUnit;
  final bool returnPolicy;
  final int returnDay;
  final int? createdAt;
  final String? createdBy;
  final int? lastModified;
  final String? lastModifiedBy;
  final int? quantity;
  final int? views;
  final int? available;
  final double? percentageOfOffer;
  final double? weightRangeStart;
  final double? weightRangeEnd;
  final List<String>? keyDescription;
  final List<String>? categoryListTageName;
  final List<String>? variousTemperList;
  final List<String>? moreDetailsList;
  final List<String>? tags;
  final List<String>? images;

  ProductDetails(
      {this.brandId,
      this.brandName,
      this.categoryId,
      this.categoryName,
      this.companyId,
      this.companyName,
      this.mrp,
      this.sellingPrice,
      this.tp,
      this.vat,
      this.description,
      this.maintainStock = false,
      this.currentStock = 0,
      this.viewCount = 0,
      this.totalSold = 0,
      this.isActive = false,
      this.hasWarranty = 0,
      this.warrantyLimitUnit,
      this.returnPolicy = false,
      this.returnDay = 0,
      this.createdAt,
      this.createdBy,
      this.lastModified,
      this.lastModifiedBy,
      this.images,
      required this.retailerId,
      required this.productId,
      required this.id,
      required this.quantity,
      required this.views,
      required this.available,
      required this.percentageOfOffer,
      required this.weightRangeStart,
      required this.weightRangeEnd,
      required this.categoryListTageName,
      required this.keyDescription,
      required this.moreDetailsList,
      required this.variousTemperList,
      required this.tags});
}
