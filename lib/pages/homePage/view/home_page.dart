import 'package:carousel_slider/carousel_slider.dart';
import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/models/top_banner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: 7.h,
            ),
            SearchContainer(),
            SizedBox(
              height: 18.h,
            ),
            TopBanner(), // TopBanner()
          ],
        ));
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
                    print('Bell Clicked');
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
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)),
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
          Container(
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

class TopBanner extends StatefulWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  late List<TopBannerModel> banner;

  @override
  void initState() {
    super.initState();
    banner = [
      TopBannerModel(
          id: 0,
          title: 'পদ্মার ইলিশ এখন আপনার হাতের পাশে...',
          imgUrl: 'assets/img/hilsha.png',
          date: '12th Apr- 20th jun'),
      TopBannerModel(
          id: 1,
          title: 'All Snacks up to 70% Discount',
          imgUrl: 'assets/img/hilsha.png',
          date: '12th Apr- 20th jun'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Container(
        height: 150.h,
        child: CarouselSlider(
            options: CarouselOptions(
              height: _height,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              //disableCenter: true
            ),
            items: banner
                .map((item) => Container(
              padding: EdgeInsets.only(right: 15.w),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15.r),),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: item.imgUrl == null
                                      ? const AssetImage(
                                      'assets/img/placeholder.jpg')
                                      : AssetImage(item.imgUrl))),
                        ),)
                    ],
                  ),
                  Container(
                    width: 190.19.w,
                    decoration: BoxDecoration(
                        color: item.id == 0
                            ? Colors.orange.shade700
                            : Colors.pinkAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                            topRight: Radius.circular(100.r),
                            bottomRight:
                            Radius.circular(100.r))),
                  ),
                  Container(
                    width: _width * 0.44,
                    padding: EdgeInsets.only(left: 9.11.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22.19.h,
                        ),
                        SizedBox(
                          height: 44.h,
                          width: 162.01.w,
                          child: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18.sp,
                                height: 1.2.h,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 8.81.h,
                        ),
                        Text(
                          item.date,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.89.w),
                          child: SizedBox(
                            height: 27.h,
                            width: 100.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    primary: buttonColor,
                                    elevation: 0),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14.5.w, vertical: 5.h),
                                  child: Text(
                                    'Shop now',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
                .toList())
    );
  }
}
