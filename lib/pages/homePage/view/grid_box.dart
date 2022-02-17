import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';

class GridTileView extends StatelessWidget {
  const GridTileView({Key? key,this.color,this.image,this.productName,this.presentPrice,this.oldPrice,this.rating,this.views,this.bangli}) : super(key: key);
  final String? image;
  final String? productName;
  final int? presentPrice;
  final int? oldPrice;
  final double? rating;
  final int? views;
  final String? bangli;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: color
      ),
      height: 262.h,
      width: 182.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              print("Pressed Column");
            },
            child: Column(
              children: [
                Image.asset(image!,height: 98.82.h,width: 148.07.w,),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.only(left: 7.59.w,right: 7.59.w),
                  child: SizedBox(
                    height: 47.h,
                    width: 170.w,
                    child: Text("$productName\n$bangli",style: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.only(left: 7.59.w,right: 28.55.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 16.h,
                      width: 138.26.w,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 3.5.w),
                            child: Text("Tk-$presentPrice/kg",style: TextStyle(color: buttonColor,fontSize: 13.5.sp,fontWeight: FontWeight.bold),),
                          ),
                          Text("Tk-$oldPrice/kg",style: TextStyle(color: Colors.grey,fontSize: 13.5.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 7.59.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 13.97.h,width: 112.93.w,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4.9.w),
                            child: Icon(Icons.star,size: 12.81.h,color: Colors.yellow,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 11.6.w),
                            child: Text("$rating",style: TextStyle(fontSize: 11.65.sp,color: secondaryColor,fontWeight: FontWeight.bold),),
                          ),
                          Text("$views Reviews",style: TextStyle(fontSize: 11.65.sp,color: secondaryColor,fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          InkWell(
            onTap: (){
              print("Cart presed");
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.w,right: 10.w,),
              child: Card(
                elevation: 0.0,
                color: buttonColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.5.w,right: 30.5.w,top: 7.h,bottom: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 11.88.sp,fontWeight: FontWeight.bold),),
                      Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 20.85.h,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
