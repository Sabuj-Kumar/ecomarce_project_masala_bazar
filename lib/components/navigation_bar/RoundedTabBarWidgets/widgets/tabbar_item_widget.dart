import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      ],
    );
  }
}
