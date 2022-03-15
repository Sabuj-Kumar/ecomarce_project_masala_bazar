import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class ContinueAndProceed extends StatelessWidget {
  const ContinueAndProceed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/mainPage');
            print("Continue pressedd");
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 15.0.w,
                  right: 15.w,
                  bottom: 8.h,
                  top: 8.h),
              child: Text("Continue Shopping",
                  style: CustomTextStyle.subHeader2(context)),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: fuschiaBlueGem, width: 1.5.w)),
          ),
        ), //continue button
        GestureDetector(
          onTap: () {
            print("Proceed to checked pressed");
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 15.0.w,
                  right: 15.w,
                  bottom: 8.h,
                  top: 8.h),
              child: Text("Proceed to Checkout",
                  style: CustomTextStyle.subHeader2(context)
                      .copyWith(color: Colors.white)),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: fuschiaRed),
          ),
        ) // proceed to checkout button
      ],
    );
  }
}
