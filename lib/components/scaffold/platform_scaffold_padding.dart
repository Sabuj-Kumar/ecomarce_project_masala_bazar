import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/app_platform_config.dart';

class PlatformPadding {
  static Widget topPadding() {
    if (CURRENT_PLATFORM == PLATFORM_IOS) {
      return const SizedBox(
        height: 100,
      );
    } else {
      return const SizedBox();
    }
  }

  static Widget bottomPadding() {
    if (CURRENT_PLATFORM == PLATFORM_IOS) {
      return const SizedBox(
        height: 100,
      );
    } else {
      return const SizedBox(
        height: 100,
      );
    }
  }
}
