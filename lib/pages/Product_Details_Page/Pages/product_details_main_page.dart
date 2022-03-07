import 'package:carousel_slider/carousel_slider.dart';
import 'package:efgecom/components/appbars/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Widgets/draggable_widgerts.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {Key? key,
      this.newPrice,
      this.rating,
      this.oldPrice,
      this.productNameBng,
      this.productNameEng,
      this.reviews})
      : super(key: key);
  final String? productNameEng;
  final String? productNameBng;
  final double? oldPrice;
  final double? newPrice;
  final int? reviews;
  final double? rating;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List images = [
    "assets/img/hilsha.png",
    "assets/img/hilsha.png",
    "assets/img/hilsha.png",
  ];

  List<bool> clicked = [true, false, false];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Product Details',
      ),
      body: SafeArea(
        child: Stack(children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIdex) {
              return buildImage(images[index], index, width);
            },
            options: CarouselOptions(
              height: height * 0.25,
              viewportFraction: 1,
              initialPage: 1,
              enableInfiniteScroll: false,
              pageSnapping: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                  print("$_index");
                });
              },
            ),
          ),
          Positioned(
              top: height * 0.25.h,
              left: width * 0.5.w,
              child: buildIndicator()),
          DragAbleList(
            productNameEng: widget.productNameEng,
            productNameBng: widget.productNameBng,
            reviews: widget.reviews,
            rating: widget.rating,
            oldPrice: widget.oldPrice,
            newPrice: widget.newPrice,
          )
        ]),
      ),
    );
  }

  Widget buildImage(String imaUrl, int index, double width) => SizedBox(
        width: width,
        child: Image.asset(
          imaUrl,
          fit: BoxFit.cover,
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        count: images.length,
        activeIndex: _index,
        effect: SlideEffect(
            activeDotColor: Colors.deepOrange,
            dotColor: Colors.white,
            radius: 10,
            dotHeight: 10.h,
            dotWidth: 10.w,
            spacing: 15.w),
      );
}
