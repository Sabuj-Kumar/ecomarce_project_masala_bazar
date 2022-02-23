import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/homePage/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:efgecom/pages/mainPage/dashboard_page.dart';
import 'package:efgecom/pages/menu/side_menu.dart';

import '../../components/navigation_bar/navigation_bar.dart';

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

  List pageList = [
    const HomePage(),
    const DashboardPage(),
    const DashboardPage(),
    const DashboardPage(),
    const Menu(),
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.0,color: bgColor),
            color: bgColor,
          ),

          height: height * 0.13,
          width: width * 0.9,
          child: Column(
            children: [
              NavigationBBar(onClick: (index){
                setState(() {
                  _index = index;
                  print("Index $_index");
                });
              },currentPage: _index,),
            ],
          ),
        ),
      ),
        body: pageList[_index],
    );


      /*CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
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
    );*/
  }
}

