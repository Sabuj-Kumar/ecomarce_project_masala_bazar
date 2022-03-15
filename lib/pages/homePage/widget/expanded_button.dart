import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../../../models/featured_product_model.dart';
import '../../../providers/cart_provider.dart';

class ExpandedButton extends StatefulWidget {
  final int productId;
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final double newPrice;
  final double oldPrice;
  final double? discountPrice;
  final double rating;
  final int reviews;

  ExpandedButton(
      {Key? key,
        required this.productId,
        required this.imgUrl,
        required this.titleBang,
        required this.titleEng,
        required this.newPrice,
        required this.oldPrice,
        this.discountPrice,
        required this.rating,
        required this.reviews})
      : super(key: key);

  @override
  _ExpandedButtonState createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<ExpandedButton> {
  int? itemCount;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    itemCount = context.watch<CartProvider>().getItemCount(widget.productId);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        height: 28.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(buttonCurve.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (itemCount == 1) {
                      cart.deleteFromCart(FeaturedProductModel(
                          productId: widget.productId,
                          imgUrl: widget.imgUrl,
                          titleBang: widget.titleBang,
                          titleEng: widget.titleEng,
                          newPrice: widget.newPrice,
                          oldPrice: widget.oldPrice,
                          rating: widget.rating,
                          reviews: widget.reviews));
                    }
                    cart.removeQuantity(FeaturedProductModel(
                        productId: widget.productId,
                        imgUrl: widget.imgUrl,
                        titleBang: widget.titleBang,
                        titleEng: widget.titleEng,
                        newPrice: widget.newPrice,
                        oldPrice: widget.oldPrice,
                        rating: widget.rating,
                        reviews: widget.reviews));
                    cart.minusTotalPrice(widget.newPrice);
                  });
                },
                child: Icon(
                  Icons.remove_circle_outline,
                  size: 22.h,
                  color: Colors.white,
                )),
            Row(
              children: [
                Text(
                  '$itemCount in Bag',
                  style: CustomTextStyle.bodySmall(context)
                      .copyWith(fontSize: 11.88.sp, color: Colors.white),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SvgPicture.asset(
                  'assets/icons/cart.svg',
                  height: 20.h,
                  width: 20.h,
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    cart.addToCart(FeaturedProductModel(
                        productId: widget.productId,
                        imgUrl: widget.imgUrl,
                        titleBang: widget.titleBang,
                        titleEng: widget.titleEng,
                        newPrice: widget.newPrice,
                        oldPrice: widget.oldPrice,
                        rating: widget.rating,
                        reviews: widget.reviews));
                    log('cart length: ${cart.cartCount}');
                    log('item count: ${cart.itemCount}');
                    cart.addTotalPrice(widget.newPrice);
                  });
                },
                child: Icon(
                  Icons.add_circle_outline,
                  size: 22.h,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}