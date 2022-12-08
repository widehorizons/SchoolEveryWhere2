import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Constants/prefs_keys.dart';
import '../../../config/utils/prefs.dart';

class LanguagePickerController extends GetxController {
  final count = 0.obs;
  final hasSelectedLanguage = false.obs;

  void selectLanguage(Locale lang) {
    hasSelectedLanguage.value = true;
    Get.updateLocale(lang);
    Prefs.setString(PrefsKeys.cookie, lang.languageCode);
  }
}
