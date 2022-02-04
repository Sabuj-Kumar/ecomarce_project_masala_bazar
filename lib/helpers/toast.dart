import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:efgecom/config/app_platform_config.dart';

class CustomToast {
  static show(
      {String? title, required String message, Color? backgroundColor}) {
    try {
      if (CURRENT_PLATFORM == PLATFORM_IOS ||
          CURRENT_PLATFORM == PLATFORM_MACOS) {
        showDialog<void>(
          context: Get.context!,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: title == null ? null : Text(title),
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Close'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            );
          },
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: backgroundColor,
          ),
        );
      }
    } catch (e) {
      log("Error [CutomToast::Show]", error: e);
    }
  }
}
