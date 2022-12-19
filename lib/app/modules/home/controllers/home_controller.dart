import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/utils/prefs.dart';
import '../../../routes/app_pages.dart';
import '../../chat_rooms/views/chat_rooms_view.dart';
import '../../menu/views/menu_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../../profile/views/profile_view.dart';

class HomeController extends GetxController {
  final int? activeIndex = Get.arguments;
  final screens = const <Widget>[
    MenuView(),
    ChatRoomsView(),
    NotificationsView(),
    ProfileView()
  ];

  final index = 0.obs;

  @override
  void onInit() {
    index.value = activeIndex ?? 0;
    super.onInit();
  }

  void changeIndex(int ind) {
    index.value = ind;
  }

  void logOut() {
    Prefs.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
