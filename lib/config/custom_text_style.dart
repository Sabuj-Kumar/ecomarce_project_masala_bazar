import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyle{
  static TextStyle header1(BuildContext context) {
    return TextStyle(
      fontSize: 24.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle header2Bold(BuildContext context) {
    return TextStyle(
      fontSize: 18.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle header2Semi(BuildContext context) {
    return TextStyle(
      fontSize: 18.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle subHeader1(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle subHeader2(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle linkText(BuildContext context) {
    return TextStyle(
      fontSize: 10.sp,
      color: fuschiaBlueGem,
      fontWeight: FontWeight.w400,
    );
  }
}