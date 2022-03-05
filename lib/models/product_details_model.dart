class ProductDetails {
  late final String? productName;
  late final int? quantity;
  late final String? views;
  late final int? available;
  late final int? percentageOfOffer;
  late final int? weightRangeStart;
  late final int? weightRangeEnd;
  late final String? categoryName;
  late final List<String>? keyDescription;
  late final List<String>? categoryListTageName;
  late final List<String>? variousTemperList;
  late final List<String>? moreDetailsList;
  late final String? reviewRating;
  late final double? numberOfReview;
  late final double? price;

  ProductDetails(
      this.productName,
      this.quantity,
      this.views,
      this.available,
      this.percentageOfOffer,
      this.weightRangeStart,
      this.weightRangeEnd,
      this.categoryName,
      this.categoryListTageName,
      this.keyDescription,
      this.moreDetailsList,
      this.numberOfReview,
      this.price,
      this.reviewRating,
      this.variousTemperList);
}
