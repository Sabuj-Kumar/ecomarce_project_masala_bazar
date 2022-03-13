import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key, this.percentageOfOffer}) : super(key: key);
  final double? percentageOfOffer;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Offers",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: fuschiaRed)),
          ),
        ),
        Container(
          height: 120.h,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 54.7.w),
                  Text("Buy 1 Get 1 free",
                      style: TextStyle(
                          color: fuschiaRed,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 54.7.w),
                  Text("Available on 1 quantity",
                      style: TextStyle(
                          color: fuschiaText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 42.h,
                width: width * 0.9.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: textLight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              "assets/icons/start_around_percentage.svg",
                              height: 14.h,
                              width: 14.w),
                          Text(
                            "  $percentageOfOffer% OFF on First order",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: fuschiaRed),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: fuschiaRed,
                        size: 15.h
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
