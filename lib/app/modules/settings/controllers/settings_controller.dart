import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Rx<bool> isDarkMode = Get.isDarkMode.obs;
  Rx<String> dropdownvalue = Get.locale!.languageCode.obs;
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }

  changeLanguage(String languageCode) {
    Get.updateLocale(Locale(languageCode));
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
