import 'package:efgecom/config/app_platform_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CustomAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<CustomAlertAction>? actions;

  const CustomAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.actions = const <CustomAlertAction>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS ||
        CURRENT_PLATFORM == PLATFORM_MACOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions!,
      );
    } else {
      return AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: content,
        ),
        actions: actions,
      );
    }
  }
}

class CustomAlertAction extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onPressed;
  const CustomAlertAction(
      {Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS ||
        CURRENT_PLATFORM == PLATFORM_MACOS) {
      return CupertinoDialogAction(
        child: child,
        onPressed: onPressed,
      );
    } else {
      return ElevatedButton(child: child, onPressed: onPressed);
    }
  }
}
