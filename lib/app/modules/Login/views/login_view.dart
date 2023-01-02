import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../widgets/app_loading_widget.dart';
import '../../../widgets/copy_rights.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffd6e2ea),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => (controller.teddyArtboard.value != null)
                  ? SizedBox(
                      width: context.width * 0.9,
                      height: context.height * 0.33,
                      child: Rive(
                        artboard: controller.teddyArtboard.value!,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const SizedBox(),
            ),
            Container(
              width: context.width * .9,
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 15 * 2),
                        Obx(
                          () => DropdownButton(
                            hint: Text('select_a_user_type'.tr),
                            elevation: 4,
                            isDense: true,
                            icon: controller.loadingTypes.value
                                ? AppLoadingWidget.small()
                                : const Icon(
                                    Icons.keyboard_double_arrow_down_outlined),
                            items: controller.userTypeItemlist.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onTap: controller.doNoThing,
                            onChanged: (newVal) {
                              controller.dropdownvalue.value =
                                  newVal.toString();
                            },
                            value: controller.dropdownvalue.value,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: controller.emailController,
                          onTap: controller.lookOnTheTextField,
                          onChanged: controller.moveEyeBalls,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 14),
                          cursorColor: const Color(0xffb04863),
                          decoration: InputDecoration(
                            hintText: "username".tr,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusColor: const Color(0xffb04863),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffb04863),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: controller.passwordController,
                          onTap: controller.handsOnTheEyes,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: const TextStyle(fontSize: 14),
                          cursorColor: const Color(0xffb04863),
                          decoration: InputDecoration(
                            hintText: "password".tr,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusColor: const Color(0xffb04863),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffb04863),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //remember me checkbox
                            Obx(
                              () => ListTile(
                                leading: Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) =>
                                      controller.toggleRememberMe(),
                                ),
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "remember_me".tr,
                                  style: context.textTheme.bodyMedium,
                                ),
                                onTap: controller.toggleRememberMe,
                              ),
                            ),
                            CustomButton(
                              onPressed: controller.login,
                              child: Text("login".tr),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CopyRights(),
          ],
        ),
      ),
    );
  }
}
