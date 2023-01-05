import 'dart:io';

import 'package:dio/dio.dart';

import '../../config/Constants/end_points.dart';
import '../../config/Constants/prefs_keys.dart';
import '../../config/utils/api_client.dart';
import '../../config/utils/prefs.dart';
import '../../models/dto/login_dto.dart';

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
    // Prefs.setMap(PrefsKeys.userModel, User.fromJson(res.data['data']).toMap());
    // log((Prefs.getMap(PrefsKeys.userModel).toString()).toString());
    Prefs.setString(PrefsKeys.token, 'ABCD');
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
