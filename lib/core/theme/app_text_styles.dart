import 'package:flutter/material.dart';
class AppTextStyles {
  AppTextStyles._();
  static TextStyle get headline1 =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5);
  static TextStyle get headline2 =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -0.3);
  static TextStyle get headline3 =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle get bodyLarge =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal, height: 1.5);
  static TextStyle get bodyMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal, height: 1.4);
  static TextStyle get bodySmall =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  static TextStyle get caption =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w300, letterSpacing: 0.4);
  static TextStyle get button =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5);
}