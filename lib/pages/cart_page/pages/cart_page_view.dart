import 'package:efgecom/components/appbars/custom_appbar.dart';
import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_provider.dart';
import '../widgets/cart_list.dart';
import '../widgets/continue_and_proceed_buttons.dart';
import '../widgets/shopping_cart_three_icons.dart';
import '../widgets/wish_list.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  _CartPageViewState createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    var list = cart.items;
    return Scaffold(
      appBar: const CustomAppbar(title: "Shopping Cart"),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const ShoppingCartThreeIcons(),
                  ),
                  SizedBox(height: 50.h),
                  GestureDetector(
                    onTap: () {
                      print("remove form cart");
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 28.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: fuschiaBlueGem,width: 1.12.w),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextButton(
                          onPressed: () {  },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Remove",style: CustomTextStyle.body(context).copyWith(color: Colors.red,fontSize: 12.sp,fontWeight: FontWeight.w600),),
                            SvgPicture.asset("assets/icons/delete.svg",height: 16.h,width: 16.w),
                          ],
                        ),

                        ),
                      ),
                    )/* Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Text("Remove",
                            style: CustomTextStyle.body(context)
                                .copyWith(color: Colors.grey)),
                        SvgPicture.asset("assets/icons/delete.svg",
                            height: 20.h, width: 20.w),

                      ],
                    ),*/
                  ), // delete from cart button
                  SizedBox(height: 15.h),
                  Column(
                      children: List.generate(
                          list.length,
                          (index) => Column(
                                children: [
                                  ListOfCarts(
                                    images: list[index].imgUrl,
                                    productNameEng: list[index].titleEng,
                                    productNameBng: list[index].titleBang,
                                    oldPrice: list[index].oldPrice,
                                    newPrice: list[index].newPrice,
                                    offerPercentages: list[index].offerPercentage,
                                    deliveryDate: "2-3 Days",
                                    productId: list[index].productId,
                                    rating: list[index].rating,
                                    reviews: list[index].reviews,
                                  ),
                                  SizedBox(height: 50.h)
                                ],
                              ))), //cart list print
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Total Order",
                              style: CustomTextStyle.body(context),
                              children: [
                            TextSpan(
                                text: " (${list.length} items)",
                                style: CustomTextStyle.body(context).copyWith(
                                    color: Colors.grey, fontSize: 11.sp))
                          ])),
                      Text("Tk : 113298943297932",
                          style: CustomTextStyle.subHeader1(context)
                              .copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 40.h,),
                  const ContinueAndProceed(),
                  SizedBox(height: 80.h),
                  const WishList(), //wishlist
                  SizedBox(height: 150.h), //ending height
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
