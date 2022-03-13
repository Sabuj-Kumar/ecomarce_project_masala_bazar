import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

class ListOfCarts extends StatefulWidget {
     ListOfCarts(
      {Key? key,
      this.images,
      this.deliveryDate,
      this.oldPrice,
      this.newPrice,
      this.productName,
      this.offerPercentages,
        this.individualItemCount})
      : super(key: key);
  final String? images;
  final String? deliveryDate;
  final String? productName;
  final double? oldPrice;
  final double? newPrice;
  final double? offerPercentages;
  int? individualItemCount = 0;
  @override
  _ListOfCartsState createState() => _ListOfCartsState();
}

class _ListOfCartsState extends State<ListOfCarts> {
  bool isChecked = false;
  bool pressed = false;
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SizedBox(
        height: 125.h,
        width: 430.w,
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
                        Text(
                          "${widget.productName}",
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
                              onTap: () {
                                /*setState(() {
                                  if (counter > 1) {
                                    counter--;
                                    widget.individualItemCount = counter;
                                    cart.removeCounter();
                                  }
                                });*/
                              },
                              child: const Icon(Icons.remove,
                                  size: 15, color: fuschiaBlueGem)),
                          Text("$counter",
                              style: CustomTextStyle.subHeader2(context)
                                  .copyWith(
                                      color: fuschiaBlueGem,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp)),
                          InkWell(
                              onTap: () {
                                /*setState(() {
                                  counter++;
                                  widget.individualItemCount = counter;
                                  cart.addCounter();
                                });*/
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
