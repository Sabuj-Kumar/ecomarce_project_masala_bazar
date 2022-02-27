import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldHeader extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final bool allowBack;

  const ScaffoldHeader({
    Key? key,
    required this.title,
    this.titleColor,
    this.subtitle,
    this.trailing,
    this.padding,
    this.allowBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 10, top: 10),
      child: ListTile(
        leading: allowBack
            ? SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ),
              )
            : null,
        title: Hero(
          tag: title,
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  color: titleColor ??
                      Theme.of(context).textTheme.bodyText1!.color),
            ),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle ?? "",
                style: TextStyle(
                    fontSize: 20,
                    color: titleColor ??
                        Theme.of(context).textTheme.bodyText1!.color),
              )
            : const SizedBox(),
        trailing: trailing,
      ),
    );
  }
}
