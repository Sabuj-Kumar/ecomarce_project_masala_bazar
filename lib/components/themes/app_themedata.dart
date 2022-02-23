import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:google_fonts/google_fonts.dart';

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
      //fontFamily: 'Inter',
      // textTheme: const TextTheme(
      //   headline1: TextStyle(
      //       color: secondaryColor,
      //       fontWeight: FontWeight.w600
      //   ),
      //   headline2: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold
      //   ),
      //   headline3: TextStyle(
      //       color: buttonColor,
      //       fontWeight: FontWeight.bold
      //   ),
      //   bodyText1: TextStyle(
      //     fontWeight: FontWeight.w400,
      //     color: secondaryColor,
      //   ),
      //   bodyText2: TextStyle(
      //     color: secondaryColor,
      //   ),
      //   subtitle1: TextStyle(
      //     color: secondaryColor,
      //   ),
      //   subtitle2: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.w400
      //   ),
      // ),
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          headline1: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
          ),
          headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
          headline3: TextStyle(
              color: buttonColor,
              fontWeight: FontWeight.bold
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
            color: secondaryColor,
          ),
          bodyText2: TextStyle(
            color: secondaryColor,
          ),
          subtitle1: TextStyle(
            color: secondaryColor,
          ),
          subtitle2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400
          ),
        )
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
      //fontFamily: 'Inter',
      // textTheme: TextTheme(
      //   bodyText1: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   bodyText2: const TextStyle(
      //     color: primaryColor,
      //   ),
      //   headline1: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   headline2: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   headline3: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   headline4: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   headline5: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   headline6: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   subtitle1: const TextStyle(
      //     color: Colors.white,
      //   ),
      //   caption: TextStyle(
      //     color: Colors.grey[300],
      //   ),
      // ),
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: primaryColor,
          ),
          headline1: TextStyle(
            color: Colors.white,
          ),
          headline2: TextStyle(
            color: Colors.white,
          ),
          headline3: TextStyle(
            color: Colors.white,
          ),
          headline4: TextStyle(
            color: Colors.white,
          ),
          headline5: TextStyle(
            color: Colors.white,
          ),
          headline6: TextStyle(
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            color: Colors.white,
          ),
        )
      ),
      appBarTheme: AppBarTheme(
        color: primaryColor.withOpacity(.3),
      ),
    );
  }
}
