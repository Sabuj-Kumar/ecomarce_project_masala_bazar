import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:efgecom/models/category_list_model.dart';
class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late List<CategoryListModel> slider;

  @override
  void initState() {
    super.initState();
    slider = [
      CategoryListModel(
          id: 0, title: 'Frozen Food', imgUrl: 'assets/img/shrimp.png'),
      CategoryListModel(
          id: 1, title: 'Bakery & Pastry', imgUrl: 'assets/img/bakery.png'),
      CategoryListModel(
          id: 2, title: 'Shrimp', imgUrl: 'assets/img/shrimp.png'),
      CategoryListModel(
          id: 3, title: 'Fish & Meat', imgUrl: 'assets/img/meat.png'),
      CategoryListModel(
          id: 4, title: 'Chatni & Pickles', imgUrl: 'assets/img/bakery.png'),
      CategoryListModel(
          id: 5, title: 'Masala Items', imgUrl: 'assets/img/meat.png'),
      CategoryListModel(
          id: 6, title: 'Yogurt & Sweets', imgUrl: 'assets/img/shrimp.png'),
      CategoryListModel(
          id: 7, title: 'Fresh Vegetables', imgUrl: 'assets/img/bakery.png'),
      CategoryListModel(
          id: 8, title: 'Fresh Fruits', imgUrl: 'assets/img/meat.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 33.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: buttonColor,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('See All')),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 21.w),
          height: 98.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: slider.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  EdgeInsets.only(right: 10.w, top: 0.5.h, bottom: 0.5.h),
                  child: SizedBox(
                    width: 122.w,
                    child: InkWell(
                      onTap: (){},
                      child: Card(
                          margin: EdgeInsets.zero,
                          color: slider[index].id == 0
                              ? Colors.orange.shade400
                              : slider[index].id == 1
                              ? buttonColor
                              : slider[index].id == 2
                              ? textColor
                              : slider[index].id == 3
                              ? Colors.orange
                              : slider[index].id == 4
                              ? Colors.green.shade800
                              : slider[index].id == 5
                              ? Colors.purple.shade700
                              : slider[index].id == 6
                              ? Colors.pinkAccent
                              : slider[index].id == 7
                              ? Colors.amberAccent
                              .shade200
                              : Colors
                              .orange.shade700,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 7.91.w),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      slider[index].title,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(slider[index].imgUrl),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}