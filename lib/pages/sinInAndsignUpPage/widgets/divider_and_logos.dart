import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class DividerAndLogoWithSignUp extends StatefulWidget {
  const DividerAndLogoWithSignUp({Key? key}) : super(key: key);

  @override
  State<DividerAndLogoWithSignUp> createState() => _DividerAndLogoWithSignUpState();
}

class _DividerAndLogoWithSignUpState extends State<DividerAndLogoWithSignUp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            Divider(
              thickness: 1.0.h,
              color: Colors.black.withOpacity(0.5),
              height: 25.h,
            ),
            Positioned(
              left: width * 0.50.w,
              child: Container(
                height: 25.h,
                width: 55.53.w,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(width: 1.w, color: Colors.grey),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: CustomTextStyle.subHeader2(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: fuschiaBlueGem),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 27.44.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/logo/google_logo.svg"),
            SvgPicture.asset("assets/logo/facebook_logo.svg"),
            SvgPicture.asset("assets/logo/apple_logo.svg"),
          ],
        ),
      ],
    );
  }
}
