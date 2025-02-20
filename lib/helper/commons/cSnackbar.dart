import 'package:flutter/material.dart';

showSnackBar({required String title, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.black,
      content: Text(
        title,
        style: TextStyle(fontSize: 12),
      )));
}
