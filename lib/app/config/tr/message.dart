import 'dart:ui';

import 'package:get/get.dart';

import '../Constants/prefs_keys.dart';
import '../utils/prefs.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';

class Lang extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
        'fr': fr,
      };
  static Locale get initialLanguage => (Prefs.getString(PrefsKeys.lang).isEmpty)
      ? (Get.deviceLocale ?? const Locale('en'))
      : Locale(
          Prefs.getString(PrefsKeys.lang),
        );
}
