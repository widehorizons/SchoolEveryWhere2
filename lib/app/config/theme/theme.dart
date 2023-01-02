// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff003564);
  static const primaryDarkColor = Color(0xFFE13939);
  static const primaryTypoColor = Color(0xFF172126);
  static const secondaryTypoColor = Color(0xFF676B6F);

  static const scaffoldBackgroundColor = Color(0xFFEFEFEF);
  static const disabled = Color(0xFFF28383);

  static const confirmed = Color(0xFF00AF54);
  static const lightGreyBackground = Color(0xFFF9F9F9);
  static const floatingButtonColor = Color(0xff003564);
  static const confirm = Colors.green;
  static const cancel = Colors.redAccent;
  static const cyan = Color(0xFF30B5B0);
  static const orange = Color(0XFFFFBD73);
  static const yellow = Color(0XFFFEEBC8);
  static const green = Color(0XFF2BC261);
  static const redDark = Color(0XFFDE1F26);
  static const redLight = Color(0XFFFF4348);
  static const stock = Color(0XFFF1F1F1);

  static const black = Color(0xFF000000);
  static const lightGrey = Color(0xFFE1E1E1);
  static const gray1 = Color(0xFFF4F5F9);
  static const gray2 = Color(0xFFE0E0E0);
  static const grayBackground = Color(0xFFE5E5E5);
  static const grayBackgroundLight = Color(0xFFF6F8FC);
  static const shimmerBaseColor = Color.fromARGB(255, 189, 189, 189);
  static const shimmerHighlightColor = Color.fromARGB(255, 201, 200, 200);
  static const white = Color.fromRGBO(255, 255, 255, 1.0);

  static const cyanGradientStart = Color(0xFF30B5B0);
  static const cyanGradientEnd = Color(0xFF00EBE2);

  static const redGradientStart = redDark;
  static const redGradientEnd = Color(0xFFF29432);
  static const vatHint = Color(0xFFC59150);
  static const couponColor = Color(0xFFFEC65E);
}

TextTheme textTheme = TextTheme(
  titleSmall: TextStyle(color: Colors.black),
  titleMedium: TextStyle(color: Colors.black),
  titleLarge: TextStyle(color: Colors.black),
  bodySmall: TextStyle(color: Colors.black),
  bodyMedium: TextStyle(color: Colors.black),
  bodyLarge: TextStyle(color: Colors.black),
  labelSmall: TextStyle(color: Colors.black),
  labelMedium: TextStyle(color: Colors.black),
  labelLarge: TextStyle(color: Colors.black),
);
