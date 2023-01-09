import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/users/Student.dart';
import '../../../services/homeScreen/home_service.dart';

class MenuController extends GetxController {
  final _service = Get.find<HomeService>();
  final code = TextEditingController();

  getHomeScreenIcons() async {
    try {
      await _service.studetnHomeScreen(
          student: Student(
        id: '1612201951404',
        academicYear: '2019/2020',
        section: '26',
      ));
    } catch (e) {
      log(e.toString(), stackTrace: StackTrace.current);
    }
  }

  @override
  void onInit() {
    getHomeScreenIcons();
    super.onInit();
  }
}
