import 'package:flutter/material.dart';
import 'package:efgecom/helpers/router.dart';
import 'package:efgecom/pages/wrapper.dart';
import 'package:url_strategy/url_strategy.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  PageRouter.setupRouter();
  setPathUrlStrategy();
  runApp(const Wrapper());
}
