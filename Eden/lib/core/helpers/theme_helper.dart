import 'package:flutter/material.dart';

ThemeMode getThemeMode(String type) {
  var themeMode = ThemeMode.system;
  switch (type) {
    case 'system':
      themeMode = ThemeMode.system;
      break;
    case 'dark':
      themeMode = ThemeMode.dark;
      break;
    default:
      themeMode = ThemeMode.light;
      break;
  }

  return themeMode;
}
