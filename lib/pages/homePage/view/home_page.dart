import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../components/navigation_bar/navigation_bar.dart';
import '../../../config/theme_config.dart';

import 'home_page_design_container.dart';
import '../widget/category_list.dart';
import '../widget/custom_appBar.dart';
import '../widget/featured_product.dart';
import '../widget/search_container.dart';
import '../widget/top_banner.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return CustomScaffold(

      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: _height * 0.008,
          ),
          const SearchContainer(),
          //Container(height: _height * 0.25,width:_width * 0.915,color: Colors.red,),
          SizedBox(height: 18.h,),
          const TopBanner(),
          SizedBox(height: 25.25.h,),
          const CategoryList(),
          SizedBox(height: 20.h,),
          const FeaturedProduct(),
          const DiscountBanner(),
          FlashDeals()
           // TopBanner()
        ],
      ),
    );
  }
}


