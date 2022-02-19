import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 37.h,
            width: 348.w,
            child: TextFormField(
              controller: _searchController,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.always,
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
              onChanged: (changed) {
                setState(() {});
              },
              decoration: InputDecoration(
                fillColor: searchBarBgColor,
                contentPadding: EdgeInsets.only(left: 20.w),
                filled: true,
                hintText: 'Search Product Name',
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(6.w),
                    child: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.15))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide: const BorderSide(color: secondaryColor)),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/sliders.svg',
              height: 30.h,
              width: 30.h,
            ),
          ),
        ],
      ),
    );
  }
}