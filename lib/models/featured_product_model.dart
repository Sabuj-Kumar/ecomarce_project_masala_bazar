class FeaturedProductModel {
  final int productId;
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final double newPrice;
  final double oldPrice;
  final double? discountPrice;
  final double rating;
  final int reviews;
  late int quantity;

  FeaturedProductModel(
      {required this.productId,
      required this.imgUrl,
      required this.titleBang,
      required this.titleEng,
      required this.newPrice,
      required this.oldPrice,
      this.discountPrice,
      required this.rating,
      required this.reviews,
      this.quantity = 1});

  Map<String, dynamic> toMap() {
    return {
      'productId': this.productId,
      'imgUrl': this.imgUrl,
      'titleBang': this.titleBang,
      'titleEng': this.titleEng,
      'newPrice': this.newPrice,
      'oldPrice': this.oldPrice,
      'rating': this.rating,
      'reviews': this.reviews,
      'quantity': this.quantity
    };
  }

  factory FeaturedProductModel.fromMap(Map<String, dynamic> map) {
    return FeaturedProductModel(
        productId: map['productId'],
        imgUrl: map['imgUrl'],
        titleBang: map['titleBang'],
        titleEng: map['titleEng'],
        newPrice: map['newPrice'],
        oldPrice: map['oldPrice'],
        rating: map['rating'],
        reviews: map['reviews'],
        quantity: map['quantity']);
  }
}
