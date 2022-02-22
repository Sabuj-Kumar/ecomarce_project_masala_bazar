import 'package:efgecom/pages/wrapper.dart';
import 'package:fluro/fluro.dart';
import 'package:efgecom/pages/mainPage/mainPage.dart';

class PageRouter {
  static FluroRouter router = FluroRouter();
  //Define  your routers here
  static void setupRouter() {
    router.define('/',
        handler: _appHandler, transitionType: TransitionType.fadeIn);
    router.define('/mainPage',
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
  }

  //Add your handlers here
  static final Handler _appHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => AppHandler());
  static final Handler _homeHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    var index = params['index']?.first;
    if (index != null) {
      return MainPage(index: int.parse(index.toString()));
    } else {
      return const MainPage();
    }
  });
}
