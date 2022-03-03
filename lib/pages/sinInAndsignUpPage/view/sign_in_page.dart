import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../widgets/end_line.dart';
import '../widgets/image_and_text.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/divider_and_logos.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailOrMobile = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: ListView(
            children: [
              Form(
      key: _formKey,
       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(height: 45.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                  child: Column(
                    children: [
                      const ImageAndText(
                        text: "Sign In",
                        text2:
                            "Welcome Back, enter your details so lets get started in ordering food.",
                      ),
                      SizedBox(height: 20.h),
                      SignInForm(
                        emailOrMobile: _emailOrMobile,
                        password: _password,
                      ),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "forgetPassPage");
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forget Password?",
                            style: CustomTextStyle.subHeader2(context).copyWith(
                                color: textColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.02.h),
                const DividerAndLogoWithSignUp(),
                SizedBox(height: 20.h),
                ElevatedButton(
                    onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/mainPage');
                        }
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
                      "Sign In",
                      style: CustomTextStyle.header2Semi(context),
                    )),

                const EndLine(
                  signInOrSignUp: "Sign Up",
                  signInAndSignUpLeftIsTrueAndRightIsFalse: false,
                )
              ]),
    ),
            ],
          ),
        ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
