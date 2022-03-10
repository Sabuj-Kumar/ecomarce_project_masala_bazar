import 'package:flutter/cupertino.dart';
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
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: ListView(children: [
          Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      mobile: _mobile,
                      password: _password,
                      confirmPassword: _confirmPassword,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0.h),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_password.text != _confirmPassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Password not matched.",
                            style: CustomTextStyle.subHeader2(context).copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0.3,
                          backgroundColor: Colors.yellow.shade50.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ));
                      } else {
                        Navigator.pushNamed(context, '/signInPage');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Registration in successful.",
                            style: CustomTextStyle.subHeader2(context).copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0.3,
                          backgroundColor: Colors.yellow.shade50.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.5,
                    primary: irisYellow,
                    padding: EdgeInsets.only(
                        left: 159.w, right: 159.w, top: 15.h, bottom: 15.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    side: BorderSide(
                        color: Colors.red.withOpacity(0.5), width: 1.w),
                  ),
                  child: Text(
                    "Sign Up",
                    style: CustomTextStyle.header2Semi(context),
                  )),
              SizedBox(height: 40.0.h),
              const DividerAndLogoWithSignUp(),
              SizedBox(height: 15.0.h),
              const EndLine(
                signInOrSignUp: "Sign In",
                signInAndSignUpLeftIsTrueAndRightIsFalse: false,
              )
            ]),
          ),
        ]),
      ),
    ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
/*
*  if (_mobile.text.length != 11){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                        Text("Number Must Be 11 digits.")));
                              } else if (double.tryParse(_mobile.text) == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                        Text("Input valid number please")));
                              } else if(_password.text != _confirmPassword.text){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Not Match")));
                              }
                              else if (_password.text.length < 6 ||
                                  _confirmPassword.text.length < 6) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "password must be greater or equal to 6 digits.")));
                              } else {*/
