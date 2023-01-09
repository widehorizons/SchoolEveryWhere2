import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../config/Constants/prefs_keys.dart';
import '../../../config/theme/theme.dart';
import '../../../config/utils/prefs.dart';
import '../../../models/dto/login_dto.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/login.dart';

class LoginController extends GetxController {
  String _token = "";
  Stream<String>? _tokenStream;
  final dropdownvalue = Rx<String?>(null);
  var subjectItemlist = [];
  final userTypeItemlist = [].obs;

// #### Booleans ####
  final loadingTypes = false.obs;
  final rememberMe = false.obs;
  final hasIdentifier = false.obs;
  final obscureText = true.obs;

  final _loginservice = Get.find<LoginService>();

  late String animationURL;
  Rx<Artboard?> teddyArtboard = Rx<Artboard?>(null);
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;
  StateMachineController? stateMachineController;

  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginTypes() async {
    try {
      loadingTypes.value = true;
      final data = await _loginservice.loginType();
      userTypeItemlist.addAll(data!);
    } catch (e) {
      log(e.toString());
    } finally {
      loadingTypes.value = false;
    }
  }

  Future<void> checkIdentifier(String type) async {
    try {
      final res = await _loginservice.checkIdentifier(type);
      hasIdentifier.value = res[type] ?? false;
    } catch (e) {
      log(e.toString());
    }
  }

  toggleVisibility() => obscureText.value = !obscureText.value;

  Future<void> login() async {
    log('FCM device token = $_token');
    isChecking?.change(false);
    isHandsUp?.change(false);
    if (loginFormKey.currentState!.validate() &&
        (dropdownvalue.value?.isNotEmpty ?? false)) {
      try {
        final res = await _loginservice.login(
            loginParameters: LoginDTO(
                deviceToken: _token,
                username: usernameController.text,
                password: passwordController.text,
                type: dropdownvalue.value.toString(),
                identifier: identifierController.text));
        if (res['Success']) {
          successTrigger?.fire();
          Future.delayed(
              const Duration(seconds: 2),
              () => {
                    Prefs.setString(PrefsKeys.token, "token"),
                    Get.offAllNamed(Routes.HOME)
                  });
        } else {
          failTrigger?.fire();
          Fluttertoast.showToast(msg: res['message'].toString());
          Fluttertoast.showToast(msg: res['message'].toString());
        }
      } catch (e, st) {
        failTrigger?.fire();
        log(e.toString());
        log(st.toString());
      }
    }
    if (dropdownvalue.value?.isEmpty ?? true) {
      log('please_select_user_type'.tr);
      Fluttertoast.showToast(
          msg: 'please_select_user_type'.tr,
          backgroundColor: AppColors.disabled,
          gravity: ToastGravity.TOP);
    }
  }

  toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
    if (rememberMe.value) {
      log('Data should be saved');
// TODO: Implement save users data
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

  void setToken(String? token) {
    log('FCM Token: $token');
    _token = token!;
  }

  @override
  Future<void> onInit() async {
    FirebaseMessaging.instance.getToken().then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream!.listen(setToken);
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
    await loginTypes();
    super.onInit();
  }

  @override
  void onReady() {
    ever(dropdownvalue,
        (callback) => checkIdentifier(dropdownvalue.value.toString()));
    super.onReady();
  }
}
