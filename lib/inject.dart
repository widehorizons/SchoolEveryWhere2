import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> boot() async {
  /// ensure fulutter is initalized with the native platform
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(await SharedPreferences.getInstance());

  /// inject service
}
