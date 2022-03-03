import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTitle {
  static Widget getTitleWidget(
      {required String title, TextAlign? textAlign, TextStyle? textStyle}) {
    return Text(
      title,
      textAlign: textAlign,
      style: textStyle ?? TextStyle(color: Theme.of(Get.context!).textTheme.headline6!.color),
    );
  }
}
