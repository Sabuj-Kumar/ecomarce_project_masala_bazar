import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:efgecom/components/scaffold/platform_scaffold_padding.dart';
import 'package:efgecom/components/scaffold/scaffold_header.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final ScaffoldHeader? header;
  final BottomNavigationBar? bottomNavigationBar;
  // ignore: use_key_in_widget_constructors
  const CustomScaffold(
      {required this.child, this.header, this.backgroundColor,this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              // header ?? const SizedBox(),
              child,
              PlatformPadding.bottomPadding(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
    // if (CURRENT_PLATFORM == PLATFORM_IOS) {
    //   return CupertinoPageScaffold(
    //     backgroundColor: backgroundColor,
    //     resizeToAvoidBottomInset: false,
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height,
    //       child: ListView(
    //         children: [
    //           PlatformPadding.topPadding(),
    //           header ?? const SizedBox(),
    //           child,
    //           PlatformPadding.bottomPadding(),
    //         ],
    //       ),
    //     ),
    //   );
    // } else {
    //   return Scaffold(
    //     backgroundColor: backgroundColor,
    //     body: SafeArea(
    //       bottom: false,
    //       child: SizedBox(
    //         height: MediaQuery.of(context).size.height,
    //         child: ListView(
    //           children: [
    //             header ?? const SizedBox(),
    //             child,
    //             PlatformPadding.bottomPadding(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}
