import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../widgets/custom_drawer.dart';

import '../../../config/theme/theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.redDark,
          onPressed: () => controller.logOut(),
          child: const Icon(
            Icons.power_settings_new,
            color: AppColors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() => controller.screens[controller.index.value]),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Icons.maps_home_work_rounded,
                  color: (controller.index.value == 0)
                      ? AppColors.primaryColor
                      : AppColors.secondaryTypoColor,
                ),
                onPressed: () => controller.changeIndex(0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Icons.chat,
                  color: controller.index.value == 1
                      ? AppColors.primaryColor
                      : AppColors.secondaryTypoColor,
                ),
                onPressed: () => controller.changeIndex(1),
              ),
            ),
            SizedBox(
              width: context.width * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Badge(
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "3",
                      style: context.textTheme.button!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: controller.index.value == 2
                        ? AppColors.primaryColor
                        : AppColors.secondaryTypoColor,
                  ),
                ),
                onPressed: () => controller.changeIndex(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: controller.index.value == 3
                      ? AppColors.primaryColor
                      : AppColors.secondaryTypoColor,
                ),
                onPressed: () => controller.changeIndex(3),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
