import 'package:efgecom/pages/homePage/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
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
        productId: 111,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 222,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 333,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 444,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
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
                style: CustomTextStyle.subHeader1(context)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: buttonColor,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text('See All', style: TextStyle(fontSize: 12.sp))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
          height: 295.h,
          //height: 300.h,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 7.w,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(productTileCurve.r),
                        bottomRight: Radius.circular(productTileCurve.r)),
                    child: ProductTile(
                      productId: featured[index].productId,
                imgUrl: featured[index].imgUrl,
                    titleBang: featured[index].titleBang,
                    titleEng: featured[index].titleEng,
                    newPrice: featured[index].newPrice,
                    oldPrice: featured[index].oldPrice,
                    discountPrice: featured[index].discountPrice,
                    rating: featured[index].rating,
                    reviews: featured[index].reviews),);
              }),
        ),
      ],
    );
  }
}
