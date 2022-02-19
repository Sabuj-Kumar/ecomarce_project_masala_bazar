import 'package:efgecom/pages/homePage/widget/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';
import '../../../models/featured_product_model.dart';

class FeaturedProduct extends StatefulWidget {
  const FeaturedProduct({Key? key}) : super(key: key);

  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  late List<FeaturedProductModel> featured;

  @override
  void initState() {
    super.initState();
    featured = [
      FeaturedProductModel(
          imgUrl: 'assets/img/katla.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/katla.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          rating: 4.6,
          reviews: 86),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 29.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Product',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: buttonColor,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('See All')),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
          height: 280.h,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 24.w,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return ProductTile(
                    imgUrl: featured[index].imgUrl,
                    titleBang: featured[index].titleBang,
                    titleEng: featured[index].titleEng,
                    newPrice: featured[index].newPrice,
                    oldPrice: featured[index].oldPrice,
                    rating: featured[index].rating,
                    reviews: featured[index].reviews);
              }),
        ),
      ],
    );
  }
}
