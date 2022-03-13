import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/custom_text_style.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("WishList",
                style: CustomTextStyle.subHeader1(context)),
            GestureDetector(
              onTap: () {
                print("remove form cart");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/icons/delete.svg",
                      height: 20.h, width: 20.w),
                  Text("(Delete this item)",
                      style: CustomTextStyle.body(context)
                          .copyWith(color: Colors.grey))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
