import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 150.h,
            width: 388.w,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: irisYellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.h),
                            bottomLeft: Radius.circular(10.h))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.h, top: 14.h),
                      child: Column(
                        children: [
                          Text(
                            "Up to 70% Discount to all Masala...",
                            style: CustomTextStyle.header2Bold(context)
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              print("Shop Now");
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shop now",
                                  style: CustomTextStyle.subHeader2(context)
                                      .copyWith(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(width: 16.17.w,),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.black,
                                  size: 20.w,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/img/masala.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
