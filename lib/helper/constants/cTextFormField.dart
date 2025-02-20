import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';

class CTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double? width;
  final TextStyle? hintstyle;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final bool obsecureText;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Function(String value)? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final Color? fillcolor;
  final bool? isfilled;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? labelStyle;
  final Widget? label;
  final OutlineInputBorder? border;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final Widget? prefix;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final BorderSide? borderSide;
  final bool? readOnly;
  final String? suffixText;
  final TextStyle? suffixStyle; 
  final Function(String value)? onChanged;
  const CTextFormField({
    Key? key,
    this.controller,
    this.textAlign,
    this.maxLines,
    this.isfilled = false,
    this.width,
    this.decoration,
    this.contentPadding,
    this.onTap,
    this.border,
    this.fillcolor,
    this.inputFormatters,
    this.textEditingController,
    this.keyboardType,
    this.hintText,
    this.obsecureText = false,
    this.suffixIcon,
    this.hintstyle,
    this.labelStyle,
    this.prefixIcon,
    this.label,
    this.validator,
    this.borderRadius,
    this.prefix,
    this.enabledBorder,
    this.focusedBorder,
    this.borderSide,
    this.maxLength,
    this.readOnly,
    this.suffixText,
    this.suffixStyle,
    this.onChanged, 
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly == null ? false : true,
      cursorColor: Colors.grey,
      controller: controller,
      maxLines: maxLines ?? 1,
      onTap: () {},
      onChanged: onChanged,
      obscureText: obsecureText,
      validator: validator,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.start,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 0),
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        suffixStyle: suffixStyle,
        fillColor: fillcolor ?? cWhiteColor,
        filled: true,
        hintText: hintText,
        label: label,
        labelStyle:
            labelStyle ?? TextStyle(color: cBlackColor.withOpacity(0.32)),
        hintStyle: hintstyle ??
            TextStyle(
              color: cBlackColor,
            ),
        prefixIcon: prefixIcon,
        prefix: prefix,
        alignLabelWithHint: true,
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: borderSide ??
                  BorderSide(width: 1, color: cBlackColor.withOpacity(0.32)),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide:
                  BorderSide(color: cBlackColor.withOpacity(0.32), width: 1),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 165, 161, 161).withOpacity(0.32),
                  width: 1),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
      ),
    );
  }
}
