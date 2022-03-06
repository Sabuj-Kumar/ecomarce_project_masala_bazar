import 'package:efgecom/config/custom_text_style.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 45.h,
          width: 320.w,
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
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              filled: true,
              border: InputBorder.none,
              hintText: 'Search Product Name',
              hintStyle: CustomTextStyle.subHeader2(context).copyWith(color: Colors.grey.shade400),
              suffixIcon: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: SvgPicture.asset(
                    'assets/icons/search_icon.svg',
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(searchCurve.r)),
                  borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.15))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(searchCurve.r)),
                  borderSide: const BorderSide(color: secondaryColor)),
            ),
          ),
        ),
      ],
    );
  }
}