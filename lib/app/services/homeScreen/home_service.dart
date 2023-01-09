import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../config/Constants/end_points.dart';
import '../../config/utils/api_client.dart';
import '../../models/screen_icon.dart';
import '../../models/users/student.dart';

class HomeService {
  /// request list of User Icons
  Future<List<ScreenIcon>> studetnHomeScreen({required Student student}) async {
    log('message Student : ${student.toJson().toString()}');
    final response = await Api.post(
      EndPoints.getStudentPages,
      body: FormData.fromMap(student.toJson()),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw response.data['message'] ?? response.data;
    }
    final icons = (response.data['data'] as List)
        .map((e) => ScreenIcon.fromJson(e))
        .toList();
    log(icons.toString());
    return icons;
  }
}
