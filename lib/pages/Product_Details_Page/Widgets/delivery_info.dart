import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryInfo extends StatelessWidget {
  DeliveryInfo({Key? key}) : super(key: key);
  List<String> images = [
    "assets/icons/track.svg",
    "assets/icons/dollarHand.svg",
    "assets/icons/badge.svg",
    "assets/icons/phoneCall24hours.svg",
  ];
  List<String> songLyrics = [
    "Guro Ghor banaila Ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya",
    "Guro Ghor banaila Ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya",
    "Guro Ghor banaila Ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya",
    "Guro Ghor banaila Ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya",
  ];
  String deliveryTime = "2 - 3 Days";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 35.h),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/map-pin.svg',
                        color: secondaryColor, height: 18.h, width: 15.w),
                    SizedBox(width: 10.w),
                    Text("Your selected location:\n",
                        style: CustomTextStyle.subHeader2(context)
                            .copyWith(color: fuschiaText)),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    print("Change pressed");
                  },
                  child: Text("Change",
                      style: CustomTextStyle.subHeader2(context)
                          .copyWith(color: fuschiaBlueGem)))
            ]),
        SvgPicture.asset('assets/icons/DeliveryCar.svg',
            height: 35.h, width: 65.w),
        SizedBox(height: 15.h),
        Center(
            child: Text("Estimated delivery time",
                style: CustomTextStyle.subHeader2(context)
                    .copyWith(color: fuschiaText))),
        Center(
            child: Text(deliveryTime,
                style: CustomTextStyle.subHeader2(context)
                    .copyWith(color: fuschiaText, fontSize: 18.sp,fontWeight: FontWeight.w600))),
        SizedBox(height: 25.h),
        RichText(
            text: TextSpan(
                text: "What",
                style: CustomTextStyle.header2Bold(context)
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                children: [
              TextSpan(
                  text: "   Masala",
                  style: CustomTextStyle.header2Bold(context)
                      .copyWith(color: fuschiaRed)),
              TextSpan(
                  text: "bazaar",
                  style: CustomTextStyle.header2Bold(context).copyWith(
                      color: fuschiaBlueGem,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                text: "   Offer!",
                style: CustomTextStyle.header2Bold(context).copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 16.sp),
              )
            ])),
        SizedBox(height: 15.h),
        SizedBox(
          height: 300.h,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4.h,
              crossAxisSpacing: 4.w,
              childAspectRatio: 8.h / 5.w,
            ),
            itemBuilder: (context, index) {
              return Center(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(images[index],
                            height: 23.h, width: 35.w),
                        Text("24/7 Support",
                            style: CustomTextStyle.subHeader1(context)
                                .copyWith(fontSize: 14.sp,color: fuschiaText)),
                        Text(songLyrics[index],
                            style: CustomTextStyle.linkText(context).copyWith(color: fuschiaText),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
