class ProductDetails {
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

  ProductDetails({
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
    required this.tags
  });
}
