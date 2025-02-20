import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';


double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

vGap(double height) {
  return SizedBox(height: height);
}

hGap(double width) {
  return SizedBox(width: width);
}

void showToustMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(message, style: TextStyle(color: cWhiteColor)),
      backgroundColor: cBlackColor));
}

void showGetToustMessage(
  String title,
  String message,
) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: cBlackColor,
      snackPosition: SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      boxShadows: [
        BoxShadow(
          color: cBlackColor.withOpacity(0.2),
          blurRadius: 4,
          spreadRadius: 1,
        ),
      ],
      barBlur: 0,
      maxWidth: 500,
    ),
  );
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 600;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;
bool checkEmailValidation(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool checkPasswordValidation(String password) {
  return RegExp(
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
      .hasMatch(password);
}

bool checkNumberValidation(String numb) {
  return RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(numb);
}

bool checkNameValidation(String name) {
  return RegExp(r'^[A-Za-z]{2,} [A-Za-z]{2,}$').hasMatch(name);
}

bool checkAadharValidation(String num) {
  return RegExp(r'[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(num);
}

bool checkPincodeValidation(String pin) {
  return RegExp(r'^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$').hasMatch(pin);
}

bool checkUpiIdValidation(String upi) {
  return RegExp(r'^[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}$').hasMatch(upi);
}

bool checkOnlyNameValidation(String name) {
  return RegExp(r'^[a-zA-Z]+([ -]?[a-zA-Z]+)*$').hasMatch(name);
}


void showToustMessage2(
    { required String message,}) {
  Get.snackbar(
    "",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: cBlackColor,
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
    duration: const Duration(milliseconds: 1000),
    borderRadius: 8,
  );
}