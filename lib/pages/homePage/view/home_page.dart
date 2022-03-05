import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/homePage/widget/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/discount_banner.dart';
import '../widget/flash_deals.dart';
import '../widget/search_container.dart';
import '../widget/special_offer.dart';
import '../widget/category_list.dart';
import '../widget/featured_product.dart';
import '../widget/top_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 45.h,
                elevation: 0,
                backgroundColor: deepBgColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Location(),
                  ),

                ),
              ),
              SliverAppBar(
                toolbarHeight: 65.h,
                elevation: 3,
                shadowColor: deepBgColor.withOpacity(0.5),
                //expandedHeight: 60.h,
                pinned: true,
                backgroundColor: deepBgColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchContainer(),
                    InkWell(
                      onTap: () {
                      },
                      child: SvgPicture.asset(
                        'assets/icons/notification_bell.svg',
                        width: 23.w,
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: CustomScaffold(
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const TopBanner(),
                SizedBox(
                  height: 25.25.h,
                ),
                const CategoryList(),
                SizedBox(
                  height: 20.h,
                ),
                const FeaturedProduct(),
                SizedBox(
                  height: 18.h,
                ),
                const DiscountBanner(),
                SizedBox(
                  height: 25.h,
                ),
                FlashDeals(),
                SizedBox(
                  height: 20.h,
                ),
                const SpecialOffers()
                // TopBanner()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
