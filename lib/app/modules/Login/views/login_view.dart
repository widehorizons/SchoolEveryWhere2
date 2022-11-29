import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: context.width,
                color: Colors.amber,
                child: Text(
                  'LoginView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: context.width,
                color: Colors.orange,
                child: Text(
                  'LoginView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: context.width,
                color: Colors.deepOrange,
                child: Text(
                  'LoginView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
