import 'package:efgecom/components/textfields/custom_input_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';
import 'grid_box.dart';

class HomePageDesign extends StatelessWidget {
  const HomePageDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 387.w,
            height: 19.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Product",
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                InkWell(
                    onTap: () {
                      print("pressed");
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 285.h,
            width: 390.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              key: UniqueKey(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.h),
                  ),
                  elevation: 0.8,
                  color: Colors.white,
                  child: const GridTileView(
                    color: Colors.white,
                    image: "assets/neccesary_images/katla_fish.png",
                    productName: "Katla Fish processing(Big Size)",
                    bangli: "কাতলা মাছ প্রসেসিং(বড় মাছ)",
                    presentPrice: 200,
                    oldPrice: 300,
                    rating: 4.6,
                    views: 86,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 150.h,
            width: 388.w,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.h),
                            bottomLeft: Radius.circular(10.h))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.h, top: 14.h),
                      child: Column(
                        children: [
                          Text(
                            "Up to 70% Discount to all Masala...",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              print("Shop Now");
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shop now",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      letterSpacing: 1
                                    ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/neccesary_images/unsplash_uaHShoIDGeo.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          FlashDeals(),
        ],
      ),
    );
  }
}

//Text("Up to 70% Discount to all Masala...",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp),),
//"assets/neccesary_images/unsplash_uaHShoIDGeo.png"
class FlashDeals extends StatelessWidget {
  FlashDeals({Key? key,this.text,}) : super(key: key);
  final String? text;

  List<String> time= [
    "Days",
    "Hours",
    "Minutes",
    "Seconds"
  ];
  List<String> value =[
    "15",
    "05",
    "25",
    "25"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Flash Deals",
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            InkWell(
                onTap: () {
                  print("pressed");
                },
                child: Text(
                  "See All",
                  style: TextStyle(color: Colors.red.withOpacity(0.8), fontSize: 12.sp),
                )),
          ],
        ),
        RichText(
          text: TextSpan(
            children:[
              TextSpan(
                text: "Hurry Up!  ",
                style: TextStyle(color: buttonColor,fontSize: 14.sp,fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Offer ends in:",
                style: TextStyle(color: buttonColor.withOpacity(0.5),fontSize: 14.sp,),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 34.h,
          width: 297.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1.h),
              child: Container(
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8.w)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: value[index]+" ",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12.sp),
                            ),
                            TextSpan(
                              text: time[index],
                              style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 12.sp),
                            ),
                          ]
                      ),
                    ),
                  )
              ),
            ),)
          ),
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 262.h,
          width: 390.w,
          child: ListView.separated(
            separatorBuilder: (BuildContext cxt,int index){
              return SizedBox(
                width: 2.w,
              );
            },
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: UniqueKey(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.h),
                ),
                elevation: 0.8,
                color: Colors.white,
                child: const GridTileView(
                  color: Colors.white,
                  image: "assets/neccesary_images/katla_fish.png",
                  productName: "Katla Fish processing(Big Size)",
                  bangli: "কাতলা মাছ প্রসেসিং(বড় মাছ)",
                  presentPrice: 200,
                  oldPrice: 300,
                  rating: 4.6,
                  views: 86,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 262.h,
          width: 390.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: UniqueKey(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.h),
                ),
                elevation: 0.8,
                color: Colors.white,
                child: const GridTileView(
                  color: Colors.white,
                  image: "assets/neccesary_images/katla_fish.png",
                  productName: "Katla Fish processing(Big Size)",
                  bangli: "কাতলা মাছ প্রসেসিং(বড় মাছ)",
                  presentPrice: 200,
                  oldPrice: 300,
                  rating: 4.6,
                  views: 86,
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
