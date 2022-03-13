import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Descriptions extends StatelessWidget {
  const Descriptions({Key? key, this.variousTempor, this.moreDetails})
      : super(key: key);
  final List<String>? variousTempor;
  final List<String>? moreDetails;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Various  Tempor :\n",
              style: CustomTextStyle.subHeader2(context).copyWith(
                  color: fuschiaRed,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
            ),
            Text(
              variousTempor!.join('\n\n'),
              style:
                  CustomTextStyle.bodyText2(context).copyWith(color: fuschiaText),
            ),
            SizedBox(height: 15.h),
            Text(
              "More Details :",
              style: CustomTextStyle.subHeader2(context).copyWith(
                  color: fuschiaRed,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  moreDetails!.length,
                  (index) => Column(
                    children: [
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.arrow_forward,size: 20.h,color: fuschiaBlueGem,),
                              ],
                            ),
                            SizedBox(width: 7.w),
                            Expanded(
                                child: Text(
                              moreDetails![index],
                              style: CustomTextStyle.bodyText2(context).copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 13.sp,color: fuschiaText),
                            )),
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }
}
