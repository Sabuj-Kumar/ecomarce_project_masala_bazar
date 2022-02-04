import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/app_platform_config.dart';

// import 'package:efgecom/providers/menu_provider.dart';

class CustomAppbar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final bool? centerTitle;
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Brightness? brightness;

  const CustomAppbar(
      {Key? key,
      this.leading,
      this.automaticallyImplyLeading,
      this.centerTitle = false,
      this.title,
      this.actions,
      this.backgroundColor,
      this.brightness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS) {
      return CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.all(0),
        backgroundColor:
            backgroundColor ?? Theme.of(context).primaryColor.withOpacity(0.2),
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        // leading: leading ??
        //     IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: context.read<MenuProvider>().controlMenu,
        //     ),
        middle: title,
        trailing: actions != null ? actions![0] : const SizedBox(),
        brightness: brightness,
      );
    } else {
      return AppBar(
          // leading: leading ??
          //     IconButton(
          //       icon: const Icon(Icons.menu),
          //       onPressed: context.read<MenuProvider>().controlMenu,
          //     ),
          automaticallyImplyLeading: automaticallyImplyLeading ?? true,
          title: title,
          centerTitle: centerTitle,
          actions: actions,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor));
    }
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(40);
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}
