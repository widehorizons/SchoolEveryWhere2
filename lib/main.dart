import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/config/Constants/prefs_keys.dart';
import 'app/config/utils/prefs.dart';
import 'app/routes/app_pages.dart';
import 'inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await boot();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: (Prefs.getString(PrefsKeys.token).isNotEmpty)
          ? Routes.HOME
          : Routes.LOGIN,
      getPages: AppPages.routes,
      // theme: appLightTheme,
      themeMode: ThemeMode.dark,
      // darkTheme: appDarkTheme,
    ),
  );
}
