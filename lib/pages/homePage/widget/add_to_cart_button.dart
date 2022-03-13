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

class AddToCartButton extends StatefulWidget {
  final int productId;
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final double newPrice;
  final double oldPrice;
  final double? discountPrice;
  final double rating;
  final int reviews;

  AddToCartButton(
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
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SizedBox(
      height: 28.h,
      width: 160.w,
      child: ElevatedButton(
        onPressed: () {
          //cart.addCounter();
          setState(() {
            cart.addToCart(FeaturedProductModel(
                productId: widget.productId,
                imgUrl: widget.imgUrl,
                titleBang: widget.titleBang,
                titleEng: widget.titleEng,
                newPrice: widget.newPrice,
                oldPrice: widget.oldPrice,
                rating: widget.rating,
                reviews: widget.reviews,
                quantity: 1));
            log('cart length: ${cart.cartCount}');
            cart.addTotalPrice(widget.newPrice);
          });
        },
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(productTileCurve.r),
            )),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Add to Cart",
                style: CustomTextStyle.bodySmall(context)
                    .copyWith(fontSize: 11.88.sp, color: Colors.white),
              ),
              SvgPicture.asset(
                'assets/icons/cart.svg',
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}