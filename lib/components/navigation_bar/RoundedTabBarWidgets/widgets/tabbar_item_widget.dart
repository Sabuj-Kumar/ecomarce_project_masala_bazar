import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

class TabBarItemWidget extends StatefulWidget {
  final bool isSelected;
  final String icons;
  final String iconName;
  final Function? onItemPressed;
  final Color itemNormalColor;
  final Color itemSelectedColor;
  final Color? itemBackgroundColor;

  const TabBarItemWidget({
    Key? key,
    required this.icons,
    required this.isSelected,
    required this.iconName,
    this.onItemPressed,
    this.itemBackgroundColor,
    required this.itemSelectedColor,
    required this.itemNormalColor,
  }) : super(key: key);

  @override
  _TabBarItemWidgetState createState() => _TabBarItemWidgetState();
}

class _TabBarItemWidgetState extends State<TabBarItemWidget> {
  @override
  Widget build(BuildContext context) {
    final _iconColor = (widget.isSelected == false)
        ? widget.itemNormalColor
        : widget.itemSelectedColor;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (widget.onItemPressed != null) {
              widget.onItemPressed!();
            }
          },
          child:
          widget.icons == 'assets/icons/cart.svg'
              ? Center(
                  child: Badge(
                    elevation: 0,
                    padding: EdgeInsets.all(6.h),
                    position: BadgePosition.topEnd(),
                    toAnimate: false,
                    badgeContent: Text(
                      '${context.watch<CartProvider>().getCartCount()}',
                      style: CustomTextStyle.linkText(context).copyWith(
                          fontSize: 9.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    /*badgeContent: Consumer<CartProvider>(
                        builder: (context, value, child) {
                      return Text(
                        value.getCounter().toString(),
                        style: CustomTextStyle.linkText(context).copyWith(
                            fontSize: 9.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      );
                    }),*/
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          widget.icons,
                          color: _iconColor,
                        ),
                        Text(
                          widget.iconName,
                          style: TextStyle(color: _iconColor, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      widget.icons,
                      color: _iconColor,
                    ),
                    Text(
                      widget.iconName,
                      style: TextStyle(color: _iconColor, fontSize: 12.sp),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
