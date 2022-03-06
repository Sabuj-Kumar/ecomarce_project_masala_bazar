class FeaturedProductModel {
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final double newPrice;
  final double oldPrice;
  final double? discountPrice;
  final double rating;
  final int reviews;

  FeaturedProductModel(
      {required this.imgUrl,
      required this.titleBang,
      required this.titleEng,
      required this.newPrice,
      required this.oldPrice,
      this.discountPrice,
      required this.rating,
      required this.reviews});
}
