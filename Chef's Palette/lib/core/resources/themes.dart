import 'package:chef/core/resources/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.green,
      secondary: Colors.white,
    ),
  );
  //
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.green,
      secondary: Colors.white,
    ),
  );
}
