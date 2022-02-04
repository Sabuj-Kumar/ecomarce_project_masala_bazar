import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Color leadingIconBackgroundcolor;
  final GestureTapCallback onPressed;
  const SettingListTile(
      {Key? key,
      required this.title,
      required this.leadingIcon,
      required this.leadingIconBackgroundcolor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: onPressed,
        leading: Container(
            decoration: BoxDecoration(
                color: leadingIconBackgroundcolor,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                leadingIcon,
                color: Colors.white,
              ),
            )),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
      ),
    );
  }
}
