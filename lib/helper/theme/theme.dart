import 'package:flutter/material.dart';
import '../constants/colors.dart';

ThemeData appTheme = ThemeData(
    primaryColor: cPrimaryColor,
    scaffoldBackgroundColor: cWhiteColor,
    brightness: Brightness.light,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    // textTheme:
    //     GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
    fontFamily: "Roboto",
    appBarTheme: AppBarTheme(
      color: cWhiteColor,
      surfaceTintColor: cWhiteColor,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      disabledColor: cLightGreyColor,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: cPrimaryColor,
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: cAccentColor)
        .copyWith(surface: cWhiteColor));
