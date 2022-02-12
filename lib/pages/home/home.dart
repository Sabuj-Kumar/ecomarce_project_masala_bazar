import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:efgecom/pages/home/dashboard_page.dart';
import 'package:efgecom/pages/menu/side_menu.dart';

class HomePage extends StatefulWidget {
  final int? index;

  const HomePage({Key? key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

// @override
// _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 0;

  @override
  void initState() {
    if (widget.index != null) {
      _index = int.parse(widget.index.toString());
    }
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
    return CupertinoTabScaffold(
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
            tabPage = const DashboardPage();
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
    );
  }
}
