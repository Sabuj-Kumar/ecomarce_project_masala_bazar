import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:efgecom/components/buttons/custom_elevated_button.dart';
import 'package:efgecom/config/app_platform_config.dart';

class CustomForm extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final String submitButtonText;
  final Color? submitButtonColor;
  final Color? submitTextColor;
  final Color? submitIconColor;
  final Function onSubmit;
  final IconData? submitIcon;
  final VoidCallback? onChanged;
  final WillPopCallback? onWillPop;
  final AutovalidateMode? autovalidateMode;
  const CustomForm({
    Key? key,
    required this.child,
    required this.submitButtonText,
    required this.onSubmit,
    this.backgroundColor,
    this.submitButtonColor,
    this.submitTextColor,
    this.submitIconColor,
    this.submitIcon,
    this.onChanged,
    this.onWillPop,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS ||
        CURRENT_PLATFORM == PLATFORM_MACOS) {
      return Form(
        key: _formKey,
        autovalidateMode: widget.autovalidateMode,
        onChanged: widget.onChanged,
        onWillPop: widget.onWillPop,
        child: Column(
          children: [
            CupertinoFormSection.insetGrouped(
              backgroundColor: Colors.transparent,
              margin: const EdgeInsets.all(10),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:
                        widget.backgroundColor ?? Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.child,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
              child: CustomElevatedButton(
                text: widget.submitButtonText,
                textColor: widget.submitTextColor,
                icon: widget.submitIcon,
                iconColor: widget.submitIconColor,
                backgroundColor: widget.submitButtonColor,
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  if (_formKey.currentState!.validate()) {
                    widget.onSubmit();
                  }
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Form(
        key: _formKey,
        autovalidateMode: widget.autovalidateMode,
        onChanged: widget.onChanged,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.child,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomElevatedButton(
                text: widget.submitButtonText,
                textColor: widget.submitTextColor,
                icon: widget.submitIcon,
                iconColor: widget.submitIconColor,
                backgroundColor: widget.submitButtonColor,
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  if (_formKey.currentState!.validate()) {
                    widget.onSubmit();
                  }
                },
              ),
            ),
          ],
        ),
        onWillPop: widget.onWillPop,
      );
    }
  }
}


// CustomForm(
//                 // key: _formKey,
//                 autovalidateMode: AutovalidateMode.disabled,
//                 child: Column(
//                   children: [
//                     CustomInputFormField(
//                       controller: _typeAheadController,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       prefix: Text(
//                         'Mobile',
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//                       placeholder: 'Enter text',
//                       style: Theme.of(context).textTheme.bodyText1,
//                       inputDecoration: TextFieldStyle.getBorderLessStyle(
//                           context,
//                           labeltext: "Mobile"),
//                       cursorColor: Theme.of(context).textTheme.bodyText1!.color,
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a value';
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     const Divider(),
//                     CustomInputFormField(
//                       controller: _typeAheadController,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       prefix: Text(
//                         'Mobile',
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//                       placeholder: 'Enter text',
//                       style: Theme.of(context).textTheme.bodyText1,
//                       inputDecoration: TextFieldStyle.getBorderLessStyle(
//                           context,
//                           labeltext: "Mobile"),
//                       cursorColor: Theme.of(context).textTheme.bodyText1!.color,
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a value';
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),