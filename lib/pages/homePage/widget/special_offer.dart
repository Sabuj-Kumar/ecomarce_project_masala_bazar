
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';
import '../../../models/top_banner_model.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  late List<TopBannerModel> banner;

  @override
  void initState() {
    super.initState();
    banner = [
      TopBannerModel(
          id: 0,
          title: '23% off in all snacks products',
          imgUrl: 'assets/neccesary_images/Snacks.png',
          color: const Color(0xffFF9A3E),
          bodyText: "Shop Now"),
      TopBannerModel(
          id: 1,
          title: '23% off in all snacks products',
          imgUrl: 'assets/neccesary_images/Snacks.png',
          color: const Color(0xffFF4485),
          bodyText: "Shop Now"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Spacial Offers',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: buttonColor,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('See All', style: TextStyle(fontSize: 12.sp))),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 155.h,
          child: CarouselSlider(
              options: CarouselOptions(
                height: _height,
                viewportFraction: 0.9,
                enableInfiniteScroll: false,
                //disableCenter: true
              ),
              items: banner
                  .map((item) => Container(
                height: 400.h,
                width: 386.w,
                //color: Colors.green,
                padding: EdgeInsets.only(right: 15.w),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.r),
                      ),
                      color: item.color,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 19.37.w),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    print("Shop Now");
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(item.bodyText.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 18.sp),)
                                  ),
                                ),
                                ClipRRect(

                                  child: Image.asset("assets/img/Snacks.png"),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ))
                  .toList()),
        ),
      ],
    );
  }
}