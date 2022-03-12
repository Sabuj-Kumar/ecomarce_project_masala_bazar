import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:efgecom/pages/wrapper.dart';
import 'package:efgecom/providers/user_provider.dart';

import '../../providers/language_provider.dart';

class Menu extends StatefulWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String theme = 'light';
  String langCode = 'en';
  @override
  void initState() {
    super.initState();
  }

  void init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("PREF_LANG")) {
      langCode = sharedPreferences.getString("PREF_LANG") ?? "en";
    }

    if (sharedPreferences.containsKey("PREF_THEME")) {
      theme = sharedPreferences.getString("PREF_THEME") ?? "light";
    }
  }

  setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("PREF_LANG")) {
      langCode = prefs.getString("PREF_LANG") ?? "en";
      Wrapper.setLocale(context, langCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = Provider.of<LanguageProvider>(context,listen: false);
    return CustomScaffold(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            // DrawerHeader(
            //   child: Image.asset("assets/images/logo.png"),
            // ),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Navigator.of(context).pushNamed('/mainPage?index=0');
              },
            ),
            DrawerListTile(
              title: "Index 1",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                Navigator.of(context).pushNamed('/mainPage?index=1');
              },
            ),
            DrawerListTile(
              title: "Pop",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                Navigator.pop(context);
                // Navigator.of(context).pushNamed('/products');
              },
            ),
            DrawerListTile(
              title: "Sign In",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                Navigator.pushNamed(context, "signInPage");
              },
            ),
            DrawerListTile(
              title: "Store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              title: langCode == 'en' ? "বাংলা" : "English",
              svgSrc: "assets/icons/unknown.svg",
              press: () async {
                langCode = langCode == 'en' ? 'bn' : 'en';
                await Wrapper.setLocale(context, langCode);
                languageCode.setLanguageCode(langCode);
                setState(() {});
              },
            ),
            DrawerListTile(
              title: "Dark/Light Theme",
              svgSrc: "assets/icons/dark-mode.svg",
              press: () {
                theme = theme == 'light' ? 'dark' : 'light';
                Wrapper.setTheme(context, theme);
                setState(() {});
              },
            ),
            DrawerListTile(
              title: "Logout",
              svgSrc: "assets/icons/logout.svg",
              press: () {
                context.read<UserProvider>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Theme.of(context).textTheme.bodyText1!.color,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
      ),
    );
  }
}
