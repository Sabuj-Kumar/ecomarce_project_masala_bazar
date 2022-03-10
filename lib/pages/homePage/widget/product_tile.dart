import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../components/layers/offer_layer.dart';
import '../../../config/theme_config.dart';
import '../../Product_Details_Page/Pages/product_details_main_page.dart';
import '../../cart_page/widgets/cart_list.dart';

class ProductTile extends StatefulWidget {
  final String imgUrl;
  final String titleBang;
  final String titleEng;
  final double newPrice;
  final double oldPrice;
  final double? discountPrice;
  final double rating;
  final int reviews;

  const ProductTile(
      {Key? key,
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
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    int totalCount = 0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(productTileCurve.r),
          color: Colors.white),
      width: 182.w,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      ProductDetailsPage(
                        productNameEng: widget.titleEng,
                        productNameBng: widget.titleBang,
                        oldPrice: widget.oldPrice,
                        newPrice: widget.newPrice,
                        rating: widget.rating,
                        reviews: widget.reviews,
                      )));
                },
                child: Column(
                  children: [
                    Container(
                      height: 125.h,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(182.w, 125.h),
                            painter: OfferLayer(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Center(
                              child: Image.asset(
                                widget.imgUrl,
                                scale: 1.6.r,
                                // height: 98.2.h,
                                // width: 148.07.w,
                              ),
                            ),
                          ),
                          Container(
                            height: 19.h,
                            width: 57.w,
                            margin: EdgeInsets.only(left: 4.31.w, top: 7.91.h),
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius:
                                    BorderRadius.circular(productTileCurve.r)),
                            child: Center(
                              child: Text(
                                '${widget.discountPrice?.toInt()} Tk off',
                                style: CustomTextStyle.linkText(context).copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.59.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 25.w),
                            height: 40.h,
                            child: Text(
                              widget.titleEng,
                              style: CustomTextStyle.bodyText2(context)
                                  .copyWith(color: fuschiaText),
                            ),
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
                          children: [
                            Text(
                              "Tk-${widget.oldPrice}/kg",
                              style: CustomTextStyle.linkText(context).copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Tk-${widget.newPrice}/kg",
                              style: CustomTextStyle.bodySmall(context)
                                  .copyWith(
                                      color: buttonColor, fontSize: 14.sp),
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
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ratings.svg',
                              width: 80.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "(${widget.reviews})",
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
                  onPressed: () {
                    cart.addCounter();
                    cart.addCartList(ListOfCarts(
                      images: widget.imgUrl,
                      productName: widget.titleEng,
                      oldPrice: widget.oldPrice,
                      newPrice: widget.newPrice,
                      deliveryDate: "Arrive by 2030 to 2040 hehe",
                      offerPercentages: -10,
                    ));
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
                          style: CustomTextStyle.bodySmall(context).copyWith(
                              fontSize: 11.88.sp, color: Colors.white),
                        ),
                        SvgPicture.asset(
                          'assets/icons/cart.svg',
                          height: 20.h,
                        ),
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
