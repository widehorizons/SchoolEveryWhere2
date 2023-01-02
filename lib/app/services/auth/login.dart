import 'dart:io';

import '../../config/Constants/end_points.dart';
import '../../config/Constants/prefs_keys.dart';
import '../../config/utils/api_client.dart';
import '../../config/utils/prefs.dart';

class LoginService {
  login({
    required String phone,
    required String password,
  }) async {
    final res = await Api.post(
      EndPoints.login,
      attachToken: false,
      body: {
        'phone': phone,
        'password': password,
      },
    );

    if (res.statusCode != HttpStatus.ok) {
      throw res.data['message'] ?? res.data;
    }
    // Prefs.setMap(PrefsKeys.userModel, User.fromJson(res.data['data']).toMap());
    // log((Prefs.getMap(PrefsKeys.userModel).toString()).toString());
    Prefs.setString(PrefsKeys.token, 'ABCD');
    // return UserModel.fromJson(res.data['data']);
  }

  /// request list of User Types
  loginType() async {
    final response = await Api.post(EndPoints.loginType);
    if (response.statusCode != HttpStatus.ok) {
      throw response.data['message'] ?? response.data;
    }
    return response.data['loginType'];
  }
}
