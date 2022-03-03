import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_clipper.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar(
      {Key? key, required this.onClick, required this.currentPage})
      : super(key: key);

  final Function(int) onClick;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(alignment: Alignment.center, children: [
          CustomPaint(
            size: Size(width, height * 0.1125),
            painter: Clipper(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 38.h, left: 12.w),
                child: InkWell(
                  onTap: () {
                    onClick(0);
                  },
                  child: SizedBox(
                    width: width * 0.15.w,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 4.0.h, bottom: 3.0.h),
                            child: SvgPicture.asset(
                              'assets/icons/Home.svg',
                              width: 22.w,
                              height: 22.w,
                              color: currentPage != 0
                                  ? secondaryColor
                                  : buttonColor,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                color: currentPage != 0
                                    ? secondaryColor
                                    : buttonColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 38.h),
                child: InkWell(
                  onTap: () {
                    onClick(1);
                  },
                  child: SizedBox(
                    width: width * 0.15.w,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 4.0.h, bottom: 3.0.h),
                            child: SvgPicture.asset(
                              'assets/icons/message.svg',
                              width: 22.w,
                              height: 22.w,
                              color: currentPage != 1
                                  ? secondaryColor
                                  : buttonColor,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                          child: Text(
                            "Inbox",
                            style: TextStyle(
                                color: currentPage != 1
                                    ? secondaryColor
                                    : buttonColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.25,
              ),
              Padding(
                padding: EdgeInsets.only(top: 38.h),
                child: InkWell(
                  onTap: () {
                    onClick(3);
                  },
                  child: SizedBox(
                    width: width * 0.15.w,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 5.0.h, bottom: 2.0.h),
                            child: SvgPicture.asset(
                              'assets/icons/category.svg',
                              width: 22.w,
                              height: 22.w,
                              color: currentPage != 3
                                  ? secondaryColor
                                  : buttonColor,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                          child: Text("Category",
                              style: TextStyle(
                                  color: currentPage != 3
                                      ? secondaryColor
                                      : buttonColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 38.h, right: 12.w),
                child: InkWell(
                  onTap: () {
                    onClick(4);
                  },
                  child: SizedBox(
                    width: width * 0.15.w,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 5.0.h, bottom: 2.0.h),
                            child: SvgPicture.asset(
                              'assets/icons/profile_icon.svg',
                              width: 22.w,
                              height: 22.w,
                              color: currentPage != 4
                                  ? secondaryColor
                                  : buttonColor,
                            )
                            //Icon(Icons.settings_outlined,size: 25.sp,color: currentPage != 4? secondaryColor:buttonColor),
                            ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                color: currentPage != 4
                                    ? secondaryColor
                                    : buttonColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 13.h,
              child: InkWell(
                onTap: () {
                  onClick(2);
                },
                child: SizedBox(
                  width: width * 0.15.w,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 4.0.h),
                          child: SvgPicture.asset(
                            'assets/icons/cart.svg',
                            width: 40.w,
                            height: 40.w,
                            color:
                                currentPage != 2 ? secondaryColor : buttonColor,
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Cart",
                            style: TextStyle(
                                color: currentPage != 2
                                    ? secondaryColor
                                    : buttonColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              )),
        ]),
      ],
    );
  }
}
