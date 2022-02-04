import 'dart:async';
// import 'dart:developer';
import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  ConnectivityService() {
    var setting = false;
    Connectivity().checkConnectivity().then((value) {
      // log("checkConnectivity");
      connectionStatusController.add(value);
      // log(value.toString());
    });
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (!setting) {
        Connectivity().checkConnectivity().then((value) {
          // log("ConnectivityService");
          // log("Before : " + value.toString());
          connectionStatusController.add(value);
          // log("After : " + value.toString());
          setting = false;
        });
      }
    });
  }
  void dispose() {
    connectionStatusController.close();
  }
}
