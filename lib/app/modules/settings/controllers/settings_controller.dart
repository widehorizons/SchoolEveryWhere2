import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../config/tr/lang_controller.dart';

class SettingsController extends GetxController {
  Rx<bool> isDarkMode = Get.isDarkMode.obs;
  Rx<String> dropdownvalue = Get.locale!.languageCode.obs;
  void toggleDarkMode(BuildContext context) {
    isDarkMode.value = !isDarkMode.value;
    getThemeManager(context).toggleDarkLightTheme();
    log("${getThemeManager(context).isDarkMode} ${getThemeManager(context).lightTheme} ${getThemeManager(context).getSelectedTheme().selectedTheme} ${getThemeManager(context).themes} ${getThemeManager(context).darkTheme} ${getThemeManager(context).initialTheme.selectedTheme} ${getThemeManager(context).initialTheme.themeMode}");

    update();
    // if (isDarkMode.value) {
    //   getThemeManager(context).setThemeMode(ThemeMode.dark);
    // } else {
    //   getThemeManager(context).setThemeMode(ThemeMode.light);
    // }
  }

  changeLanguage(String languageCode) {
    LanguageController.updateLang(Locale(languageCode));
    update();
  }

  final count = 0.obs;

  void increment() => count.value++;
}
