import 'package:get/get.dart';

import '../controllers/language_picker_controller.dart';

class LanguagePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguagePickerController>(
      () => LanguagePickerController(),
    );
  }
}
