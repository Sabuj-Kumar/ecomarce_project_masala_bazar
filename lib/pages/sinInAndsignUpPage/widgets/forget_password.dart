import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class ForgetButton extends StatelessWidget {
  const ForgetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,'/forgetPassPage');
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          "Forget Password?",
          style: CustomTextStyle.subHeader2(context).copyWith(
              color: textColor, decoration: TextDecoration.underline,fontWeight: FontWeight.w400,fontSize: 12.sp),
        ),
      ),
    );
  }
}