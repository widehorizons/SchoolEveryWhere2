import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // theme: appLightTheme,
      themeMode: ThemeMode.light,
      // darkTheme: appDarkTheme,
    ),
  );
}
