import 'package:carousel_slider/carousel_slider.dart';
import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogWithPhotos extends StatelessWidget {
   DialogWithPhotos({Key? key,this.imageList,this.imageHeight,this.imageWidth,this.mainAxisAlignment}) : super(key: key);
   final List<String>? imageList;
   final double? imageHeight;
   final double? imageWidth;
   final MainAxisAlignment? mainAxisAlignment;
   double _height = 0;
   double _width = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    _height = height;
    _width = _width;
    return imageList!.length > 3
        ? imageRowAllImages(context)
        : imageRowLessThenFour();
  }
  Widget imageRowLessThenFour() {
    return Row(
        mainAxisAlignment: mainAxisAlignment!,
        children: List.generate(
            3,
                (index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
              height: imageHeight!.h,
              width: imageWidth!.w,
              decoration: BoxDecoration(
                    border: Border.all(color: fuschiaRed, width: 1.w),
                    borderRadius: BorderRadius.circular(10.r)),
              child: ClipRRect(
                  child: Image.asset(
                    imageList![index],
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
              ),
            ),
                )));
  }

  Widget imageRowAllImages(BuildContext context) {
    return Row(
        mainAxisAlignment: mainAxisAlignment!,
        children: List.generate(
            3,
                (index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
              height: imageHeight!.h,
              width: imageWidth!.w,
              decoration: BoxDecoration(
                    border: Border.all(color: fuschiaRed, width: 1.w),
                    borderRadius: BorderRadius.circular(11.r)),
              child: ClipRRect(
                  child: index == 2
                      ? InkWell(
                      onTap: () {
                        showCupertinoDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: createDialog);
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            imageList![index],
                            fit: BoxFit.fill,
                          ),
                          Container(
                            height: 90.h,
                            width: 90.w,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Center(
                              child: Text(
                                "+ ${imageList!.length}",
                                style: CustomTextStyle.subHeader2(context)
                                    .copyWith(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ))
                      : Image.asset(
                    imageList![index],
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
              ),
            ),
                )));
  }

  Widget createDialog(BuildContext context) => CupertinoAlertDialog(
    content: SizedBox(
      height: _height * 0.5.h,
      width: _width,
      child: CarouselSlider(
        items: imageList!
            .map((item) => Builder(
            builder: (ctx) => ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ))))
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
