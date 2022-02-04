import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:efgecom/config/app_platform_config.dart';

class CustomInputFormField extends StatelessWidget {
  final Widget? prefix;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final BoxDecoration? boxDecoration;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;
  final ScrollController? scrollController;
  const CustomInputFormField({
    Key? key,
    this.prefix,
    this.placeholder,
    this.placeholderStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
    ),
    this.controller,
    this.initialValue,
    this.focusNode,
    this.boxDecoration,
    this.inputDecoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = false,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CURRENT_PLATFORM == PLATFORM_IOS ||
        CURRENT_PLATFORM == PLATFORM_MACOS) {
      return CupertinoTextFormFieldRow(
        prefix: prefix,
        placeholder: placeholder,
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        decoration: boxDecoration,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign!,
        textAlignVertical: textAlignVertical,
        autofocus: autofocus!,
        readOnly: readOnly!,
        toolbarOptions: toolbarOptions,
        showCursor: showCursor,
        obscureText: obscureText!,
        autocorrect: autocorrect!,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        enableSuggestions: enableSuggestions!,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands!,
        maxLength: maxLength,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        validator: validator,
        inputFormatters: inputFormatters,
        enabled: enabled,
        cursorWidth: cursorWidth!,
        cursorHeight: cursorHeight,
        cursorColor: cursorColor,
        keyboardAppearance: keyboardAppearance,
        enableInteractiveSelection: enableInteractiveSelection!,
        selectionControls: selectionControls,
        scrollPhysics: scrollPhysics,
        autofillHints: autofillHints,
        // autovalidateMode: autovalidateMode,
      );
    } else {
      return TextFormField(
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        decoration: inputDecoration,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign!,
        textAlignVertical: textAlignVertical,
        autofocus: autofocus!,
        readOnly: readOnly!,
        toolbarOptions: toolbarOptions,
        showCursor: showCursor,
        obscureText: obscureText!,
        autocorrect: autocorrect!,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        enableSuggestions: enableSuggestions!,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands!,
        maxLength: maxLength,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        validator: validator,
        inputFormatters: inputFormatters,
        enabled: enabled,
        cursorWidth: cursorWidth!,
        cursorHeight: cursorHeight,
        cursorColor: cursorColor,
        keyboardAppearance: keyboardAppearance,
        enableInteractiveSelection: enableInteractiveSelection!,
        selectionControls: selectionControls,
        buildCounter: buildCounter,
        scrollPhysics: scrollPhysics,
        autofillHints: autofillHints,
        autovalidateMode: autovalidateMode,
        scrollController: scrollController,
      );
    }
  }
}
