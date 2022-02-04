import 'package:flutter/material.dart';

class TextFieldStyle {
  static InputDecoration getBorderLessStyle(BuildContext context,
      {String? hint, String? labeltext}) {
    return InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      hintText: hint,
      labelText: labeltext,
      labelStyle: Theme.of(context).textTheme.bodyText1,
    );
  }
}
