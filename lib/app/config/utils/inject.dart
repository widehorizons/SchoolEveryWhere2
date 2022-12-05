import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> boot() async {
  /// ensure fulutter is initalized with the native platform
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(await SharedPreferences.getInstance());
  Get.put(Connectivity());

  /// inject service
}
