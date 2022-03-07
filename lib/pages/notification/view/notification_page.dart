import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 10.w),
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: searchBarBgColor,
                    child: Image.asset(
                      'assets/img/meat.png',
                    ),
                  ),
                  title: Text(
                    'Lorem ipsum is a placeholder text',
                    style: CustomTextStyle.subHeader1(context),
                  ),
                  subtitle: Text(
                    'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                    style: CustomTextStyle.bodySmall(context).copyWith(color: secondaryColor),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
