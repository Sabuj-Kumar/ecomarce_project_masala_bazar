import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? obscureCharacter;
  final int? maxLength;
  final String? levelText;
  final Widget? prefixIcon;
  final bool? suffixVisibilityIcon;
  final String? hintText;
  final String? errorText;
  final bool? obscured;

  const CustomTextField({
    Key? key,
    this.controller,
    this.textInputAction,
    this.prefixIcon,
    this.keyboardType,
    this.obscureCharacter,
    this.maxLength,
    this.levelText,
    this.suffixVisibilityIcon,
    this.hintText,
    this.errorText,
    this.obscured
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool obscure = false;
  @override
  void initState() {
    obscure = widget.obscured ?? false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      textAlignVertical: obscure?TextAlignVertical.bottom:TextAlignVertical.center,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscureCharacter!,
      obscureText: obscure,
      maxLength: widget.maxLength,
      style: CustomTextStyle.body(context).copyWith(
        color: Colors.black,fontSize: 12.0.w,fontWeight: FontWeight.w400
      ),
      decoration: InputDecoration(
          errorText: widget.errorText,
          errorStyle: CustomTextStyle.body(context).copyWith(
            color: Colors.red,
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 1.0,
                  style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 1.3,
                  style: BorderStyle.solid)),
          labelText: widget.levelText,
          labelStyle:
              CustomTextStyle.subHeader2(context).copyWith(color: Colors.black),
          hintText: widget.hintText,
          hintStyle: CustomTextStyle.body(context).copyWith(color: textLight),

          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixVisibilityIcon!
              ? obscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: const Icon(Icons.visibility_off_outlined,color: Colors.grey,))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: const Icon(Icons.visibility_outlined,color: secondaryColor,))
              : null),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Validation(value,widget.hintText).emptyCheck();
        } else if(value.isNotEmpty){
          return Validation(value,widget.hintText).checkValidation();
        }
        return null;
      },
    );
  }
}

class Validation {

  String? value;
  String? hintText;

  Validation(this.value,this.hintText);

  String emptyCheck() {
    return "$hintText.";
  }

  String? checkValidation() {
    return null;
  }


}
