import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalCustomBody extends StatelessWidget {
  final String modalTitle;
  final Widget child;
  const ModalCustomBody(
      {Key? key, required this.modalTitle, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
        navigationBar: CupertinoNavigationBar(
            backgroundColor: Theme.of(context).cardColor,
            leading: Container(),
            middle: Text(
              modalTitle,
              style: Theme.of(context).textTheme.bodyText1,
            )),
        child: SafeArea(
          bottom: false,
          child: child,
        ),
      ),
    );
  }
}
