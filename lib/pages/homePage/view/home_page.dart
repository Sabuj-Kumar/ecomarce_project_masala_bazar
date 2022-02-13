import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: CustomAppBar(),
    );
  }
}

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
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Material(
      color: bgColor,
      elevation: 1.5,
      shadowColor: bgColor.withOpacity(0.5),
      child: Container(
        padding: EdgeInsets.only(
            //left: 18,
            left: _width * 0.04,
            //right: 18,
            right: _width * 0.04,
            //top: 14,
            top: _height * 0.02,
            bottom: 0),
        height: _height * 0.1,
        //height: 80,
        width: _width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/logo/masalaBazaar_logo.svg',
                  //width: 100,
                  width: _width * 0.25,
                ),
                InkWell(
                  onTap: () {
                    print('Bell Clicked');
                  },
                  borderRadius: BorderRadius.circular(20),
                  radius: 100,
                  child: SvgPicture.asset(
                    'assets/icons/notification_bell.svg',
                    //width: 22,
                    width: _width * 0.058,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/map_pin.svg',
                  width: _width * 0.045,
                ),
                SizedBox(
                  //width: 4,
                  width: _width * 0.01,
                ),
                SizedBox(
                  //width: 240,
                  width: _width * 0.46,
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
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600)),
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
