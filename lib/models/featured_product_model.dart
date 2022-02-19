class FeaturedProductModel {
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final int newPrice;
  final int oldPrice;
  final double rating;
  final int reviews;

  FeaturedProductModel(
      {required this.imgUrl,
      required this.titleBang,
      required this.titleEng,
      required this.newPrice,
      required this.oldPrice,
      required this.rating,
      required this.reviews});
}
