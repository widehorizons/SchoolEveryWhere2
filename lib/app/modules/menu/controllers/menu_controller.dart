import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  Rx<bool> isDarkMode = false.obs;

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}
