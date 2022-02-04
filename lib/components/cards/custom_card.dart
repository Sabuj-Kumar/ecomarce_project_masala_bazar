import 'package:flutter/material.dart';
import 'package:efgecom/config/theme_config.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  final Widget child;
  double? padding;
  String? title;
  Color? titleColor;
  Color? backgroundColor;
  double? radius;
  CustomCard({
    Key? key,
    required this.child,
    this.title,
    this.titleColor,
    this.padding,
    this.backgroundColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: EdgeInsets.all(padding ?? defaultPadding),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).cardColor.withOpacity(.3),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Text(
                      title!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: titleColor ??
                            Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: title != null ? defaultPadding : 0),
            child,
          ],
        ),
      ),
    );
  }
}
