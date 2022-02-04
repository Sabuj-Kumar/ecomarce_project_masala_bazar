import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/app_platform_config.dart';

class CustomLeadingButton extends StatelessWidget {
  final Icon icon;
  final String previousPageTitle;
  final GestureTapCallback onPressed;
  const CustomLeadingButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.previousPageTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS) {
      return CupertinoNavigationBarBackButton(
        color: Theme.of(context).primaryColor,
        previousPageTitle: previousPageTitle,
        onPressed: onPressed,
      );
    } else {
      return IconButton(
        onPressed: onPressed,
        icon: icon,
      );
    }
  }
}
