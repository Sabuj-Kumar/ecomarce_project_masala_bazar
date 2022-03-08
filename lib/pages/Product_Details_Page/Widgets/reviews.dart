import 'package:carousel_slider/carousel_slider.dart';
import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reviews extends StatelessWidget {
  Reviews({Key? key, this.reviews, this.rating}) : super(key: key);
  final double? rating;
  final int? reviews;
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
            SizedBox(height: 24.h),
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
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) => Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                color: Colors.black.withOpacity(0.2),
                                height: 2.h,
                                width: 123.w),
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
                                  "$index",
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
            SizedBox(height: 15.h),
            imageList.length > 3
                ? imageRowAllImages(context)
                : imageRowLessThenFour(),

          ],
        ),
      ],
    );
  }

  Widget imageRowLessThenFour() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            3,
            (index) => Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: fuschiaRed, width: 1.w),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: ClipRRect(
                    child: Image.asset(
                      imageList[index],
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                )));
  }

  Widget imageRowAllImages(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            3,
            (index) => Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: fuschiaRed, width: 1.w),
                      borderRadius: BorderRadius.circular(11.r)),
                  child: ClipRRect(
                    child: index == 2
                        ? InkWell(
                            onTap: () {
                              showCupertinoDialog(
                                barrierDismissible: true,
                                  context: context, builder: createDialog);
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  imageList[index],
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  height: 90.h,
                                  width: 90.w,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Center(
                                    child: Text(
                                  "+ ${imageList.length}",
                                  style: CustomTextStyle.subHeader2(context)
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                ))
                              ],
                            ))
                        : Image.asset(
                            imageList[index],
                            fit: BoxFit.fill,
                          ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                )));
  }

  Widget createDialog(BuildContext context) => CupertinoAlertDialog(
        content: SizedBox(
          height: _height * 0.5.h,
          width: _width,
          child: CarouselSlider(
            items: imageList
                .map((item) => Builder(builder: (ctx) => ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(item,fit: BoxFit.fill,))))
                .toList(),
            options: CarouselOptions(
              //height: _height * 0.6.h,
              initialPage: 0,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
          ),
        ),
      );
}
