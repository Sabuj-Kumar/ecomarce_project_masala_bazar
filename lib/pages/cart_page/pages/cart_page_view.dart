import 'package:efgecom/components/appbars/custom_appbar.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../widgets/cart_list.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  _CartPageViewState createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  int totalCount = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    var list = cart.items;
    return Scaffold(
      appBar: CustomAppbar(title: "Shopping Cart"),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            color: irisYellow,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.shopping_cart_outlined, size: 25.h),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                8,
                                    (index) => LayoutBuilder(
                                    builder: (context, constraints) => Row(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 2.h,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        )
                                      ],
                                    )))),
                        Card(
                            color: Colors.white,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  SvgPicture.asset("assets/icons/home_address.svg",height: 28.h,width: 28.w),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                8,
                                    (index) => LayoutBuilder(
                                    builder: (context, constraints) => Row(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 2.h,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        )
                                      ],
                                    )))),
                        Card(
                            color: Colors.white,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  SvgPicture.asset("assets/icons/walets.svg",height: 28.h,width: 28.w),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Column(
                    children: List.generate(list.length, (index) => Column(
                      children: [
                        //list[index],
                        SizedBox(height: 50.h)
                      ],
                    ))
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 200.h))
                  /*ListOfCarts(
                    images: "assets/img/hilsha.png",
                    deliveryDate: "Arrive by 2030 to 2040 okay ?",
                    oldPrice: 1800.0,
                    newPrice: 1700.0,
                    productName: "katla Mach processing (Big Size)",
                    offerPercentages: -10.0,
                    totalCountCallBack: (count){
                      totalCount+= count;
                    },
                  )*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
