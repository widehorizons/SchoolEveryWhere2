import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_drawer.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: context.theme.copyWith(dividerColor: Colors.transparent),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            iconTheme: IconThemeData(
              color: context.iconColor,
            ),
            actions: [
              Obx(
                () => IconButton(
                    splashRadius: 15,
                    onPressed: controller.toggleDarkMode,
                    icon: Icon(
                      controller.isDarkMode.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      size: 25,
                      color: context.iconColor,
                    )),
              )
            ],
          ),
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                // DayNightGreetingBanner(),
                Center(
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
