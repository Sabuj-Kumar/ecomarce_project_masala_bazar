import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class SignInSingUpButton extends StatelessWidget {
  const SignInSingUpButton({Key? key,this.buttonName,}) : super(key: key);
  final String? buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if(buttonName == "Sing In"){
            Navigator.pushNamed(context, '/mainPage');
          }else if(buttonName == "Sign Up"){
            Navigator.pushNamed(context, "signInPage");
          }else if(buttonName == "Continue"){
            Navigator.pushNamed(context, "signInPage");
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          primary: irisYellow,
          padding: EdgeInsets.only(
              left: 159.w, right: 159.w, top: 15.h, bottom: 15.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
          side: BorderSide(color: Colors.red.withOpacity(0.5), width: 1.w),
        ),
        child: Text(
          buttonName!,
          style: CustomTextStyle.header2Semi(context),
        ));
  }
}
