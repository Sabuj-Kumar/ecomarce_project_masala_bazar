import 'dart:convert';
import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:efgecom/providers/cart_provider.dart';
import 'package:efgecom/providers/serarch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:efgecom/components/themes/app_themedata.dart';
import 'package:efgecom/config/app_platform_config.dart';
import 'package:efgecom/helpers/router.dart';
import 'package:efgecom/providers/user_provider.dart';
import 'package:efgecom/services/connectivity_service.dart';

import '../models/featured_product_model.dart';
import '../providers/language_provider.dart';
import 'mainPage/mainPage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  static Future<void> setLocale(
      BuildContext context, String languageCode) async {
    _WrapperState? state = context.findAncestorStateOfType<_WrapperState>();
    await state!.setLocale(languageCode);
  }

  static void setTheme(BuildContext context, String theme) {
    _WrapperState? state = context.findAncestorStateOfType<_WrapperState>();
    state!.setTheme(theme);
  }

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with WidgetsBindingObserver {
  Locale? locale;
  ThemeMode? _preferedTheme;

  @override
  void initState() {
    super.initState();
    // setPrefernces();
    log("==================" + CURRENT_PLATFORM + " PLATFORM ===============");
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      setPrefernces();
    });
  }

  void setPrefernces() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("PREF_LANG")) {
      var lang = sharedPreferences.get("PREF_LANG");
      setLocale(lang);
    } else {
      var lang = 'en';
      setLocale(lang);
    }

    if (sharedPreferences.containsKey("PREF_THEME")) {
      var theme = sharedPreferences.get("PREF_THEME");
      setTheme(theme);
    } else {
      setTheme('light');
    }
  }

  void setTheme(theme) async {
    setState(() {
      if (theme == 'light') {
        _preferedTheme = ThemeMode.light;
      } else {
        _preferedTheme = ThemeMode.dark;
      }
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("PREF_THEME", theme);
  }

  Future<void> setLocale(_languageCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String _countryCode = _languageCode == 'en' ? 'US' : 'BD';
    if (mounted) {
      setState(() {
        locale = Locale(_languageCode, _countryCode);
        sharedPreferences.setString("PREF_LANG", _languageCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
        StreamProvider<ConnectivityResult>.value(
          value: ConnectivityService().connectionStatusController.stream,
          initialData: ConnectivityResult.wifi,
        ),
      ],
      child: Material(
        type: MaterialType.transparency,
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: () => MaterialApp(
            title: 'Xpertcapture',
            debugShowCheckedModeBanner: false,
            themeMode: _preferedTheme ?? ThemeMode.system,
            theme: AppThemeData.light(),
            darkTheme: AppThemeData.dark(),
            onGenerateRoute: PageRouter.router.generator, // routes: routes,
            navigatorKey: Get.key,
            // List all of the app's supported locales here
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('bn', 'BD'),
            ],
            locale: locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AppHandler extends StatefulWidget {
  AppHandler({Key? key}) : super(key: key);

  @override
  State<AppHandler> createState() => _AppHandlerState();
}

class _AppHandlerState extends State<AppHandler> {
  bool checked = false;
  @override
  void initState() {
    super.initState();
    setCartProductQuantity();
  }

  void setCartProductQuantity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("items")){
      log('Contains Ok');
      var itemStr = prefs.getString('items');
      var itemList = jsonDecode(itemStr!);
      for(var el in itemList){
        context.read<CartProvider>().addToCart(FeaturedProductModel.fromMap(el));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // if (!checked && userProvider.currentUser == null) {
    //   checked = true;
    //   SharedPreferences.getInstance().then((prefs) async {
    //     if (prefs.containsKey('user')) {
    //       var userString = prefs.getString('user');
    //       if (userString != null && userString != "") {
    //         var user = jsonDecode(userString);
    //         await userProvider.setUser(UserModel.fromJson(user));
    //       }
    //     }
    //   });
    // }

    // if (userProvider.currentUser != null) {
    //   return const HomePage();
    // } else {
    //   return const AuthPage();
    // }

    return const MainPage();
  }
}
