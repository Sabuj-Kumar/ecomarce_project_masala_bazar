import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/textfields/form_field.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key,required this.password,required this.emailOrMobile}) : super(key: key);
  final TextEditingController  emailOrMobile;
  final TextEditingController  password;
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {


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
          controller: widget.emailOrMobile,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          hintText: "Enter your email address/ phone number",
          obscureCharacter: '*',
        ),
        SizedBox(
          height: 15.h,
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
      ],
    );
  }
}


