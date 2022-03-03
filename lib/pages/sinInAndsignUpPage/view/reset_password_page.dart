import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';
import '../widgets/image_and_text.dart';


class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key, required this.number}) : super(key: key);
  final String number;
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String number ="";
  int len = 0;
  String? otp;
  @override
  void initState() {
    len = widget.number.length;
    number = widget.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 45.h),
      Padding(
            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
            child: Column(
              children: [
                ImageAndText(
                  text: "Reset Password",
                  text2:
                      "We have sent the verification code to +880*******${number.substring(len - 3)}. Change?",
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
                  onCodeChanged: (String code) {
                    otp = code;
                  },
                  onSubmit: (String code) {
                    otp = code;
                  },
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
      SizedBox(height: 250.h),
              ElevatedButton(
                  onPressed: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePasswordPage()));
                     Navigator.pushNamed(context, '/updatePassPage');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.5,
                    primary: irisYellow,
                    padding: EdgeInsets.only(
                        left: 159.w, right: 159.w, top: 15.h, bottom: 15.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    side: BorderSide(color: Colors.red.withOpacity(0.5), width: 1.w),
                  ),
                  child: Text(
                    "Continue",
                    style: CustomTextStyle.header2Semi(context),
                  )),
    ]),
          ],
        ));
  }
}
//EdgeInsets.only(left: 20.0.h, right: 20.0.h)
