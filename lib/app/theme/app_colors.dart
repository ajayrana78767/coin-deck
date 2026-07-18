import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFFFC94A);

  static const Color background = Color(0xFF0E1022);
  static const Color backgroundSecondary = Color(0xFF161A34);
  static const Color surface = Color(0xFF1B2040);
  static const Color surfaceElevated = Color(0xFF242A4E);

  static const Color gold = Color(0xFFFFC94A);
  static const Color goldDeep = Color(0xFFE7A93B);
  static const Color purple = Color(0xFF6C63FF);

  static const Color success = Color(0xFF2ECC71);
  static const Color error = Color(0xFFFF5C5C);

  static const Color textPrimary = Color(0xFFF5F6FA);
  static const Color textSecondary = Color(0xFFA7ADC6);
  static const Color textMuted = Color(0xFF6B7196);
  static const Color onGold = Color(0xFF0F1225);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [background, backgroundSecondary],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gold, goldDeep],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [surfaceElevated, surface],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2ECC71), Color(0xFF1FA85C)],
  );

  static const LinearGradient errorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF6B6B), Color(0xFFE84545)],
  );
}
