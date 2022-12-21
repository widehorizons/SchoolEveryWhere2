import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/utils/prefs.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../chat_rooms/views/chat_rooms_view.dart';
import '../../menu/views/menu_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../../profile/views/profile_view.dart';

class HomeController extends GetxController {
  final int? activeIndex = Get.arguments;
  final screens = const <Widget>[
    MenuView(),
    ChatRoomsView(),
    NotificationsView(),
    ProfileView()
  ];

  final index = 0.obs;

  @override
  void onInit() {
    index.value = activeIndex ?? 0;
    super.onInit();
  }

  void changeIndex(int ind) {
    index.value = ind;
  }

  Future<void> confirmLogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            titlePadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            title: Text(
              'are_u_sure_to_sign_out'.tr,
              style: context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text("you_will_need_to_login_next_time_you_use_the_app".tr),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () => logOut(),
                      backgroundColor: AppColors.confirm,
                      child: Text(
                        'confirm'.tr,
                        style: context.theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      // isOutlined: true,
                      // borderColor: Colors.white,
                      backgroundColor: AppColors.cancel,
                      // color: Colors.white,
                      onPressed: () => Get.back(),
                      child: Text(
                        'cancel'.tr,
                        style: context.theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void logOut() {
    Prefs.clear();
    Get.offAllNamed(Routes.LANGUAGE_PICKER);
  }
}
