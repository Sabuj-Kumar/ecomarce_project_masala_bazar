import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("WishList",
                style: CustomTextStyle.subHeader1(context)),
            GestureDetector(
                onTap: () {
                  print("remove form cart");
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: fuschiaBlueGem,width: 1.12.w),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TextButton(
                      onPressed: () {  },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Remove",style: CustomTextStyle.body(context).copyWith(color: Colors.red,fontSize: 10.sp,fontWeight: FontWeight.w600),),
                          SvgPicture.asset("assets/icons/delete.svg",height: 16.h,width: 16.w),
                        ],
                      ),

                    ),
                  ),
                )/* Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Text("Remove",
                            style: CustomTextStyle.body(context)
                                .copyWith(color: Colors.grey)),
                        SvgPicture.asset("assets/icons/delete.svg",
                            height: 20.h, width: 20.w),

                      ],
                    ),*/
            ),
          ],
        ),
      ],
    );
  }
}
