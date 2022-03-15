import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/theme_config.dart';

class ShoppingCartThreeIcons extends StatefulWidget {
  const ShoppingCartThreeIcons({Key? key}) : super(key: key);

  @override
  _ShoppingCartThreeIconsState createState() => _ShoppingCartThreeIconsState();
}

class _ShoppingCartThreeIconsState extends State<ShoppingCartThreeIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //first icons row
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
            color: irisYellow.withOpacity(0.3),
            elevation: 0.0,
            shape: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart_outlined,
                  size: 25.h),
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                8,
                    (index) => LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 2.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 2.w,
                        )
                      ],
                    )))),
        Card(
            color: Colors.white,
            elevation: 0.0,
            shape: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  "assets/icons/home_address.svg",
                  height: 28.h,
                  width: 28.w),
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                8,
                    (index) => LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 2.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 2.w,
                        )
                      ],
                    )))),
        Card(
            color: Colors.white,
            elevation: 0.0,
            shape: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/icons/walets.svg",
                  height: 28.h, width: 28.w),
            )),
      ],
    );
  }
}
