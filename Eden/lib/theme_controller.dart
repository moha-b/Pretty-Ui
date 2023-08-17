import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static String theme = ThemeOptions.light;

  @override
  void onInit() {
    super.onInit();
    getThemeState();
  }

  Future<void> getThemeState() async {
    return setTheme(ThemeOptions.light);
  }

  Future<void> setTheme(String value) async {
    theme = value;
    if (value == ThemeOptions.light) Get.changeThemeMode(ThemeMode.light);
    if (value == ThemeOptions.dark) Get.changeThemeMode(ThemeMode.dark);
    update();
  }
}

class ThemeOptions {
  static String light = 'light';
  static String dark = 'dark';
}
