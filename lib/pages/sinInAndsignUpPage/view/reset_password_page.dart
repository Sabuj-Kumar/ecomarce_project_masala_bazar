import 'package:flutter/material.dart';
import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../widgets/image_and_text.dart';
import '../widgets/sign_in_and_sign_up_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key, required this.value}) : super(key: key);
  final String value;
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String value = "123456789";
  int len = 0;
  @override
  void initState() {
    len = widget.value.length;
    value = widget.value;
    print(value);
    print("$len");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 45.h),
      Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
        child: Column(
          children: [
            ImageAndText(
              text: "Reset Password",
              text2:
                  "We have sent the verification code to +880*******${value.substring(len - 3)}. Change?",
            ),
            SizedBox(height: 50.92.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Verification Code",
                  style: CustomTextStyle.subHeader2(context).copyWith(
                      color: fuschiaText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Re-Sent-Code",
                    style: CustomTextStyle.subHeader2(context).copyWith(
                        color: fuschiaBlueGem,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            OtpTextField(
              numberOfFields: 4,
              fieldWidth: 60,
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(15),
              borderWidth: 1.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              borderColor: fuschiaBlueGem,
              enabledBorderColor: fuschiaBlueGem,
              focusedBorderColor: fuschiaBlueGem,
              onCodeChanged: (String code) {},
              onSubmit: (String code) {},
            ),
            SizedBox(height: 20.h),
            Text(
              "Send code reload in (0.25 sec)",
              style: CustomTextStyle.subHeader2(context).copyWith(
                  color: textLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            )
          ],
        ),
      ),
      SizedBox(height: 335.89.h),
      const SignInSingUpButton(
        buttonName: "Continue",
      ),
    ]));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
