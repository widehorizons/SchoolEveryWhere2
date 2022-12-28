import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../config/tr/lang.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () => Get.back()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                // color: context.theme.scaffoldBackgroundColor,
                child: Column(children: [
                  const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/moon.png')),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Name",
                        style: context.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "email@Wide-horizons.net",
                      style: context.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomButton(
                    onPressed: (() {}),
                    radius: 40,
                    child: Text('edit'.tr),
                  )
                ]),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Preferences".tr,
                        style: context.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Column(children: [
                Obx(() => ListTile(
                      leading: Icon(
                        controller.isDarkMode.value
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        size: 25,
                        color: context.iconColor,
                      ),
                      title: Text('dark_mode'.tr),
                      trailing: SizedBox(
                          width: 90,
                          height: 90,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: (controller.darkButtonArtboard == null)
                                  ? const SizedBox()
                                  : Rive(
                                      artboard: controller.darkButtonArtboard!,
                                    ))),

                      // CupertinoSwitch(
                      //   value: controller.isDarkMode.value,
                      //   onChanged: (value) =>
                      //       controller.toggleDarkMode(context),
                      // ),
                      onTap: () => controller.toggleDarkMode(context),
                    )),
                ListTile(
                  leading: Icon(
                    Icons.translate,
                    size: 25,
                    color: context.iconColor,
                  ),
                  title: Text('language'.tr),
                  trailing: DropdownButton<String>(
                    // Initial Value
                    value: Get.locale!.languageCode,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: Lang().keys.keys.map((String language) {
                      return DropdownMenuItem(
                        value: language,
                        child: Text(language.tr),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      controller.dropdownvalue.value = newValue!;
                      controller.changeLanguage(newValue);
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
