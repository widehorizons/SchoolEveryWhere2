import 'package:get/get.dart';

import '../../../config/Constants/prefs_keys.dart';
import '../../../config/utils/prefs.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  void login() {
    Prefs.setString(PrefsKeys.token, "token");
    Get.toNamed(Routes.HOME);
  }
}
