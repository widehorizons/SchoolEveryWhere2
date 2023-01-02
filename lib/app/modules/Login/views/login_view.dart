import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.only(bottom: 15),
            margin: const EdgeInsets.only(bottom: 15 * 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 15 * 2),
                      DropdownButton(
                        hint: const Text('Select a user type'),
                        elevation: 4,
                        isDense: true,
                        // icon: const Icon(Icons.arrow_circle_down_sharp),
                        items: controller.userTypeItemlist.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onTap: controller.doNoThing,
                        onChanged: (newVal) {
                          controller.dropdownvalue = newVal;
                        },
                        value: controller.dropdownvalue,
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: controller.emailController,
                        onTap: controller.lookOnTheTextField,
                        onChanged: controller.moveEyeBalls,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 14),
                        cursorColor: const Color(0xffb04863),
                        decoration: const InputDecoration(
                          hintText: "Email/Username",
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusColor: Color(0xffb04863),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffb04863),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        decoration: const InputDecoration(
                          hintText: "Password",
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusColor: Color(0xffb04863),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffb04863),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //remember me checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Text("Remember me"),
                            ],
                          ),
                          CustomButton(
                            onPressed: controller.login,
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'img/schooleverywhere.png',
            width: 50,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              '© Powerd by SchoolEveryWhere™',
              style: context.textTheme.bodyMedium!.copyWith(height: 1.2),
            ),
          ),
        ],
      ),
    );
  }
}
