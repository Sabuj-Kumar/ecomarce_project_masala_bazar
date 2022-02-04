import 'package:flutter/material.dart';

class IconTextListTile extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final IconData? leadingIcon;
  final Color? leadingIconBackgroundcolor;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
  final GestureTapCallback? onPressed;
  final GestureTapCallback? onTrailingPressed;
  final double? trailingIconSize;
  const IconTextListTile({
    Key? key,
    required this.title,
    this.titleStyle,
    this.leadingIcon,
    this.leadingIconBackgroundcolor,
    this.onPressed,
    this.onTrailingPressed,
    this.trailingIcon,
    this.trailingIconColor,
    this.trailingIconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(.9),
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(.2),
            width: .5,
          ),
          bottom: BorderSide(
            color: Colors.grey.withOpacity(.2),
            width: .5,
          ),
        ),
      ),
      child: ListTile(
        minVerticalPadding: 5,
        onTap: onPressed,
        leading: leadingIcon != null
            ? Container(
                decoration: BoxDecoration(
                    color: leadingIconBackgroundcolor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    leadingIcon,
                    color: Colors.white,
                  ),
                ))
            : null,
        title: Text(
          title,
          style: titleStyle,
        ),
        trailing: IconButton(
          icon: Icon(
            trailingIcon,
            color: trailingIconColor,
            size: trailingIconSize,
          ),
          onPressed: onTrailingPressed,
        ),
      ),
    );
  }
}
