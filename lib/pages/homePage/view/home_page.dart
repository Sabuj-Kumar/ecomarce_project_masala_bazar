import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/homePage/widget/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';

import '../../../config/custom_text_style.dart';
import '../widget/discount_banner.dart';
import '../widget/flash_deals.dart';
import '../widget/search_container.dart';
import '../widget/special_offer.dart';
import '../widget/category_list.dart';
import '../widget/featured_product.dart';
import '../widget/top_banner.dart';

class HomePage extends StatefulWidget {
  final int? flashDealTime;
  const HomePage({Key? key, this.flashDealTime = 1647749520000}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTime = DateTime.now().millisecondsSinceEpoch;

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
                automaticallyImplyLeading: false,
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
                automaticallyImplyLeading: false,
                toolbarHeight: 65.h,
                elevation: 3,
                shadowColor: deepBgColor.withOpacity(0.5),
                //expandedHeight: 60.h,
                pinned: true,
                backgroundColor: deepBgColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SearchContainer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                      child: Badge(
                        elevation: 0,
                        padding: EdgeInsets.all(6.h),
                        position: BadgePosition.topEnd(),
                        toAnimate: false,
                        showBadge: false,
                        badgeContent: Text(
                          '2',
                          style: CustomTextStyle.linkText(context).copyWith(
                              fontSize: 9.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/notification_bell.svg',
                          width: 23.w,
                        ),
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
                widget.flashDealTime != null && widget.flashDealTime! > currentTime ? Column(
                  children: [
                    FlashDeals(flashDealTime: widget.flashDealTime,),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ) : Container(),
                const SpecialOffers()
                // TopBanner()
              ],
            ),
          ),
           // TopBanner()
        ),
      ),
    );
  }
}
