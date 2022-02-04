import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:efgecom/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get currentUser => _user;

  setUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userModelToString(user));
    await prefs.setString('LOGGED_TOKEN', "Bearer " + user.jwt.toString());
    _user = user;
    notifyListeners();
  }

  logout() async {
    _user = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
    Navigator.pushReplacementNamed(Get.context!, "/");
  }
}
