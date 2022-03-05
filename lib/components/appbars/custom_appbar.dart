import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/config/app_platform_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/custom_text_style.dart';

// import 'package:efgecom/providers/menu_provider.dart';

class CustomAppbar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final bool? centerTitle;
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Brightness? brightness;

  const CustomAppbar(
      {Key? key,
      this.leading,
      this.automaticallyImplyLeading = false,
      this.centerTitle = false,
      required this.title,
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
        middle:
            Text(title.toString(), style: CustomTextStyle.subHeader1(context)),
        trailing: actions != null ? actions![0] : const SizedBox(),
        brightness: brightness,
      );
    } else {
      return AppBar(
          elevation: 0,
          backgroundColor: deepBgColor,
          automaticallyImplyLeading: automaticallyImplyLeading!,
          leading: leading ?? InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: secondaryColor,
              size: 20.h,
            ),
          ),
          title: Text(title.toString(),
              style: CustomTextStyle.subHeader1(context)),
          centerTitle: centerTitle,
          actions: actions ?? [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  width: 23.w,
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/notification_bell.svg',
                  width: 23.w,
                ),
              ),
            ),
            SizedBox(
              width: 22.5.w,
            ),
          ],
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor));
    }
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(75.h);
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}
