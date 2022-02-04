import 'package:flutter/material.dart';

class CustomMaterialBanner {
  static show(BuildContext context, IconData icon, String message,
      List<Widget> actions) {
    return ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        leading: Icon(icon),
        backgroundColor: Colors.yellow,
        actions: actions,
      ),
    );
  }
}


// CustomMaterialBanner.show(context, Icons.info, "Test Message", [
//                   IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(Icons.close))
//                 ]);