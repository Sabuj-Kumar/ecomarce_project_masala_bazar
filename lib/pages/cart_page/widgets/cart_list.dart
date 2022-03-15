import 'dart:convert';
import 'dart:developer';

import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/models/featured_product_model.dart';
import 'package:efgecom/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/cart_provider.dart';

class ListOfCarts extends StatefulWidget {
     ListOfCarts(
      {Key? key,
      this.images,
      this.deliveryDate,
      this.oldPrice,
      this.newPrice,
      this.productNameBng,
        this.productNameEng,
      this.offerPercentages,
         required this.productId,
        this.reviews,
        this.rating
        })
      : super(key: key);
  final String? images;
  final String? deliveryDate;
  final String? productNameBng;
  final String? productNameEng;
  final double? oldPrice;
  final double? newPrice;
  final double? offerPercentages;
  final int productId;
  final double? rating;
  final int? reviews;
  @override
  _ListOfCartsState createState() => _ListOfCartsState();
}

class _ListOfCartsState extends State<ListOfCarts> {
  int? quantity;
  bool isChecked = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    quantity = context.watch<CartProvider>().getItemCount(widget.productId);
    final lng = Provider.of<LanguageProvider>(context);
    return SizedBox(
        height: 125.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        side: const BorderSide(color: fuschiaBlueGem),
                        checkColor: fuschiaRed,
                        fillColor: MaterialStateProperty.all(Colors.grey),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: SizedBox(
                          height: 84.h,
                          width: 84.w,
                          child: Image.asset(widget.images!, fit: BoxFit.fill)),
                    ),
                  ],
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: SizedBox(
                    height: 90.h,
                    width: 120.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        lng.languageCode =='en' ? Text(
                          "${widget.productNameBng}",
                          style: CustomTextStyle.subHeader2(context).copyWith(
                              color: fuschiaBlueGem,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ):Text(
                          "${widget.productNameEng}",
                          style: CustomTextStyle.subHeader2(context).copyWith(
                              color: fuschiaBlueGem,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("TK-${widget.newPrice}",
                                style: CustomTextStyle.subHeader2(context)
                                    .copyWith(
                                        color: fuschiaBlueGem,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700)),
                            Text("TK-${widget.oldPrice}",
                                style: CustomTextStyle.subHeader2(context)
                                    .copyWith(
                                        color: extraGrey,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        decoration:
                                            TextDecoration.lineThrough)),
                          ],
                        ),
                        Text("${widget.offerPercentages}",
                            style: CustomTextStyle.subHeader2(context).copyWith(
                                color: fuschiaRed,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          pressed = !pressed;
                        });
                      },
                      icon: pressed
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border)),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/icons/shipping.svg"),
                Text(
                  "${widget.deliveryDate}",
                  style: CustomTextStyle.subHeader2(context).copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Qty",
                      style: CustomTextStyle.subHeader2(context).copyWith(
                          color: fuschiaBlueGem,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 3.w),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey, width: 1.h)),
                      width: 80.w,
                      height: 25.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: quantity! > 1?() {
                                setState(() {
                                  cart.removeQuantity(FeaturedProductModel(
                                      productId: widget.productId,
                                      imgUrl: widget.images!,
                                      titleBang: widget.productNameBng!,
                                      titleEng: widget.productNameEng!,
                                      newPrice: widget.newPrice!,
                                      oldPrice: widget.oldPrice!,
                                      rating: widget.rating!,
                                      reviews: widget.reviews!));
                                  cart.minusTotalPrice(widget.newPrice!);
                                });
                              }: null,
                              child: const Icon(Icons.remove,
                                  size: 15, color: fuschiaBlueGem)),
                          Text("$quantity",
                              style: CustomTextStyle.subHeader2(context)
                                  .copyWith(
                                      color: fuschiaBlueGem,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp)),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  cart.addToCart(
                                      FeaturedProductModel(
                                          productId: widget.productId,
                                          imgUrl: widget.images!,
                                          titleBang: widget.productNameBng!,
                                          titleEng: widget.productNameEng!,
                                          newPrice: widget.newPrice!,
                                          oldPrice: widget.oldPrice!,
                                          rating: widget.rating!,
                                          reviews: widget.reviews!)
                                  );
                                  cart.addTotalPrice(widget.newPrice!);

                                }
                                );
                              },
                              child: const Icon(Icons.add,
                                  size: 15, color: fuschiaBlueGem))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
