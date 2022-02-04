import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/app_platform_config.dart';

class Spinner extends StatelessWidget {
  final double? radius;
  final Color? color;

  const Spinner({Key? key, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS ||
        CURRENT_PLATFORM == PLATFORM_MACOS) {
      return CupertinoActivityIndicator(
        radius: radius ?? 10,
      );
    } else {
      return SizedBox(
        width: (radius ?? 10) * 2,
        height: (radius ?? 10) * 2,
        child: Center(
          child: CircularProgressIndicator(
            color: color,
          ),
        ),
      );
    }
  }
}
