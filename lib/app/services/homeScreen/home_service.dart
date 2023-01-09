import 'dart:developer';
import 'dart:io';

import '../../config/Constants/end_points.dart';
import '../../config/utils/api_client.dart';
import '../../models/screen_icon.dart';
import '../../models/users/Student.dart';

class HomeService {
  /// request list of User Icons
  Future<List<ScreenIcon>?> studetnHomeScreen(
      {required Student student}) async {
    log('message Student : ${student.toString()}');
    final response =
        await Api.post(EndPoints.getStudentPages, body: student.toJson());
    if (response.statusCode != HttpStatus.ok) {
      throw response.data['message'] ?? response.data;
    }
    return response.data;
  }
}
