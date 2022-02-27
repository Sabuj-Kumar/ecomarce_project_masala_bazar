import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/textfields/custom_text_form_field.dart';
import '../widgets/end_line.dart';
import '../widgets/image_and_text.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/divider_and_logos.dart';
import '../widgets/sign_in_and_sign_up_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                const ImageAndText(text: "Create and Account",text2: "Welcome friend, enter your details so lets get started in ordering food.",),
                SizedBox(height: 36.73.h),
                const SignUpForm(),

              ],
            ),
      ),
      SizedBox(height: 38.02.h),
      const DividerAndLogoWithSignUp(),
      SizedBox(height: 63.92.h),
      const SignInSingUpButton(buttonName: "Sign Up",),
      SizedBox(height: 32.h),
      const EndLine(signInOrSignUp: "Sign In",signInAndSignUpLeftIsTrueAndRightIsFalse: false,)
    ]),
          ],
        ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
