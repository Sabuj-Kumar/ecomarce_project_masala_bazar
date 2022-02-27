import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class ImageAndText extends StatelessWidget {
  const ImageAndText({Key? key,this.text,this.text2}) : super(key: key);
  final String? text;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/img/mbOnline.png",
            width: 110.37.w, height: 94.27.w),
        SizedBox(
          height: 22.02.h,
        ),
        Text(
          text!,
          style: CustomTextStyle.subHeader1(context).copyWith(
              fontSize: 24.sp,
              color: fuschiaText,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.38.h,
        ),
        SizedBox(
          height: 60.h,
          width: 315.45.w,
          child: Text(
            text2!,
            style: CustomTextStyle.subHeader2(context).copyWith(
              color: fuschiaText,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
