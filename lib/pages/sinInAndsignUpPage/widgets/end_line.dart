import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class EndLine extends StatelessWidget {
  const EndLine({Key? key,this.signInOrSignUp,required this.signInAndSignUpLeftIsTrueAndRightIsFalse}) : super(key: key);
  final String? signInOrSignUp;
  final bool signInAndSignUpLeftIsTrueAndRightIsFalse;
  @override
  Widget build(BuildContext context) {
    return signInAndSignUpLeftIsTrueAndRightIsFalse? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {
           if(signInOrSignUp == "Sign Up"){
              Navigator.pushNamed(context, '/signUpPage');
           }else if(signInOrSignUp == "Sign In"){
             Navigator.pushNamed(context, '/signInPage');
           }
        }, child: Text(signInOrSignUp!,style: CustomTextStyle.header2Semi(context).copyWith(
            color: mbOnlineColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),)),
        Text(
          "My Account",
          style: CustomTextStyle.header2Semi(context).copyWith(
              color: textLight,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),

      ],
    ):Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have an Account?",
          style: CustomTextStyle.header2Semi(context).copyWith(
              color: textLight,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        TextButton(onPressed: () {
          if(signInOrSignUp == "Sign Up"){
            Navigator.pushNamed(context, '/signUpPage');
          }else if(signInOrSignUp == "Sign In"){
            Navigator.pushNamed(context, '/signInPage');
          }
        }, child: Text(signInOrSignUp!,style: CustomTextStyle.header2Semi(context).copyWith(
            color: mbOnlineColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),))
      ],
    );
  }
}
