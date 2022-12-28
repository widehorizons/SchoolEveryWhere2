import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../config/tr/lang_controller.dart';

class SettingsController extends GetxController {
  static final themeManager = getThemeManager(Get.context!);
  // static final themeManager = Get.put(ThemeManager());
  /// Controller for playback
  late RiveAnimationController riveController;
  SMIInput<bool>? _darkButtonInput;
  Artboard? darkButtonArtboard;

  /// Toggles between play and pause animation states
  void _togglePlay() => riveController =
      SimpleAnimation(isDarkMode.value ? 'On' : 'Off', autoplay: false);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => riveController.isActive;

  Rx<bool> isDarkMode = themeManager.isDarkMode.obs;
  Rx<String> dropdownvalue = Get.locale!.languageCode.obs;
  void toggleDarkMode(BuildContext context) {
    isDarkMode.value = !isDarkMode.value;
    themeManager.toggleDarkLightTheme();
    log("${getThemeManager(context).isDarkMode} ${getThemeManager(context).lightTheme} ${getThemeManager(context).getSelectedTheme().selectedTheme} ${getThemeManager(context).themes} ${getThemeManager(context).darkTheme} ${getThemeManager(context).initialTheme.selectedTheme} ${getThemeManager(context).initialTheme.themeMode}");
    _darkButtonInput!.value = isDarkMode.value ? true : false;
    update();
  }

  changeLanguage(String languageCode) {
    LanguageController.updateLang(Locale(languageCode));
    update();
  }

  final count = 0.obs;

  void increment() => count.value++;
  // void _playPauseButtonAnimation() {
  //   if (_darkButtonInput?.value == false &&
  //       _darkButtonInput?.controller.isActive == false) {
  //     _darkButtonInput?.value = true;
  //   } else if (_darkButtonInput?.value == true &&
  //       _darkButtonInput?.controller.isActive == false) {
  //     _darkButtonInput?.value = false;
  //   }
  // }

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
      darkButtonArtboard = artboard;
    });
    super.onInit();
  }
}
