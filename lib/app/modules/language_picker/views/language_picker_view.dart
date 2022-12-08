import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/tr/message.dart';
import '../../../config/utils/flavor_config.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/oval_bottom_clipper.dart';
import '../../Connectivity/views/network_sensitive.dart';
import '../controllers/language_picker_controller.dart';

class LanguagePickerView extends GetView<LanguagePickerController> {
  const LanguagePickerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: SafeArea(
        child: Scaffold(
          body: Stack(alignment: Alignment.topCenter, children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                  width: context.width,
                  height: context.height * 0.45,
                  decoration: const BoxDecoration(
                    // color: Colors.grey[500],
                    color: Colors.white30,
                    // backgroundBlendMode: BlendMode.overlay,
                    image: DecorationImage(
                        // image: AssetImage("assets/pattern_white.png"),
                        image: AssetImage("assets/pattern.png"),
                        fit: BoxFit.cover),
                  )),
            ),
            // ClipPath(
            //   clipper: OvalBottomBorderClipper(),
            //   child: Container(
            //     width: context.width,
            //     height: context.height * 0.35,
            //     decoration: const BoxDecoration(
            //         color: Colors.black,
            //         backgroundBlendMode: BlendMode.overlay,
            //         gradient: LinearGradient(
            //             begin: FractionalOffset.topCenter,
            //             end: FractionalOffset.bottomCenter,
            //             colors: [
            //               Colors.black,
            //               Colors.black,
            //             ],
            //             stops: [
            //               0.0,
            //               1.0
            //             ])),
            //   ),
            // ),
            Positioned(
              top: context.height * 0.35,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset(
                      FlavorConfig.instance.values.imagePath!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                          width: context.width * 0.5,
                          height: context.height * 0.28,
                          child: ListView.builder(
                            itemCount: Lang().keys.length,
                            itemBuilder: (context, index) {
                              log(Lang().keys.keys.elementAt(index).toString());
                              final String lang =
                                  Lang().keys.keys.elementAt(index);
                              return CustomButton(
                                  backgroundColor: AppColors.primaryColor,
                                  color: AppColors.lightGreyBackground,
                                  width: context.width * 0.5,
                                  height: 40,
                                  onPressed: () =>
                                      Get.updateLocale(Locale(lang)),
                                  child: Text(
                                    lang.tr, //Lang().keys[index].toString()).tr
                                  ));
                            },
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: TextButton(
                            onPressed: () {},
                            child: Text("skip".tr),
                          ),
                        ),
                      )
                    ],
                  )),
                )),
          ]),
        ),
      ),
    );
  }
}
