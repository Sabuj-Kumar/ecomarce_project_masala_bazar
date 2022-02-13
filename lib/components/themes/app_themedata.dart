import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';

class AppThemeData {
  // static Color themeColor = Colors.blue;
  // // static Color _themeColor = Color.fromRGBO(0, 180, 255, 1);
  // static MaterialColor materialColor = Colors.blue;

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: primaryColor,
      primaryColor: primaryColor,
      backgroundColor: Colors.white,
      cardColor: Colors.grey[300],
      // scaffoldBackgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: bgColor,
      fontFamily: 'Inter',
      textTheme:  const TextTheme(
        bodyText1: TextStyle(
          color: secondaryColor,
        ),
        bodyText2: TextStyle(
          color: secondaryColor,
        ),
        headline1: TextStyle(
          color: secondaryColor,
        ),
        headline2: TextStyle(
          color: secondaryColor,
        ),
        headline3: TextStyle(
          color: secondaryColor,
        ),
        headline4: TextStyle(
          color: secondaryColor,
        ),
        headline5: TextStyle(
          color: secondaryColor,
        ),
        headline6: TextStyle(
          color: secondaryColor,
        ),
        subtitle1: TextStyle(
          color: secondaryColor,
        ),
        caption: TextStyle(
          color: secondaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: primaryColor.withOpacity(.7),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: materialColor,
      primaryColor: primaryColor,
      backgroundColor: Colors.black38,
      cardColor: CupertinoColors.darkBackgroundGray,
      scaffoldBackgroundColor: const Color.fromRGBO(20, 20, 20, 1),
      textTheme: TextTheme(
        bodyText1: const TextStyle(
          color: Colors.white,
        ),
        bodyText2: const TextStyle(
          color: primaryColor,
        ),
        headline1: const TextStyle(
          color: Colors.white,
        ),
        headline2: const TextStyle(
          color: Colors.white,
        ),
        headline3: const TextStyle(
          color: Colors.white,
        ),
        headline4: const TextStyle(
          color: Colors.white,
        ),
        headline5: const TextStyle(
          color: Colors.white,
        ),
        headline6: const TextStyle(
          color: Colors.white,
        ),
        subtitle1: const TextStyle(
          color: Colors.white,
        ),
        caption: TextStyle(
          color: Colors.grey[300],
        ),
      ),
      appBarTheme: AppBarTheme(
        color: primaryColor.withOpacity(.3),
      ),
    );
  }
}
