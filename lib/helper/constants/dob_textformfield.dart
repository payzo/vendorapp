import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';

class CDatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry contentPadding;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final Color fillColor;
  final Color suffixIconColor;
  final TextStyle? textStyle;

  const CDatePickerField({
    Key? key,
    required this.controller,
    this.hintText = "yyyy-mm-dd",
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.validator,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor = cWhiteColor,
    this.suffixIconColor = Colors.grey,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      keyboardType: TextInputType.number,
      controller: controller,
      autocorrect: true,
      style: textStyle ?? TextStyle(color: cBlackColor.withOpacity(.7)),
      onTap: () async {
        DateTime currentDate = DateTime.now();
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate ?? currentDate,
          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? currentDate,
        );
        if (pickedDate != null) {
          // Format date as yyyy-MM-dd
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
        contentPadding: contentPadding,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
        border: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
        filled: true,
        fillColor: fillColor,
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          size: 20,
          color: suffixIconColor,
        ),
      ),
      validator: validator,
    );
  }
}
