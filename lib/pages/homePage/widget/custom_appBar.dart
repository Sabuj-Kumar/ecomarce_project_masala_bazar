import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  // Initial Selected Value
  String dropdownvalue = 'Mirpur Cantonment, Dhaka';

  // List of items in our dropdown menu
  var items = [
    'Bashundhara, Dhaka',
    'Mirpur Cantonment, Dhaka',
    'Uttara, Dhaka',
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Material(
      color: bgColor,
      elevation: 1.5,
      shadowColor: bgColor.withOpacity(0.5),
      child: Container(
        padding: EdgeInsets.only(left: 20.85.w, right: 20.85.w, top: 8.5.h),
        height: 82.5.h,
        width: _width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/logo/masalaBazaar_logo.svg',
                  //width: 100,
                  height: 25.h,
                  width: 19.17.w,
                ),
                InkWell(
                  onTap: () {
                  },
                  borderRadius: BorderRadius.circular(20),
                  radius: 100,
                  child: SvgPicture.asset(
                    'assets/icons/notification_bell.svg',
                    width: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.92.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/map_pin.svg',
                  width: 16.5.w,
                ),
                SizedBox(
                  width: 7.25.w,
                ),
                SizedBox(
                  //width: 240,
                  width: _width * 0.5,
                  child: DropdownButton(
                    value: dropdownvalue,
                    isDense: true,
                    underline: const SizedBox(),
                    itemHeight: null,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,
                          style: text.headline1?.copyWith(fontSize: 12.sp),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}