import 'package:efgecom/config/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';

class ProductTile extends StatefulWidget {
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
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp), color: Colors.white),
      width: 182.w,
      child: Stack(
        children: [
          Column(
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
                      widget.imgUrl,
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
                            widget.titleEng,
                            style: CustomTextStyle.bodyText2(context),
                          ),
                          // Text(
                          //   titleBang,
                          //   style: CustomTextStyle.bodyText2(context),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.59.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tk-${widget.newPrice}/kg",
                              style: CustomTextStyle.bodySmall(context)
                                  .copyWith(
                                      color: buttonColor, fontSize: 13.5.sp),
                            ),
                            Text(
                              "Tk-${widget.oldPrice}/kg",
                              style: CustomTextStyle.linkText(context).copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.59.w,
                      ),
                      child: SizedBox(
                        //height: 14.h,
                        height: 22.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14.h,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 4.56.w),
                                Text(
                                  "${widget.rating}",
                                  style: CustomTextStyle.body(context),
                                ),
                              ],
                            ),
                            Text(
                              "${widget.reviews} Reviews",
                              style: CustomTextStyle.body(context),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
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
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Add to Cart",
                          style: CustomTextStyle.bodySmall(context).copyWith(
                              fontSize: 11.88.sp, color: Colors.white),
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
              ),
            ],
          ),
          Positioned(
            left: 150.68.w,
            top: 9.1.h,
            child: InkWell(
                onTap: () {
                  favorite = !favorite;
                  setState(() {});
                },
                child: !favorite
                    ? const Icon(
                        Icons.favorite_border_rounded,
                        color: buttonColor,
                      )
                    : const Icon(
                        Icons.favorite_rounded,
                        color: buttonColor,
                      )),
          )
        ],
      ),
    );
  }
}
