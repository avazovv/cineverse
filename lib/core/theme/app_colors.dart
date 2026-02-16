import 'package:flutter/material.dart';
class AppColors {
  AppColors._();
  static const Color primary = Color(0xFFE50914);
  static const Color primaryDark = Color(0xFFB20710);
  static const Color primaryLight = Color(0xFFFF1744);
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkCard = Color(0xFF2A2A2A);
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textLight = Color(0xFF000000);
  static const Color textLightSecondary = Color(0xFF757575);
  static const Color accent = Color(0xFFFFD700);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient backdropGradient = LinearGradient(
    colors: [Colors.transparent, Colors.black87],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}