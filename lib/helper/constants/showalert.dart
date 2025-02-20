import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';

class InfoAlertBox {
  static void show({
    required BuildContext context,
    String title = "Info",
    String content = "",
    String buttonText = "OK",
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    TextStyle? buttonStyle,
    Color backgroundColor = cWhiteColor,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: titleStyle ??
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Text(
              content,
              textAlign: TextAlign.start,
              style: contentStyle ?? TextStyle(fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                buttonText,
                style: buttonStyle ?? const TextStyle(color: cBlackColor),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
