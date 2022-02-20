import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_clipper.dart';

class NavigationBBar extends StatelessWidget {
  const NavigationBBar({Key? key,required this.onClick,required this.currentPage}) : super(key: key);

  final Function(int) onClick;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print("Height $height");
    print(width);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: CustomClipperDown(),
                child: Container(
                  height: height * 0.1125,
                  width: width * 0.932,
                  decoration:  BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                    border: Border.all(color: Colors.amberAccent),

                  ),
                ),
              ),
              Positioned(
                top: 3.2.sp,
                child: ClipPath(
                  clipper: CustomClipperUp(),
                  child: Container(
                    height: height * 0.1075,
                    width: width * 0.93,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  const BorderRadius.all(Radius.circular(13.0)),
                      border: Border.all(color: Colors.amberAccent),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 38.h,left: 12.w),
                    child: InkWell(
                      onTap: (){
                        onClick(0);
                      },
                      child: Column(
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0.h,bottom: 3.0.h),
                            child: SvgPicture.asset('assets/icons/home.svg', width: 22.w, height: 22.w, color:  currentPage != 0? secondaryColor:buttonColor,)
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                            child: Text("Home",style: TextStyle(color:  currentPage != 0? secondaryColor:buttonColor,fontSize: 11.sp, fontWeight: FontWeight.w500),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015.w,),
                  Padding(
                    padding:  EdgeInsets.only(top: 38.h),
                    child: InkWell(
                      onTap: (){
                        onClick(1);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0.h,bottom: 3.0.h),
                            child: SvgPicture.asset('assets/icons/message.svg', width: 22.w, height: 22.w, color:  currentPage != 1? secondaryColor:buttonColor,)
                          ),
                           Padding(
                            padding: EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                            child: Text("Inbox",style: TextStyle(color:  currentPage != 1? secondaryColor:buttonColor,fontSize: 11.sp, fontWeight: FontWeight.w500),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.25,),
                  Padding(
                    padding:  EdgeInsets.only(top: 38.h),
                    child: InkWell(
                      onTap: (){
                        onClick(3);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0.h,bottom: 2.0.h),
                            child: SvgPicture.asset('assets/icons/shopping-cart.svg', width: 22.w, height: 22.w, color:  currentPage != 3? secondaryColor:buttonColor,)
                          ),
                           Padding(
                            padding: EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                            child: Text("Cart",style: TextStyle(color:  currentPage != 3? secondaryColor:buttonColor,fontSize: 11.sp, fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015.w,),
                  Padding(
                    padding:  EdgeInsets.only(top: 38.h, right: 12.w),
                    child: InkWell(
                      onTap: (){
                        onClick(4);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0.h,bottom: 2.0.h),
                            child: SvgPicture.asset('assets/icons/profile.svg', width: 22.w, height: 22.w, color:  currentPage != 4? secondaryColor:buttonColor,)
                            //Icon(Icons.settings_outlined,size: 25.sp,color: currentPage != 4? secondaryColor:buttonColor),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                            child: Text("Profile",style: TextStyle(color:  currentPage != 4? secondaryColor:buttonColor,fontSize: 11.sp, fontWeight: FontWeight.w500),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 20.h,
                  child: InkWell(
                    onTap: (){
                      onClick(2);
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4.0.h),
                          child: SvgPicture.asset('assets/icons/search_icon.svg', width: 30.w, height: 30.w, color:  currentPage != 2? secondaryColor:buttonColor,)
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("Search",style: TextStyle(color: currentPage != 2? secondaryColor:buttonColor,fontSize: 11.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )),
            ]
        ),
      ],
    );
  }
}

