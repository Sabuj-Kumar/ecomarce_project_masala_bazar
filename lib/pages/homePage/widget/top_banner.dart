import 'package:carousel_slider/carousel_slider.dart';
import 'package:efgecom/config/custom_text_style.dart';
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
                                      Radius.circular(bannerTileCurve.r),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(item.imgUrl),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 190.19.w,
                            decoration: BoxDecoration(
                                color: item.id == 0
                                    ? offers
                                    : fuschiaBlueGem,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    bottomLeft: Radius.circular(15.r),
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
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 64.h,
                                  width: 162.01.w,
                                  child: Center(
                                    child: Text(item.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            CustomTextStyle.header2Semi(context)
                                                .copyWith(
                                          fontSize: 18.sp,
                                          height: 1.8.h,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  item.date!,
                                  style: CustomTextStyle.body(context)
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40.89.w),
                                  child: SizedBox(
                                    height: 28.h,
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
                                          ),
                                          child: Text(
                                            'Shop now',
                                            style: CustomTextStyle.subHeader2(
                                                    context)
                                                .copyWith(color: Colors.white),
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
