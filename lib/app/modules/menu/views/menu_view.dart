import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_every_where_v2/app/config/Constants/dimensions.dart';
import 'package:school_every_where_v2/app/config/theme/theme.dart';

import '../../../widgets/custom_drawer.dart';
import '../../../widgets/day_night_greating.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: AppColors.scaffoldBackgroundColor,
          iconTheme: const IconThemeData(color: AppColors.black),
          actions: [
            IconButton(
                splashRadius: 15,
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active,
                  size: 25,
                ))
          ],
        ),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              DayNightGreetingBanner(),
              Center(
                child: Text(
                  'MenuView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
