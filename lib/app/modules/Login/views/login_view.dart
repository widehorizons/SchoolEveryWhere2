import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/scaffold_oval_clipper.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldOvalClipper(
      child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomButton(onPressed: controller.login, child: Text("login".tr))
          ]),
        ),
      ),
    );
  }
}
