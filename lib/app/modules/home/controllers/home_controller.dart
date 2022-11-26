import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_every_where_v2/app/modules/chat_rooms/views/chat_rooms_view.dart';
import 'package:school_every_where_v2/app/modules/menu/views/menu_view.dart';
import 'package:school_every_where_v2/app/modules/notifications/views/notifications_view.dart';
import 'package:school_every_where_v2/app/modules/profile/views/profile_view.dart';

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
}
