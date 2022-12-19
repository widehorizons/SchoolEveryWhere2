import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_drawer.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text('notifications'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
