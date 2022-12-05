import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:schooleverywhereV2/app/config/utils/flavor_config.dart';
import 'package:schooleverywhereV2/app/modules/Connectivity/views/network_sensitive.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: SafeArea(
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('img/schooleverywhere.png', height: 100),
              Text(FlavorConfig.instance.name)
            ],
          ),
        )
            // Column(
            //   children: [
            //     Expanded(
            //       flex: 1,
            //       child: Container(
            //         width: context.width,
            //         color: Colors.amber,
            //       ),
            //     ),
            //     Expanded(
            //       flex: 3,
            //       child: Container(
            //         width: context.width,
            //         color: Colors.orange,
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         width: context.width,
            //         color: Colors.deepOrange,
            //       ),
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
}
