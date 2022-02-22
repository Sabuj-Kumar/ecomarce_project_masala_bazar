import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';

class ProductTile extends StatelessWidget {
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final int newPrice;
  final int oldPrice;
  final double rating;
  final int reviews;

  const ProductTile(
      {Key? key,
      required this.imgUrl,
      required this.titleBang,
      required this.titleEng,
      required this.newPrice,
      required this.oldPrice,
      required this.rating,
      required this.reviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
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
                  imgUrl,
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
                        titleEng,
                        style: text.headline2?.copyWith(fontSize: 12.sp, color: secondaryColor),
                      ),
                      Text(
                        titleBang,
                        style: text.headline2?.copyWith(fontSize: 12.sp, color: secondaryColor),
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
                          "Tk-$newPrice/kg",
                          style: text.headline3?.copyWith(
                            fontSize: 13.5.sp,
                          ),
                        ),
                        SizedBox(
                          width: 4.26.w,
                        ),
                        Text(
                          "Tk-$oldPrice/kg",
                          style: text.headline3?.copyWith(
                              fontSize: 13.5.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
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
                          "$rating",
                          style: text.subtitle2?.copyWith(
                            fontSize: 11.64.sp,
                            color: secondaryColor,
                          ),
                        ),
                        SizedBox(width: 11.64.w),
                        Text(
                          "$reviews Reviews",
                          style: text.subtitle2?.copyWith(
                            fontSize: 11.64.sp,
                            color: secondaryColor,
                          ),
                        )
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Add to Cart",
                    style: text.headline2?.copyWith(
                      color: Colors.white,
                      fontSize: 11.88.sp,
                    ),
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
}
