import 'package:efgecom/components/navigation_bar/RoundedTabBarWidgets/widgets/tabbar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme_config.dart';

class TabBarWidget extends StatefulWidget {
  final int selectedIndex;
  late final Color itemNormalColor;
  late final Color itemSelectedColor;
  late final Color tabBarBackgroundColor;
  final Function? tabBarSelected;
  final List<String> iconNames;
  final List<String> icons;
  TabBarWidget({
    required this.icons,
    required this.selectedIndex,
    this.tabBarSelected,
    required this.tabBarBackgroundColor,
    required this.itemSelectedColor,
    required this.itemNormalColor,
    required this.iconNames,
  });
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late int _selectedTabbarMenuIndex;
  late List<String> _tabIcons;
  late List<String> _iconNames;
  final double _defaultHorizontalPadding = 20.0;

  @override
  void initState() {
    super.initState();
    _selectedTabbarMenuIndex = widget.selectedIndex;
    _tabIcons = widget.icons;
    _iconNames = widget.iconNames;
  }

  void _onTabItemPressed({required int tabItemIndex}) {
    setState(() {
      _selectedTabbarMenuIndex = tabItemIndex;
      print("tabItemIdex ${tabItemIndex}");
      if (widget.tabBarSelected != null) {
        widget.tabBarSelected!(tabItemIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final double _maxWidth = MediaQuery.of(context).size.width;
    double _containerWidth = _maxWidth - (_defaultHorizontalPadding * 2.0);
    _containerWidth = (_containerWidth > 480.0) ? 480.0 : _containerWidth;

    final _marginOffset = (_maxWidth - _containerWidth) / 2.0;
    return Container(
      constraints: BoxConstraints(maxWidth: _containerWidth, maxHeight: 60.0),
      margin: EdgeInsets.only(
        right: _marginOffset,
        left: _marginOffset,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: widget.tabBarBackgroundColor,
        border: Border.all(color: irisOrange, width: 1.5.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 3.h),
        child: Row(
          mainAxisAlignment: (_tabIcons.length == 1)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: _getTabBarItems(),
        ),
      ),
    );
  }

  List<Widget> _getTabBarItems() {

    return List.generate(
        _tabIcons.length,
        (index) => TabbarItemWidget(
              icons: widget.icons[index],
              itemBackgroundColor: widget.tabBarBackgroundColor,
              itemNormalColor: widget.itemNormalColor,
              itemSelectedColor: widget.itemSelectedColor,
              isSelected: (_selectedTabbarMenuIndex == index),
              iconName: _iconNames[index],
              onItemPressed: () => _onTabItemPressed(
                tabItemIndex: index,
              ),
            ));
  }
}
