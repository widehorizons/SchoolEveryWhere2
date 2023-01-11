import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../config/tr/lang_controller.dart';
import '../../menu/controllers/menu_controller.dart';

class SettingsController extends GetxController {
  static final themeManager = getThemeManager(Get.context!);

  late RiveAnimationController riveController;
  SMIInput<bool>? _darkButtonInput;
  Rx<Artboard?> darkButtonArtboard = Rx<Artboard?>(null);

  Rx<bool> isDarkMode = themeManager.isDarkMode.obs;
  Rx<String> dropdownvalue = Get.locale!.languageCode.obs;
  void toggleDarkMode(BuildContext context) {
    isDarkMode.value = !isDarkMode.value;
    themeManager.toggleDarkLightTheme();
    _darkButtonInput!.value = isDarkMode.value ? true : false;
    update();
  }

  changeLanguage(String languageCode) {
    LanguageController.updateLang(Locale(languageCode));
    updateModulesLanguage();
    update();
  }

  updateModulesLanguage() {
    final homePageController = Get.find<MenuController>();
    homePageController.onInit();
  }

  @override
  void onInit() {
    rootBundle.load('assets/riveAssets/dark-and-light-mode.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(
        artboard,
        'dark',
      );
      if (controller != null) {
        artboard.addController(controller);
        _darkButtonInput = controller.findInput('isDark');
      }

      darkButtonArtboard.value = artboard;
      _darkButtonInput!.value = isDarkMode.value ? true : false;
    });
    super.onInit();
  }
}
