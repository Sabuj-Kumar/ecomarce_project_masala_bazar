import 'package:efgecom/components/appbars/custom_appbar.dart';
import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/models/category_model.dart';
import 'package:efgecom/pages/homePage/widget/product_tile.dart';
import 'package:efgecom/providers/serarch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../models/featured_product_model.dart';

class SearchPage extends StatefulWidget {
  final String title;

  const SearchPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<FeaturedProductModel> featured;
  bool filter = false;
  late List<double> priceRange;

  @override
  void initState() {
    super.initState();
    featured = [
      FeaturedProductModel(
        productId: 111,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 222,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 333,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 444,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 555,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 666,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 777,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
      FeaturedProductModel(
        productId: 888,
          imgUrl: 'assets/img/meat.png',
          titleBang: 'কাতলা মাছ প্রসেসিং ( বড় মাছ)',
          titleEng: 'Katla Fish processing (Big Size)',
          newPrice: 200,
          oldPrice: 200,
          discountPrice: 25,
          rating: 4.6,
          reviews: 86),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Search Page',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 39.h,
            width: double.infinity,
            child: Card(
              elevation: 2.5,
              margin: EdgeInsets.zero,
              color: deepBgColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            'assets/icons/ranking.svg',
                          ),
                        ),
                        SizedBox(
                          width: 11.83.w,
                        ),
                        Text(
                          'Ranking',
                          style: CustomTextStyle.body(context)
                              .copyWith(fontSize: 16.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          filter = !filter;
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 9.82.w,
                          ),
                          Text(
                            'Filter',
                            style: CustomTextStyle.body(context)
                                .copyWith(fontSize: 16.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          !filter ? Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 19.79.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21.75.w),
                  height: 1240.h,
                  child: GridView.builder(
                      itemCount: featured.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        //childAspectRatio: 13.w / 21.h,
                        childAspectRatio: 13.sw / 9.5.sh,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 10.w
                        //childAspectRatio: MediaQuery.of(context).devicePixelRatio * 0.55
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(productTileCurve.r),
                                bottomRight: Radius.circular(productTileCurve.r)),
                            child: ProductTile(
                              productId: featured[index].productId,
                                imgUrl: featured[index].imgUrl,
                                titleBang: featured[index].titleBang,
                                titleEng: featured[index].titleEng,
                                newPrice: featured[index].newPrice,
                                oldPrice: featured[index].oldPrice,
                                discountPrice: featured[index].discountPrice,
                                rating: featured[index].rating,
                                reviews: featured[index].reviews),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ) : Filter(title: widget.title,),
          filter ? Column(
            children: [
              SizedBox(height: 10.h,),
              ElevatedButton(onPressed: (){
                setState(() {
                  filter = !filter;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Min ${searchProvider.priceRange[0]} and Max ${searchProvider.priceRange[1]}')));
                });
              },
                  style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                      minimumSize: Size(200.w, 37.h)
                  ),
                  child: Text('Apply Filter', style: CustomTextStyle.body(context).copyWith(fontSize: 14.sp, color: Colors.white),)),
              SizedBox(height: 10.h,),
            ],
          ) : Container(),

        ],
      ),
    );
  }
}

class Filter extends StatefulWidget {
  final String title;
  const Filter({Key? key, required this.title}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late List<CategoryModel> filter;
  bool clearAll = false;
  late bool checkBox;

  double _starValue = 200;
  double _endValue = 800;
  late RangeLabels labels;

  @override
  void initState() {
    super.initState();
    filter = [
      CategoryModel(category: 'Frozen Food', subCategory: [SubCategoryModel(subCategory: 'Frozen Food 1'), SubCategoryModel(subCategory: 'Frozen Food 2'),]),
      CategoryModel(category: 'Bakery & Pastry', subCategory: [SubCategoryModel(subCategory: 'Bakery'), SubCategoryModel(subCategory: 'Pastry'),]),
      CategoryModel(category: 'Chatni & Pickles', subCategory: [SubCategoryModel(subCategory: 'Chatni'), SubCategoryModel(subCategory: 'Pickles'),]),
      CategoryModel(category: 'Fresh Fruits', subCategory: [SubCategoryModel(subCategory: 'Fresh Fruits 1'), SubCategoryModel(subCategory: 'Fresh Fruits 2'),]),
      CategoryModel(category: 'Masala Items', subCategory: [SubCategoryModel(subCategory: 'Masala Items 1'), SubCategoryModel(subCategory: 'Masala Items 2'),]),
      CategoryModel(category: 'Fresh Vegetables', subCategory: [SubCategoryModel(subCategory: 'Fresh Vegetables 1'), SubCategoryModel(subCategory: 'Fresh Vegetables 2'),]),
      CategoryModel(category: 'Yogurt & Sweets', subCategory: [SubCategoryModel(subCategory: 'Yogurt'), SubCategoryModel(subCategory: 'Sweets'),]),
      CategoryModel(category: 'Fish & Meat', subCategory: [SubCategoryModel(subCategory: 'Fish'), SubCategoryModel(subCategory: 'Meat'),]),
      CategoryModel(category: 'Shrimp', subCategory: [SubCategoryModel(subCategory: 'Shrimp 1'), SubCategoryModel(subCategory: 'Shrimp 2'),]),
    ];
  }

  bool? checkBoxValue(int index){
    checkBox = filter[index].category == widget.title ? true : filter[index].checkValue;
    return checkBox;
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    labels = RangeLabels('$_starValue', '$_endValue');
    String title = widget.title;
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 660.h,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Filters', style: CustomTextStyle.subHeader1(context),),
                          SizedBox(
                            height: 37.h,
                            width: 200.w,
                            child: ElevatedButton(onPressed: (){
                              setState(() {
                                clearAll = true;
                              });
                            },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                  primary: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    side: BorderSide(color: secondaryColor, width: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                ),
                                child: Text('Clear Filter', style: CustomTextStyle.subHeader2(context))),
                          )

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ExpansionTile(
                          iconColor: fuschiaBlueGem,
                          collapsedIconColor: fuschiaBlueGem,
                          title: Text('All Categories', style: CustomTextStyle.body(context).copyWith(fontSize: 14.sp)),
                          children: [
                            ListView.builder(
                                itemCount: filter.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (builder, index){
                                  return ExpansionTile(
                                    iconColor: fuschiaBlueGem,
                                    collapsedIconColor: fuschiaBlueGem,
                                    tilePadding: EdgeInsets.only(right: 10.w),
                                    leading: Checkbox(
                                      activeColor: fuschiaBlueGem,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: clearAll ? filter[index].checkValue = false : filter[index].checkValue,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          clearAll = false;
                                          title = '';
                                          filter[index].checkValue = newValue!;
                                        });
                                      },
                                    ),
                                    title: Text(filter[index].category!, style: CustomTextStyle.body(context).copyWith(fontSize: 14.sp)),
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: filter[index].subCategory!.length,
                                          itemBuilder: (builder, itemIndex){
                                            return Padding(
                                              padding: EdgeInsets.only(left: 25.w),
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    activeColor: fuschiaBlueGem,
                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                    value: clearAll ? filter[index].subCategory![itemIndex].checkValue = false : filter[index].subCategory![itemIndex].checkValue,
                                                    onChanged: (bool? newValue) {
                                                      setState(() {
                                                        filter[index].subCategory![itemIndex].checkValue = newValue!;
                                                      });
                                                    },
                                                  ),
                                                  Text(filter[index].subCategory![itemIndex].subCategory!, style: CustomTextStyle.body(context).copyWith(fontSize: 14.sp),),
                                                ],
                                              ),
                                            );
                                          }
                                      ),
                                    ],
                                  );
                                }
                            )
                          ],),
                        ExpansionTile(
                          iconColor: fuschiaBlueGem,
                          collapsedIconColor: fuschiaBlueGem,
                          title: Text('Price', style: CustomTextStyle.body(context).copyWith(fontSize: 14.sp)),
                          children: [
                            RangeSlider(
                                values: RangeValues(_starValue, _endValue),
                                activeColor: fuschiaBlueGem,
                                inactiveColor: fuschiaBlueGem.withOpacity(0.2),
                                min: 0,
                                max: 1000,
                                divisions: 10,
                                labels: labels,
                                onChanged: (values){
                                  setState(() {
                                    _starValue = values.start.roundToDouble();
                                    _endValue = values.end.roundToDouble();
                                    searchProvider.changePriceRange(_starValue, _endValue);
                                    labels =RangeLabels("${values.start.toInt().toString()} Tk", "${values.end.toInt().toString()} Tk");
                                  });
                                }
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

