import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/textfields/custom_text_form_field.dart';
import '../../../components/textfields/form_field.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../widgets/end_line.dart';
import '../widgets/image_and_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailOrMobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: CustomTextFormField(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
            child: Column(
              children: [
                const ImageAndText(
                  text: "Forget Password",
                  text2:
                      "Enter your email address to request a password reset.",
                ),
                SizedBox(height: 36.73.h),
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
                  textInputAction: TextInputAction.done,
                  hintText: "Enter your email address/ phone number",
                  obscureCharacter: '*',
                ),
              ],
            ),
          ),
          SizedBox(height: 335.89.h),
          ElevatedButton(
              onPressed: () {
                print(_emailOrMobile.text);
                Navigator.pushNamed(
                    context, '/resetPassPage/${_emailOrMobile.text}');
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.5,
                primary: irisYellow,
                padding: EdgeInsets.only(
                    left: 159.w, right: 159.w, top: 15.h, bottom: 15.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                side:
                    BorderSide(color: Colors.red.withOpacity(0.5), width: 1.w),
              ),
              child: Text(
                "Continue",
                style: CustomTextStyle.header2Semi(context),
              )),
          SizedBox(height: 32.h),
          const EndLine(
            signInOrSignUp: "Sign In",
            signInAndSignUpLeftIsTrueAndRightIsFalse: true,
          )
        ]),
      ],
    ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
