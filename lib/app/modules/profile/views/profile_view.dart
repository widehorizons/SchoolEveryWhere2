import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_drawer.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text('profile'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
