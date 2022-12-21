import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/tr/lang_controller.dart';

class LanguagePickerController extends GetxController {
  final count = 0.obs;
  final hasSelectedLanguage = false.obs;

  void selectLanguage(Locale lang) {
    hasSelectedLanguage.value = true;
    LanguageController.updateLang(lang);
  }
}
