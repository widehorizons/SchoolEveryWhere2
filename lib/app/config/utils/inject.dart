import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> boot() async {
  /// ensure fulutter is initalized with the native platform
  ///   await ThemeManager.initialise();

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(await SharedPreferences.getInstance());
  await ThemeManager.initialise();

  Get.put(Connectivity());
  Get.put(ThemeService.getInstance());

  /// inject service
}
