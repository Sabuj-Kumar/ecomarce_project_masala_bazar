import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/textfields/custom_text_form_field.dart';
import '../../../components/textfields/form_field.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController? _emailOrMobile = TextEditingController();
  final TextEditingController? _password = TextEditingController();
  final TextEditingController? _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Email / Mobile",
            style: CustomTextStyle.subHeader2(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: fuschiaText),
          ),
        ),
        CustomTextField(
          suffixVisibilityIcon: false,
          controller: _emailOrMobile,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          hintText: "Enter your email address/ phone number",
          obscureCharacter: '*',
        ),
        SizedBox(
          height: 21.5.h,
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
          controller: _password,
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
              "Password must be 6 characters and more 12 characters",
              style: CustomTextStyle.subHeader2(context).copyWith(
                  color: textLight,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: 15.11.h,
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
          controller: _confirmPassword,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          hintText: "Enter your password",
          obscureCharacter: '*',
        ),
      ],
    );
  }
}

