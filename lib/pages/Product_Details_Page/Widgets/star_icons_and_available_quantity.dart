import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';

class StarIconsAndAvailableQuantity extends StatelessWidget {
  const StarIconsAndAvailableQuantity(
      {Key? key, required this.available, required this.reviews})
      : super(key: key);
  final int? available;
  final int? reviews;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: irisYellow),
            const Icon(Icons.star, color: irisYellow),
            const Icon(Icons.star, color: irisYellow),
            const Icon(Icons.star_half, color: irisYellow),
            const Icon(Icons.star_border, color: irisYellow),
            SizedBox(
              width: 15.w,
            ),
            Text(
              "($reviews)",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: irisYellow.withOpacity(0.25),
              borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Available: ${available}",
              style: TextStyle(
                  fontSize: 12.sp, fontWeight: FontWeight.w600, color: fuschiaBlueGem),
            ),
          ),
        )
      ],
    );
  }
}
