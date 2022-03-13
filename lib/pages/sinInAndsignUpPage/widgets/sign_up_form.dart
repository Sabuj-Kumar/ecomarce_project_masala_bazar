import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/textfields/form_field.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key,this.mobile,this.confirmPassword,this.password}) : super(key: key);
  final TextEditingController? mobile;
  final TextEditingController? password;
  final TextEditingController? confirmPassword;
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Mobile Number",
            style: CustomTextStyle.subHeader2(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: fuschiaText),
          ),
        ),
        CustomTextField(
          suffixVisibilityIcon: false,
          controller: widget.mobile,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          hintText: "Enter your mobile number",
          obscureCharacter: '*',
        ),
        SizedBox(
          height: 8.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Password",
            style: CustomTextStyle.subHeader2(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: fuschiaText),
          ),
        ),
        CustomTextField(
          suffixVisibilityIcon: true,
          obscured: true,
          controller: widget.password,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          hintText: "Enter your password",
          obscureCharacter: '*',
        ),
        Row(
          children: [
            Icon(
              Icons.error_outline,
              size: 14.h,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Password must be 6 characters and more 30 characters",
              style: CustomTextStyle.subHeader2(context).copyWith(
                  color: textLight,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Confirm Password",
            style: CustomTextStyle.subHeader2(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: fuschiaText),
          ),
        ),
        CustomTextField(
          suffixVisibilityIcon: true,
          obscured: true,
          controller: widget.confirmPassword,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          hintText: "Enter your password",
          obscureCharacter: '*',
        ),
      ],
    );
  }
}

