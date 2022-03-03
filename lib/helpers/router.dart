import 'package:efgecom/pages/sinInAndsignUpPage/view/forget_password_page.dart';
import 'package:efgecom/pages/sinInAndsignUpPage/view/sign_up_page.dart';
import 'package:efgecom/pages/wrapper.dart';
import 'package:fluro/fluro.dart';
import 'package:efgecom/pages/mainPage/mainPage.dart';
import 'package:flutter/cupertino.dart';

import '../pages/Product_Details_Page/Pages/product_details_main_page.dart';
import '../pages/sinInAndsignUpPage/view/reset_password_page.dart';
import '../pages/sinInAndsignUpPage/view/sign_in_page.dart';
import '../pages/sinInAndsignUpPage/view/update_password.dart';

class PageRouter {
  static FluroRouter router = FluroRouter();
  //Define  your routers here
  static void setupRouter() {
    router.define('/',
        handler: _appHandler, transitionType: TransitionType.fadeIn);
    router.define('/mainPage',
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
    router.define('/signInPage', handler: _signInHandler,transitionType: TransitionType.fadeIn);
    router.define('/signUpPage', handler: _singUpHandler,transitionType: TransitionType.fadeIn);
    router.define('/forgetPassPage', handler: _forgetPassHandler,transitionType: TransitionType.fadeIn);
    router.define('/resetPassPage/:number', handler: _resetPassHandler,transitionType: TransitionType.fadeIn);
    router.define('/updatePassPage', handler: _updatePassHandler,transitionType: TransitionType.fadeIn);
    router.define('/productDetailsPage', handler: _productDetailHandler,transitionType: TransitionType.fadeIn);

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
  static final Handler _signInHandler =  Handler(handlerFunc: (context,Map<String,dynamic> params) => const SignInPage());
  static final Handler _singUpHandler = Handler(handlerFunc: (context,Map<String,dynamic> params) => const SignUpPage());
  static final Handler _forgetPassHandler = Handler(handlerFunc: (context,Map<String,dynamic> params) => const ForgetPasswordPage());
  static final Handler _resetPassHandler = Handler(handlerFunc: (context,Map<String,dynamic> params) => ResetPasswordPage(number: params['number'][0]));
  static final Handler _updatePassHandler = Handler(handlerFunc: (context,Map<String,dynamic> params) => const UpdatePasswordPage());
  static final Handler _productDetailHandler = Handler(handlerFunc: (context,Map<String,dynamic> params) => const ProductDetailsPage());
}
