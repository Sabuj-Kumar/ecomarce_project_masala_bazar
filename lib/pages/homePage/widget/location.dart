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
  String dhakaValue = 'Bashundhara';
  String sylhetValue = 'Moulovibazar';

  var division = [
    'Dhaka',
    'Sylhet',
  ];

  // List of items in our dropdown menu
  var dhaka = [
    'Bashundhara',
    'Mirpur',
    'Uttara',
  ];

  var sylhet = [
    'Moulovibazar',
    'Habiganj',
    'Sumanganj',
  ];

  late String divisionName = division[0];

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/map_pin.svg',
                          width: 16.5.w,
                        ),
                        SizedBox(
                          width: 7.25.w,
                        ),
                        SizedBox(
                          width: 120.w,
                          //width: _width * 0.5,
                          child: DropdownButton(
                            value: divisionName == 'Dhaka' ? dhakaValue : sylhetValue,
                            isDense: true,
                            underline: const SizedBox(),
                            itemHeight: null,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down_outlined),
                            items: divisionName == 'Dhaka' ? dhaka.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items,
                                  style: CustomTextStyle.bodyText2(context).copyWith(color: secondaryColor),
                                  //style: text.headline1?.copyWith(fontSize: 12.sp),
                                ),
                              );
                            }).toList() : sylhet.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items,
                                  style: CustomTextStyle.bodyText2(context).copyWith(color: secondaryColor),
                                  //style: text.headline1?.copyWith(fontSize: 12.sp),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (divisionName == 'Dhaka') {
                                setState(() {
                                  dhakaValue = newValue!;
                                });
                              }else{
                                setState(() {
                                  sylhetValue = newValue!;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        if(divisionName == 'Dhaka'){
                          divisionName = division[1];
                          setState(() {
                          });
                        }else{
                          divisionName = division[0];
                          setState(() {
                          });
                        }
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/map_pin.svg',
                            width: 16.5.w,
                          ),
                          SizedBox(
                            width: 7.25.w,
                          ),
                          Text(divisionName,
                            style: CustomTextStyle.bodyText2(context).copyWith(color: secondaryColor),
                            //style: text.headline1?.copyWith(fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
