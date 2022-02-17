import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/category_list.dart';
import '../widget/custom_appBar.dart';
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
    return CustomScaffold(
        child: Column(
      children: [
        const CustomAppBar(),
        SizedBox(
          height: 7.h,
        ),
        const SearchContainer(),
        SizedBox(
          height: 18.h,
        ),
        const TopBanner(), // TopBanner()
        SizedBox(
          height: 25.25.h,
        ),
        const CategoryList()
      ],
    ));
  }
}

