import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/photos_with_cupartino_dialogs.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/product_details_personal_reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reviews extends StatelessWidget {
  Reviews({Key? key, this.reviews, this.rating,this.percentages}) : super(key: key);
  final double? rating;
  final int? reviews;
  final List<int>? percentages;
  double _height = 0.0;
  double _width = 0.0;
  List<String> imageList = [
    "assets/img/bakery.png",
    "assets/img/hilsha.png",
    "assets/img/katla.png",
    "assets/img/meat.png",
    "assets/img/shrimp.png",
    "assets/img/masala.png",
    "assets/img/Snacks.png",
    "assets/img/mbOnline.png",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    _height = height;
    _width = width;
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Rating & Reviews",
              style: CustomTextStyle.bodyText2(context).copyWith(
                  color: fuschiaRed,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 142.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "$rating",
                              style: CustomTextStyle.header1(context).copyWith(
                                  color: fuschiaText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                              children: [
                                TextSpan(
                                  text: '/5',
                                  style: CustomTextStyle.header1(context)
                                      .copyWith(
                                          color: fuschiaText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp),
                                )
                              ]),
                        ),
                        Text(
                          "$reviews Reviews",
                          style: CustomTextStyle.subHeader2(context).copyWith(
                              color: fuschiaText,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    height: 110.h,
                    width: 0.2.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int len = 5, len2 = 0; len > 0; len--, len2++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: List.generate(
                                        len,
                                        (index) => Icon(Icons.star,
                                            size: 18.h, color: irisYellow)),
                                  ),
                                  Row(
                                    children: List.generate(
                                        len2,
                                        (index) => Icon(Icons.star_border,
                                            size: 18.h, color: textLight)),
                                  )
                                ],
                              ),
                            ],
                          )
                      ],
                    ),
                  ),//star print
                  Column(
                    children: List.generate(
                      percentages!.length,
                      (index) => Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                Container(
                                    color: Colors.black.withOpacity(0.2),
                                    height: 2.h,
                                    width: 123.w),
                                LayoutBuilder(builder:  (context,constrains) => Container(
                                  width: 123.w * (percentages![index] / 100.0),
                                  height: 2.h,
                                  color: Colors.yellow,
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          5,
                          (index) => Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0.w, right: 20.w),
                                child: Text(
                                  "${percentages![index]}",
                                  style: CustomTextStyle.subHeader2(context)
                                      .copyWith(
                                          color: fuschiaText,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                ),
                              )))
                ],
              ),
            ),
            Text(
              "Photos",
              style: CustomTextStyle.subHeader1(context).copyWith(
                  color: fuschiaRed,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(height: 20.h),
            DialogWithPhotos(
              imageList: imageList,
              imageWidth: 90.w,
              imageHeight: 90.h,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            SizedBox(height: 20.h),
            Text(
              "Reviews",
              style: CustomTextStyle.subHeader2(context).copyWith(
                  color: fuschiaRed,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Column(
              children: List.generate(5, (index) => PersonComments(
                location: "House Building Uttora, Dhaka",
                profileImage: "assets/img/mbOnline.png",
                rating: rating,
                comments: "Guru ghor banaila ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya.",
                imagesUrl: imageList,

              ),)
            )
          ],
        ),
      ],
    );
  }
}
