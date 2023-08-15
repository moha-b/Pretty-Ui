import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/helper/keys/local_storage.dart';

class ThemeController extends GetxController {
  final storage = GetStorage();
  static String theme = ThemeOptions.light;

  @override
  void onInit() {
    super.onInit();
    getThemeState();
  }

  Future<void> getThemeState() async {
    final String? themeInStorage = storage.read(LocalStorageKeys.theme);
    if (themeInStorage != null) {
      return setTheme(themeInStorage);
    } else {
      return setTheme(ThemeOptions.light);
    }
  }

  Future<void> setTheme(String value) async {
    theme = value;
    await storage.write(LocalStorageKeys.theme, value);
    if (value == ThemeOptions.system) Get.changeThemeMode(ThemeMode.system);
    if (value == ThemeOptions.light) Get.changeThemeMode(ThemeMode.light);
    if (value == ThemeOptions.dark) Get.changeThemeMode(ThemeMode.dark);
    update();
  }
}

class ThemeOptions {
  static String system = 'system';
  static String light = 'light';
  static String dark = 'dark';
}
