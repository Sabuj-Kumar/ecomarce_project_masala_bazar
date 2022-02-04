import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectionProvider with ChangeNotifier {
  ConnectivityResult _status = ConnectivityResult.none;
  ConnectivityResult get status => _status;
  void setStatus(ConnectivityResult code) {
    _status = code;
    notifyListeners();
  }
}
