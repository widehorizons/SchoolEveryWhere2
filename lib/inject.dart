import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/services/auth/login.dart';
import 'app/services/homeScreen/home_service.dart';

Future<void> boot() async {
  /// ensure fulutter is initalized with the native platform

  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  Get.put(await SharedPreferences.getInstance());

  Get.put(Connectivity());
  Get.put(ThemeService.getInstance());

  /// inject service

  Get.put(LoginService());
  Get.put(HomeService());
}
