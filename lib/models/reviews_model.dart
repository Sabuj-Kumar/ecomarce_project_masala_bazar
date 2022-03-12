class ReviewsModel {
  final String? id;
  final String? name;
  final String? image;
  final double? rating;
  final List<String>? uploadedImages;
  final List<String>? comments;
  final String? productId;
  final String? createdBy;
  final int? starCount;
  final String? currentDate;
  ReviewsModel(
      {this.id,
      this.productId,
      this.createdBy,
      this.starCount,
      this.image,
      this.rating,
      this.uploadedImages,
      this.comments,
      this.name,
      this.currentDate});
}
