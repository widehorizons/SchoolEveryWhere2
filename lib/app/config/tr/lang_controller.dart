import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/prefs_keys.dart';
import '../utils/prefs.dart';

class LanguageController {
  static Locale get initialLanguage => (Prefs.getString(PrefsKeys.lang).isEmpty)
      ? (Get.deviceLocale ?? const Locale('en'))
      : Locale(
          Prefs.getString(PrefsKeys.lang),
        );
  static updateLang(Locale language) {
    Prefs.setString(PrefsKeys.lang, language.languageCode);
    Get.updateLocale(language);
    log(language.languageCode.toString());
  }
}
