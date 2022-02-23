import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              CustomPaint(
                size: Size(width,height * 0.1125),
                painter: Clipper(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 33.w,left: 12.w),
                    child: InkWell(
                      onTap: (){
                        onClick(0);
                      },
                      child: Column(
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0.w,bottom: 3.0.w),
                            child: Icon(Icons.home_outlined,size: 25.sp,color:  currentPage != 0? const Color(0xff21305A):primaryColor),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 0.5.w,bottom: 0.5.w),
                            child: Text("HOME",style: TextStyle(color:  currentPage != 0? const Color(0xff21305A):primaryColor,fontSize: 11.sp,),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015.h,),
                  Padding(
                    padding:  EdgeInsets.only(top: 30.sp),
                    child: InkWell(
                      onTap: (){
                        onClick(1);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0.w,bottom: 3.0.w),
                            child: Icon(Icons.messenger_outline,size: 25.sp,color: currentPage != 1? const Color(0xff21305A):primaryColor),
                          ),
                           Padding(
                            padding: EdgeInsets.only(top: 0.5.w,bottom: 0.5.w),
                            child: Text("INBOX",style: TextStyle(color:  currentPage != 1? const Color(0xff21305A):primaryColor,fontSize: 11.sp),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.25,),
                  Padding(
                    padding:  EdgeInsets.only(top: 30.w),
                    child: InkWell(
                      onTap: (){
                        onClick(3);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0.w,bottom: 2.0.w),
                            child: Icon(Icons.shopping_cart_outlined,size: 25.h,color: currentPage != 3? const Color(0xff21305A):primaryColor),
                          ),
                           Padding(
                            padding: EdgeInsets.only(top: 0.5.w,bottom: 0.5.w),
                            child: Text("CART",style: TextStyle(color:  currentPage != 3? const Color(0xff21305A):primaryColor,fontSize: 11.sp,)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015.w,),
                  Padding(
                    padding:  EdgeInsets.only(top: 30.w,right: 15.w),
                    child: InkWell(
                      onTap: (){
                        onClick(4);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0.w,bottom: 3.0.w),
                            child: Icon(Icons.settings_outlined,size: 25.sp,color: currentPage != 4? secondaryColor:primaryColor),
                          ),
                          Text("PROFILE",style: TextStyle(color:  currentPage != 4? const Color(0xff21305A):primaryColor,fontSize: 11.sp),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 12.sp,
                  child: InkWell(
                    onTap: (){
                      onClick(2);
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4.0.w),
                          child: Icon(Icons.search_outlined,size: 40.w,color:  currentPage != 2? const Color(0xff21305A):primaryColor,),
                        ),
                        Text("SEARCH",style: TextStyle(color: currentPage != 2? const Color(0xff21305A):primaryColor,fontSize: 11.sp,)),
                      ],
                    ),
                  )),
            ]
        ),
      ],
    );
  }
}

