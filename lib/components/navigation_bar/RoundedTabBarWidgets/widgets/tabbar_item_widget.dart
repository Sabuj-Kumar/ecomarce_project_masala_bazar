import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabbarItemWidget extends StatefulWidget {
  late final bool isSelected;
  late final String icons;
  late final String iconName;
  final Function? onItemPressed;
  late final Color itemNormalColor;
  late final Color itemSelectedColor;
  late final Color? itemBackgroundColor;

  TabbarItemWidget({
    required this.icons,
    required this.isSelected,
    required this.iconName,
    this.onItemPressed,
    this.itemBackgroundColor,
    required this.itemSelectedColor,
    required this.itemNormalColor,
  });
  @override
  _TabbarItemWidgetState createState() => _TabbarItemWidgetState();
}

class _TabbarItemWidgetState extends State<TabbarItemWidget> {
  @override
  Widget build(BuildContext context) {

    final _iconColor = (widget.isSelected == false)
        ? widget.itemNormalColor
        : widget.itemSelectedColor;
    return Stack(
      children: [
        InkWell(
          onTap: (){
            if (widget.onItemPressed != null) {
              widget.onItemPressed!();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(widget.icons,color: _iconColor,),
              Text(widget.iconName,style: TextStyle(color: _iconColor,fontSize: 12.sp),),
            ],
          ),
        ),
      ],
    );
  }
}