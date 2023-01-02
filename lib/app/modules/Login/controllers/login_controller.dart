import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../config/Constants/prefs_keys.dart';
import '../../../config/utils/prefs.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var dropdownvalue;
  var dropdownvalueSubject;
  var subjectItemlist = [];

  List userTypeItemlist = ['Student', 'Parent', 'Staff', 'Manager'];

  late String animationURL;
  Rx<Artboard?> teddyArtboard = Rx<Artboard?>(null);
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;

  StateMachineController? stateMachineController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    if (emailController.text == "admin" && passwordController.text == "admin") {
      successTrigger?.fire();
      Future.delayed(
          const Duration(seconds: 2),
          () => {
                Prefs.setString(PrefsKeys.token, "token"),
                Get.offAllNamed(Routes.HOME)
              });
    } else {
      failTrigger?.fire();
    }
  }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    numLook?.change(val.length.toDouble());
  }

  void doNoThing() {
    isHandsUp?.change(false);
    isChecking?.change(false);
    numLook?.change(0);
  }

  @override
  void onInit() {
    rootBundle.load('assets/riveAssets/login.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(artboard, "Login Machine");
      if (stateMachineController != null) {
        artboard.addController(stateMachineController!);

        for (var e in stateMachineController!.inputs) {
          log(e.runtimeType.toString());
          log("name${e.name}End");
        }

        for (var element in stateMachineController!.inputs) {
          if (element.name == "trigSuccess") {
            successTrigger = element as SMITrigger;
          } else if (element.name == "trigFail") {
            failTrigger = element as SMITrigger;
          } else if (element.name == "isHandsUp") {
            isHandsUp = element as SMIBool;
          } else if (element.name == "isChecking") {
            isChecking = element as SMIBool;
          } else if (element.name == "numLook") {
            numLook = element as SMINumber;
          }
        }
      }
      teddyArtboard.value = artboard;
      update();
    });
    super.onInit();
  }
}
