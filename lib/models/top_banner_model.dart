import 'dart:ui';

class TopBannerModel {
  final int id;
  final String title;
  final String imgUrl;
  final String? date;
  final Color? color;
  final String? bodyText;

  TopBannerModel(
      {required this.id, required this.title, required this.imgUrl, this.date,this.color,this.bodyText});
}
