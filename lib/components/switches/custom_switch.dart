import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/app_platform_config.dart';

class CustomSwitch extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  const CustomSwitch(
      {Key? key, required this.initialValue, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS ||
        CURRENT_PLATFORM == PLATFORM_MACOS) {
      return CupertinoSwitch(
        value: initialValue,
        onChanged: onChanged,
      );
    } else {
      return Switch(
        value: initialValue,
        onChanged: onChanged,
      );
    }
  }
}
