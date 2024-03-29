import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/delivery_info.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/description.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/reviews.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/star_icons_and_available_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../models/product_details_model.dart';
import '../../../providers/language_provider.dart';
import '../../homePage/widget/featured_product.dart';
import 'add_to_cart.dart';
import 'key_description.dart';
import 'offers.dart';

class DragAbleList extends StatefulWidget {
  const DragAbleList(
      {Key? key,
      this.reviews,
      this.rating,
      this.newPrice,
      this.oldPrice,
      this.productNameEng,
      this.productNameBng})
      : super(key: key);
  final String? productNameEng;
  final String? productNameBng;
  final double? oldPrice;
  final double? newPrice;
  final int? reviews;
  final double? rating;

  @override
  State<DragAbleList> createState() => _DragAbleListState();
}

class _DragAbleListState extends State<DragAbleList>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String productNameEng = "";
  String productNameBng = "";
  int reviews = 0;
  double oldPrice = 0.0;
  double newPrice = 0.0;
  double rating = 0.0;
  List<Widget> _pages = [];
  final List<String> _name = ["Description", "Reviews", "Delivery Info"];
  List<ProductDetails> list = [];
  @override
  void initState() {
    productNameEng = widget.productNameEng!;
    productNameBng = widget.productNameBng!;
    reviews = widget.reviews!;
    oldPrice = widget.oldPrice!;
    newPrice = widget.newPrice!;
    rating = widget.rating!;
    list = [
      ProductDetails(
          quantity: 01,
          views: 25,
          available: 250,
          percentageOfOffer: 10,
          weightRangeStart: 3,
          weightRangeEnd: 4,
          tags: [
            "Boro Katla Mach",
            "Katla",
            "Katla Fish",
            "katla Mach",
            "katol",
            "katol Mach"
          ],
          categoryListTageName: [
            "Fish & Meat",
            "New Products"
          ],
          keyDescription: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tellus porttitor purus, et volutpat sit.",
            "৩ থেকে ৪ কেজি ওজনের, প্রতি কেজির মূল্য ৪৭০ টাকা প্রসেসিং করা প্রতি কেজির মূল্য ৪৯০ টাকা।",
          ],
          moreDetailsList: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tellus porttitor purus, et volutpat sit.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tellus porttitor purus, et volutpat sit.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tellus porttitor purus, et volutpat sit."
          ],
          variousTemperList: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tellus porttitor purus, et volutpat sit.",
            "৩ থেকে ৪ কেজি ওজনের, প্রতি কেজির মূল্য ৪৭০ টাকা প্রসেসিং করা প্রতি কেজির মূল্য ৪৯০ টাকা।"
          ], retailerId: '', id: '', productId: '')
    ];
    _pages = [
      Descriptions(
        variousTempor: list[0].variousTemperList,
        moreDetails: list[0].moreDetailsList,
      ),
      Reviews(reviews: reviews,rating: rating,percentages: const [20,3,2,0,0],),
      DeliveryInfo()
    ];

   _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context,listen: false);
    String languageCode = langProvider.languageCode;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
        initialChildSize: 0.88.h,
        minChildSize: 0.87.h,
        builder: (context, scrollController) => ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.r),
                  topLeft: Radius.circular(24.r)),
              child: Container(
                color: bgColor,
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 33.73.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              languageCode == 'en'? Text("${widget.productNameEng}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp)) :Text("${widget.productNameBng}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp)),
                              GestureDetector(
                                  onTap: () {
                                    print("clicked share button");
                                  },
                                  child: SvgPicture.asset(
                                      "assets/icons/share_button.svg")),
                            ],
                          ),

                          SizedBox(height: 6.57.h),
                          Text("Quantity: ${list[0].quantity} KG"),
                          SizedBox(height: 11.7.h),
                          StarIconsAndAvailableQuantity(
                              available: list[0].available, reviews: reviews),
                          SizedBox(height: 26.27.h),
                        ],
                      ),
                    ),
                    Offers(percentageOfOffer: list[0].percentageOfOffer),
                    SizedBox(height: 25.h),
                    KeyDescription(
                      description: list[0].keyDescription,
                      category: list[0].categoryListTageName,
                      tags: list[0].tags,
                    ),
                    Divider(
                      color: Colors.deepPurpleAccent,
                      height: 21.h,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height:450.h,
                            width: width.w,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                    controller: _tabController,
                                    unselectedLabelColor: fuschiaText,
                                    labelColor: fuschiaRed,
                                    isScrollable: true,
                                    labelPadding: EdgeInsets.only(left: 0.w,right: 60.w),
                                    indicatorColor: bgColor.withOpacity(0.0),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    tabs: [
                                      Tab(
                                        text: _name[0],
                                      ),
                                      Tab(
                                        text: _name[1] + "($reviews)",
                                      ),
                                      Tab(
                                        text: _name[2],
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(child: SizedBox(
                                  height: 390.h,
                                  width: double.maxFinite,
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: _pages),
                                )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    const FeaturedProduct(),
                    SizedBox(height: 20.h),
                    AddToCart(
                      newPrice: newPrice,
                      oldPrice: oldPrice,
                    )
                  ],
                ),
              ),
            ));
  }
}
