import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/theme.dart';
import '../../../config/tr/lang.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/scaffold_oval_clipper.dart';
import '../../Connectivity/views/network_sensitive.dart';
import '../controllers/language_picker_controller.dart';

class LanguagePickerView extends GetView<LanguagePickerController> {
  const LanguagePickerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: ScaffoldOvalClipper(
        child: Column(
          children: [
            SizedBox(
                width: context.width * 0.5,
                height: context.height * 0.28,
                child: ListView.builder(
                  itemCount: Lang().keys.length,
                  itemBuilder: (context, index) {
                    final String lang = Lang().keys.keys.elementAt(index);
                    return CustomButton(
                        backgroundColor: AppColors.primaryColor,
                        color: AppColors.lightGreyBackground,
                        width: context.width * 0.5,
                        height: 40,
                        onPressed: () =>
                            controller.selectLanguage(Locale(lang)),
                        child: Text(
                          lang.tr,
                        ));
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(controller.hasSelectedLanguage.value
                        ? "continue".tr
                        : "skip".tr),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
