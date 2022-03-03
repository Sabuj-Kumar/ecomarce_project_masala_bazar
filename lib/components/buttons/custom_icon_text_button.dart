import 'package:flutter/material.dart';
import 'package:efgecom/config/theme_config.dart';

class CustomIconTextButton extends StatelessWidget {
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
  const CustomIconTextButton({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
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
            mainAxisAlignment: mainAxisAlignment != null
                ? mainAxisAlignment!
                : MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        icon,
                        color: iconColor,
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: errorText == null ? false : true,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              errorText ?? "",
              style: const TextStyle(fontSize: 13, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}


// CustomIconTextButton(
//                 icon: Icons.save,
//                 onPressed: () {
//                   CustomToast.info(message: "Hello world");
//                 },
//                 text: "Toast it now",
//                 iconColor: Theme.of(context).primaryColor,
//                 textColor: Theme.of(context).primaryColor,
//                 backgroundColor: Theme.of(context).primaryColor.withOpacity(.2),
//                 borderColor: Theme.of(context)
//                     .textTheme
//                     .bodyText1!
//                     .color!
//                     .withOpacity(0),
//               ),