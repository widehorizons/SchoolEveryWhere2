import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../config/Constants/end_points.dart';
import '../../config/Constants/prefs_keys.dart';
import '../../config/utils/api_client.dart';
import '../../config/utils/prefs.dart';
import '../../models/dto/login_dto.dart';
import '../../models/users/student.dart';

class LoginService {
  login({
    required LoginDTO loginParameters,
  }) async {
    final res = await Api.post(
      EndPoints.login,
      attachToken: false,
      body: FormData.fromMap(loginParameters.toMap()),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw res.data['message'] ?? res.data;
    }
    final currentUser = Student.fromJson(res.data);
    log(currentUser.toString());
    Prefs.setMap(PrefsKeys.currentUser, currentUser.toJson());
    log((Prefs.getMap(PrefsKeys.currentUser).toString()).toString());
    Prefs.setString(PrefsKeys.token, currentUser.token!);
    return res.data;
  }

  /// request list of User Types
  loginType() async {
    final response = await Api.post(EndPoints.loginType);
    if (response.statusCode != HttpStatus.ok) {
      throw response.data['message'] ?? response.data;
    }
    return response.data['loginType'];
  }

  /// request list of User Types
  checkIdentifier(String userType) async {
    final response =
        await Api.post(EndPoints.chekIdentiifer, body: {'type': userType});
    if (response.statusCode != HttpStatus.ok) {
      throw response.data['message'] ?? response.data;
    }
    return response.data;
  }
}
