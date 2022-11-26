import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_every_where_v2/app/config/theme/theme.dart';

import '../../../widgets/custom_drawer.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text(
          'MenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
