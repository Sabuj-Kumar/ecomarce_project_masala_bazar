import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/homePage/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:efgecom/pages/mainPage/dashboard_page.dart';
import 'package:efgecom/pages/menu/side_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/navigation_bar/RoundedTabBarWidgets/rounded_tabbar_widgets.dart';

class MainPage extends StatefulWidget {
  final int? index;

  const MainPage({Key? key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }

// @override
// _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 0;

  List pageList = const [
    HomePage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    Menu(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget titleText() {
    return Text(
      "My test App",
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            pageList[_index],
            RoundedTabBarWidget(
              icons: const [
                "assets/icons/home.svg",
                "assets/icons/message.svg",
                "assets/icons/cart.svg",
                "assets/icons/category.svg",
                "assets/icons/profileIcon.svg",
              ],
              iconNames: const ["Home", "Inbox", "Cart", "Category", "Profile"],
              onTabItemIndexChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
              itemNormalColor: secondaryColor,
              itemSelectedColor: buttonColor,
              tabBarBackgroundColor: bgColor.withOpacity(0.9999.w),
              currentIndex: _index,
            ),
          ],
        ),
      ),
    );

    /*Container(
      color: bgColor,
      margin: EdgeInsets.only(left: 10.w),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 60.w,
          iconSize: 40.w,
          border: Border.all(color:Colors.red,width: 1.5.w),
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(_index == 1
                  ? CupertinoIcons.bubble_right_fill
                  : CupertinoIcons.bubble_right),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(_index == 2
                  ? CupertinoIcons.search_circle_fill
                  : CupertinoIcons.search_circle),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(_index == 3
                  ? CupertinoIcons.cart_fill
                  : CupertinoIcons.cart),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.profile_circled,
              ),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          // if (mounted) {
          //   setState(() {
          //     _index = index;
          //   });
          // }
          Widget tabPage;
          switch (index) {
            case 0:
              tabPage = const HomePage();
              break;
            case 1:
              tabPage = const DashboardPage();
              break;
            case 2:
              tabPage = const DashboardPage();
              break;
            case 3:
              tabPage = const DashboardPage();
              break;
            case 4:
              tabPage = const Menu();
              break;

            default:
              tabPage = const DashboardPage();
              break;
          }
          return tabPage;
        },
      ),
    );*/
  }
}
