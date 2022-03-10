import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/textfields/form_field.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../widgets/image_and_text.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);
  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
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
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 45.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                      child: Column(
                        children: [
                          const ImageAndText(
                            text: "Update Password",
                            text2:
                                "Please add a new password to enter the MasalaBazaar application.",
                          ),
                          SizedBox(height: 36.73.h),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "New Password",
                              style: CustomTextStyle.subHeader2(context)
                                  .copyWith(
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
                            textInputAction: TextInputAction.done,
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
                                style: CustomTextStyle.subHeader2(context)
                                    .copyWith(
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
                              style: CustomTextStyle.subHeader2(context)
                                  .copyWith(
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
                      ),
                    ),
                    SizedBox(height: 220.h),
                    ElevatedButton(
                        onPressed: () {
                          //print("input phone number ${_emailOrMobile.text}");
                          //String s = _emailOrMobile.text;
                          if (_formKey.currentState!.validate()) {
                            if (_password.text != _confirmPassword.text) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  "Password and Confirm Password Not Match",
                                  style: CustomTextStyle.subHeader2(context).copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                                behavior: SnackBarBehavior.floating,
                                elevation: 0.3,
                                backgroundColor: Colors.yellow.shade100.withOpacity(0.9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ));

                            } else {
                              Navigator.pushNamed(context, "signInPage");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "Password Reset Successful.",
                                style: CustomTextStyle.subHeader2(context)
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                              ),
                                backgroundColor: Colors.yellow.shade100.withOpacity(0.9),
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
                              left: 120.w,
                              right: 120.w,
                              top: 15.h,
                              bottom: 15.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          side: BorderSide(
                              color: Colors.red.withOpacity(0.5), width: 1.w),
                        ),
                        child: Text(
                          "Update Password",
                          style: CustomTextStyle.header2Semi(context),
                        )),
                  ]),
            ),
          ],
        ),
      ),
    ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
