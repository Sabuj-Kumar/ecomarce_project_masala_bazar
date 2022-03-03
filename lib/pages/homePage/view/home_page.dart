import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/discount_banner.dart';
import '../widget/flash_deals.dart';
import '../widget/special_offer.dart';
import '../widget/category_list.dart';
import '../widget/custom_appBar.dart';
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
    return CustomScaffold(
      child: Column(
        children: [
          const CustomAppBar(),
          // const SearchContainer(),
          SizedBox(height: 53.h,),
          const TopBanner(),
          SizedBox(height: 25.25.h,),
          const CategoryList(),
          SizedBox(height: 20.h,),
          const FeaturedProduct(),
          SizedBox(
            height: 18.h,
          ),
          const DiscountBanner(),
          SizedBox(
            height: 25.h,
          ),
          const FlashDeals(),
          SizedBox(height: 25.h,),
          const SpecialOffers()
           // TopBanner()
        ],
      ),
    );
  }
}

