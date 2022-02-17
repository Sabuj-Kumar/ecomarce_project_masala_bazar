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
                    fontWeight: FontWeight.w500),
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
        SizedBox(height: 10.h,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
          height: 275.h,
          child: ListView.separated(
              separatorBuilder: (context, index){
                return SizedBox(width: 24.w,);
              },
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp), color: Colors.white),
                  width: 182.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print("Pressed Column");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 14.29.h,
                            ),
                            Image.asset(
                              featured[index].imgUrl,
                              height: 98.2.h,
                              width: 148.07.w,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.59.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    featured[index].titleEng,
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  Text(
                                    featured[index].titleBang,
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.59.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "Tk-${featured[index].newPrice}/kg",
                                      style: TextStyle(
                                          color: buttonColor,
                                          fontSize: 13.5.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 4.26.w,),
                                    Text("Tk-${featured[index].oldPrice}/kg",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.5.sp,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.lineThrough)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.59.w),
                              child: SizedBox(
                                height: 14.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 14.h,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(width: 4.56.w),
                                    Text(
                                      "${featured[index].rating}",
                                      style: TextStyle(
                                          fontSize: 11.64.sp,
                                          color: secondaryColor,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    SizedBox(width: 11.64.w),
                                    Text("${featured[index].reviews} Reviews",
                                        style: TextStyle(
                                            fontSize: 11.64.sp,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w400
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7.h),
                      SizedBox(
                        height: 28.h,
                        width: 160.w,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Add to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.88.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 20.85.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}