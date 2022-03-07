import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45,
                blurRadius: 8,
                spreadRadius: 5,
                offset: Offset(0, 6)),
            BoxShadow(
                color: deepBgColor,
                blurRadius: 8,
                spreadRadius: 5,
                offset: Offset(0, 7))
          ]),
    );
  }
}
