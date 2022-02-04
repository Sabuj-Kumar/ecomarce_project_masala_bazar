import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:efgecom/components/alerts/custom_alert_dialog.dart';

class CustomSearchModal extends StatefulWidget {
  final String pagetitle;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Widget child;
  final VoidCallback? onSuffixTap;
  final bool? allowPopScope;
  final Function? onPopScope;
  const CustomSearchModal(
      {Key? key,
      required this.pagetitle,
      required this.controller,
      required this.onChanged,
      required this.child,
      this.allowPopScope,
      this.onPopScope,
      this.onSuffixTap})
      : super(key: key);

  @override
  _CustomSearchModalState createState() => _CustomSearchModalState();
}

class _CustomSearchModalState extends State<CustomSearchModal> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
      onWillPop: () async {
        if (widget.allowPopScope == null) {
          if (widget.onPopScope != null) widget.onPopScope!();
          return true;
        }
        if (widget.allowPopScope != null && widget.allowPopScope == true) {
          if (widget.onPopScope != null) widget.onPopScope!();
          return true;
        }
        bool shouldClose = true;
        await showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
                  title: const Text('Should Close?'),
                  actions: <CustomAlertAction>[
                    CustomAlertAction(
                      child: const Text('Yes'),
                      onPressed: () {
                        shouldClose = true;
                        if (widget.onPopScope != null) widget.onPopScope!();
                        Navigator.of(context).pop();
                      },
                    ),
                    CustomAlertAction(
                      child: const Text('No'),
                      onPressed: () {
                        shouldClose = false;
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
        return shouldClose;
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).cardColor,
          middle: Text(
            widget.pagetitle,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          trailing: GestureDetector(
            child: const Icon(Icons.check),
            onTap: () {
              setState(() {
                if (widget.onPopScope != null) widget.onPopScope!();
              });
              Navigator.of(context).pop();
            },
          ),
        ),
        child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSearchTextField(
                      controller: widget.controller,
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: widget.onChanged,
                      onSuffixTap: widget.onSuffixTap,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.child,
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
