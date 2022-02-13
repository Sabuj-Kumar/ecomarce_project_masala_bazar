import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:efgecom/helpers/router.dart';
import 'package:efgecom/pages/wrapper.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PageRouter.setupRouter();
  setPathUrlStrategy();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: bgColor,
          statusBarIconBrightness: Brightness.dark));
  runApp(const Wrapper());
}
