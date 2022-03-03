import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../widgets/end_line.dart';
import '../widgets/image_and_text.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/divider_and_logos.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailOrPhone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: ListView(children: [
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                      child: Column(
                        children: [
                          const ImageAndText(
                            text: "Create and Account",
                            text2:
                                "Welcome friend, enter your details so lets get started in ordering food.",
                          ),
                          SizedBox(height: 10.h),
                          SignUpForm(
                            emailOrMobile: _emailOrPhone,
                            password: _password,
                            confirmPassword: _confirmPassword,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    const DividerAndLogoWithSignUp(),
                    SizedBox(height: 15.0.h),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, "signInPage");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.5,
                          primary: irisYellow,
                          padding: EdgeInsets.only(
                              left: 159.w,
                              right: 159.w,
                              top: 15.h,
                              bottom: 15.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          side: BorderSide(
                              color: Colors.red.withOpacity(0.5), width: 1.w),
                        ),
                        child: Text(
                          "Sign Up",
                          style: CustomTextStyle.header2Semi(context),
                        )),
                    const EndLine(
                      signInOrSignUp: "Sign In",
                      signInAndSignUpLeftIsTrueAndRightIsFalse: false,
                    )
                  ]),
            ),
          ]),
        ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
