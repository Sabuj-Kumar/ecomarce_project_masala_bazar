import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/top_banner_model.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  late List<TopBannerModel> banner;

  @override
  void initState() {
    super.initState();
    banner = [
      TopBannerModel(
          id: 0,
          title: 'পদ্মার ইলিশ এখন আপনার হাতের পাশে...',
          imgUrl: 'assets/img/hilsha.png',
          date: '12th Apr- 20th jun'),
      TopBannerModel(
          id: 1,
          title: 'All Snacks up to 70% Discount',
          imgUrl: 'assets/img/hilsha.png',
          date: '12th Apr- 20th jun'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: 150.h,
        child: CarouselSlider(
            options: CarouselOptions(
              height: _height,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              //disableCenter: true
            ),
            items: banner
                .map((item) => Container(
              padding: EdgeInsets.only(right: 15.w),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.r),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: item.imgUrl == null
                                      ? const AssetImage(
                                      'assets/img/placeholder.jpg')
                                      : AssetImage(item.imgUrl)
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 190.19.w,
                    decoration: BoxDecoration(
                        color: item.id == 0
                            ? Colors.orange.shade700
                            : Colors.pinkAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                            topRight: Radius.circular(100.r),
                            bottomRight: Radius.circular(100.r))),
                  ),
                  Container(
                    width: _width * 0.44,
                    padding: EdgeInsets.only(left: 9.11.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22.19.h,
                        ),
                        SizedBox(
                          height: 44.h,
                          width: 162.01.w,
                          child: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18.sp,
                                height: 1.2.h,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 8.81.h,
                        ),
                        Text(
                          item.date!,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.89.w),
                          child: SizedBox(
                            height: 27.h,
                            width: 100.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    primary: buttonColor,
                                    elevation: 0),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.5.w,
                                      vertical: 5.h),
                                  child: Text(
                                    'Shop now',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
                .toList()));
  }
}