import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/theme_config.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final GestureTapCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final double? elevation;
  final MainAxisAlignment? mainAxisAlignment;
  final String? errorText;
  final EdgeInsetsGeometry? padding;
  const CustomElevatedButton({
    Key? key,
    this.icon,
    required this.onPressed,
    required this.text,
    this.iconColor,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.elevation,
    this.mainAxisAlignment,
    this.errorText,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              (backgroundColor ?? primaryColor).withOpacity(0.8)),
          foregroundColor: MaterialStateProperty.all<Color>(
              (backgroundColor ?? primaryColor).withOpacity(0.8)),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return (backgroundColor ?? primaryColor).withOpacity(0.9);
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return (Colors.grey);
              }
              return backgroundColor ??
                  primaryColor; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: textColor ?? Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}