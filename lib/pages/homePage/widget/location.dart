import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
    return Material(
      color: deepBgColor,
      elevation: 2,
      shadowColor: bgColor.withOpacity(0.5),
      child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
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
                    width: 200.w,
                    //width: _width * 0.5,
                    child: Center(
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
                              style: CustomTextStyle.bodyText2(context),
                              //style: text.headline1?.copyWith(fontSize: 12.sp),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
