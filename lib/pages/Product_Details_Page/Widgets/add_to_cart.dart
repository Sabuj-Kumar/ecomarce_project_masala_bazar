import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key, this.newPrice, this.oldPrice}) : super(key: key);
  final double? newPrice;
  final double? oldPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w, right: 20.w, bottom: 20.h),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: irisOrange)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Tk-${newPrice!}/kg",
                    style: CustomTextStyle.bodyText2(context).copyWith(
                        color: fuschiaRed,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Tk-${oldPrice!}/kg",
                    style: CustomTextStyle.bodyText2(context).copyWith(
                        color: textLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.5,
                  primary: irisYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)
                  )
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Add to Cart",
                      style: CustomTextStyle.bodyText2(context).copyWith(
                          color: fuschiaText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      "assets/icons/cart.svg",
                      color: Colors.black,
                    )
                  ],
                )),
            SizedBox(width: 5.w),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: fuschiaRed,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)
                    )),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Buy Now",
                      style: CustomTextStyle.bodyText2(context).copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10.w),
                    const Icon(Icons.shopping_cart_outlined,size: 20)
                  ],
                )),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
