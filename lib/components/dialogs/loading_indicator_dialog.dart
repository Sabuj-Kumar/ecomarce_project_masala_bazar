import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:efgecom/components/alerts/custom_alert_dialog.dart';
import 'package:efgecom/components/spinners/spinner.dart';

class LoadingIndicatorDialog {
  Future<void> show(String? message) async {
    return await showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: Text(message ?? "Loading..."),
          content: const Center(
            child: Spinner(),
          ),
        );
      },
    );
  }

  Future<void> dismiss() async {
    try {
      if (Navigator.canPop(Get.context!)) {
        Navigator.pop(Get.context!);
      }
    } catch (e) {
      log("[Error::LoadingIndicatorDialog::dismiss]", error: e);
    }
  }
}
