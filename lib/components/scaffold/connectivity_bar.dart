import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Connectivitybar extends StatefulWidget {
  const Connectivitybar({Key? key}) : super(key: key);

  @override
  _ConnectivitybarState createState() => _ConnectivitybarState();
}

class _ConnectivitybarState extends State<Connectivitybar> {
  @override
  Widget build(BuildContext context) {
    final connectionStatus = Provider.of<ConnectivityResult>(context);
    return connectionStatus == ConnectivityResult.none
        ? Material(
            child: Container(
              color: connectionStatus == ConnectivityResult.none
                  ? Colors.red
                  : Colors.transparent,
              child: const Center(
                child: Text(
                  "No internet connection",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
