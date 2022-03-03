library rounded_tabbar_widget;
import 'package:efgecom/components/navigation_bar/RoundedTabBarWidgets/widgets/tebbar_widgets.dart';
import 'package:flutter/material.dart';

class RoundedTabbarWidget extends StatefulWidget {

  final List<String>? iconNames;
  final List<String> icons;
  final Color? itemNormalColor;
  final Color? itemSelectedColor;
  final Color? tabBarBackgroundColor;
  final Function? onTabItemIndexChanged;
  final int currentIndex;
   const RoundedTabbarWidget({
     required this.icons,
     required this.currentIndex,
    this.onTabItemIndexChanged,
    this.tabBarBackgroundColor = Colors.black87,
    this.itemSelectedColor = Colors.yellow,
    this.itemNormalColor = Colors.yellow,
     this.iconNames
  });

  @override
  _RoundedTabbarWidgetState createState() => _RoundedTabbarWidgetState();
}

class _RoundedTabbarWidgetState extends State<RoundedTabbarWidget>{

  @override
  Widget build(BuildContext context) {

    return Positioned(
      child: TabBarWidget(
        icons: widget.icons,
        iconNames: widget.iconNames!,
        selectedIndex: widget.currentIndex,
        itemNormalColor: widget.itemNormalColor!,
        itemSelectedColor: widget.itemSelectedColor!,
        tabBarBackgroundColor: widget.tabBarBackgroundColor!,
        tabBarSelected: (int index) {
          setState(() {
            widget.onTabItemIndexChanged!(index);
            print("Current index ${index}");
          });
        },
      ),
      bottom: 15,
    );
  }
}