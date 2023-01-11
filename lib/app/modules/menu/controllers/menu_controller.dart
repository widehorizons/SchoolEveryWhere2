import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/screen_icon.dart';
import '../../../models/users/student.dart';
import '../../../services/homeScreen/home_service.dart';

class MenuController extends GetxController {
  final _service = Get.find<HomeService>();
  final code = TextEditingController();
  final loading = false.obs;
  final query = RxString('');

  List<ScreenIcon> icons = <ScreenIcon>[].obs;
  List<ScreenIcon> searchedList = <ScreenIcon>[].obs;

  getHomeScreenIcons() async {
    icons.clear();
    loading.value = true;
    try {
      icons.addAll(await _service.studetnHomeScreen(
          student: Student(
        id: '1612201951404',
        academicYear: '2019/2020',
        section: '26',
      )));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    getHomeScreenIcons();
    super.onInit();
  }
}
