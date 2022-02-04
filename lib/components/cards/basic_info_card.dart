import 'package:flutter/material.dart';
import 'package:efgecom/config/theme_config.dart';

// ignore: must_be_immutable
class BasicInfoCard extends StatelessWidget {
  BasicInfoCard(
      {Key? key,
      required this.title,
      this.subtitle,
      this.subtitleColor,
      required this.icon,
      this.total,
      required this.value,
      this.color,
      this.onTap})
      : super(key: key);

  final String title;
  double? total;
  final IconData icon;
  String? subtitle;
  Color? subtitleColor;
  final double value;
  Color? color = Colors.blue;
  GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
                  (color ?? Theme.of(context).primaryColor).withOpacity(0.15)),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Icon(
                icon,
                color: color,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: title,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    subtitle != null
                        ? Text(
                            subtitle ?? "",
                            style: TextStyle(
                                color: subtitleColor ??
                                    Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            Text(total != null ? total.toString() : "")
          ],
        ),
      ),
    );
  }
}
