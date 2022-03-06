import 'package:efgecom/components/appbars/custom_appbar.dart';
import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/homePage/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/featured_product_model.dart';

class FishMeat extends StatefulWidget {
  final String title;

  const FishMeat({Key? key, required this.title}) : super(key: key);

  @override
  State<FishMeat> createState() => _FishMeatState();
}

class _FishMeatState extends State<FishMeat> {
  late List<FeaturedProductModel> featured;
  final int _numPages = 10;

  @override
  void initState() {
    super.initState();
    featured = [
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
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
    return Scaffold(
      appBar: CustomAppbar(
        title: widget.title.toString(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 39.h,
            width: double.infinity,
            child: Card(
              elevation: 2.5,
              margin: EdgeInsets.zero,
              color: deepBgColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            'assets/icons/ranking.svg',
                          ),
                        ),
                        SizedBox(
                          width: 11.83.w,
                        ),
                        Text(
                          'Ranking',
                          style: CustomTextStyle.body(context)
                              .copyWith(fontSize: 16.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const InkWell(
                          child: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 9.82.w,
                        ),
                        Text(
                          'Filter',
                          style: CustomTextStyle.body(context)
                              .copyWith(fontSize: 16.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 19.79.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21.75.w),
                  height: 1240.h,
                  child: GridView.builder(
                      itemCount: featured.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        //childAspectRatio: 13.w / 21.h,
                        childAspectRatio: 13.sw / 9.5.sh,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 10.w
                        //childAspectRatio: MediaQuery.of(context).devicePixelRatio * 0.55
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(productTileCurve.r),
                                bottomRight: Radius.circular(productTileCurve.r)),
                            child: ProductTile(
                                imgUrl: featured[index].imgUrl,
                                titleBang: featured[index].titleBang,
                                titleEng: featured[index].titleEng,
                                newPrice: featured[index].newPrice,
                                oldPrice: featured[index].oldPrice,
                                discountPrice: featured[index].discountPrice,
                                rating: featured[index].rating,
                                reviews: featured[index].reviews),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),

                //////////// Pagination and Feature Products ////////////

              /*  Container(
                  margin: EdgeInsets.symmetric(horizontal: 38.w),
                  child: NumberPaginator(
                    numberPages: _numPages,
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    buttonUnselectedForegroundColor: secondaryColor,
                    buttonSelectedBackgroundColor: offers,
                    onPageChange: (int index) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                const FeaturedProduct(),
                SizedBox(
                  height: 20.h,
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
