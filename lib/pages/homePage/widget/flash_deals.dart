import 'package:efgecom/pages/homePage/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../../../models/featured_product_model.dart';

class FlashDeals extends StatefulWidget {
  const FlashDeals({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;

  @override
  State<FlashDeals> createState() => _FlashDealsState();
}

class _FlashDealsState extends State<FlashDeals> {
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

  List<String> time = ["Days", "Hours", "Minutes", "Seconds"];

  List<String> value = ["15", "05", "25", "25"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flash Deals',
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
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Hurry Up!  ",
                style: CustomTextStyle.bodySmall(context).copyWith(
                  fontSize: 14.sp,
                  color: buttonColor,
                ),
              ),
              TextSpan(
                text: "Offer ends in:",
                style: CustomTextStyle.bodySmall(context).copyWith(
                  fontSize: 14.sp,
                  color: buttonColor.withOpacity(0.9),
                  fontWeight: FontWeight.w400
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 34.h,
            width: 297.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.1.h),
                    child: Container(
                        decoration: BoxDecoration(
                            color: irisOrange,
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Padding(
                          padding: EdgeInsets.all(7.0.w),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: value[index] + " ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              TextSpan(
                                text: time[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    letterSpacing: 0.2
                                ),
                              ),
                            ]),
                          ),
                        )),
                  ),
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 970.h,
            child: GridView.builder(
                itemCount: featured.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 13.w / 21.h,
                  mainAxisSpacing: 5,
                  //childAspectRatio: MediaQuery.of(context).devicePixelRatio * 0.55
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.4.w),
                    child: ProductTile(
                        imgUrl: featured[index].imgUrl,
                        titleBang: featured[index].titleBang,
                        titleEng: featured[index].titleEng,
                        newPrice: featured[index].newPrice,
                        oldPrice: featured[index].oldPrice,
                        rating: featured[index].rating,
                        reviews: featured[index].reviews),
                  );
                }),
          )
        ],
      ),
    );
  }
}
