import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../services/connectivity.dart';
import '../Constants/end_points.dart';
import '../Constants/prefs_keys.dart';
import 'prefs.dart';
// import 'package:wichey/app/helpers/dio_connectivity_request_retrier.dart';
// import 'package:wichey/app/helpers/prefs.dart';
// import 'package:wichey/app/helpers/retry_interceptor.dart';
// import '../config/constants/prefs_keys.dart';
// import '../service/connectivity.dart';
// import 'end_points.dart';

// class ConnectionException implements Exception {
//   final String msg;
//
//   ConnectionException(this.msg);
//
//   @override
//   String toString() => msg;
// }

// class NoConnectionInterceptor extends Interceptor {
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     if (err.type == DioErrorType.other ||
//         err.type == DioErrorType.connectTimeout) {
//       throw ConnectionException("Please Check Your Connection.");
//     } else {
//       throw err;
//     }
//   }
// }

// ignore: non_constant_identifier_names
final Api = ApiClient();

class ApiClient {
  final connectivity = Get.put(ConnectivityServices());
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.api,
        validateStatus: (_) => true,
        followRedirects: false,
        contentType: 'application/json',
        headers: {'accept': 'application/json'},
        // connectTimeout: 500000,
        // receiveTimeout: 300000,
      ),
    );
    // dio.interceptors.add(
    //   RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //       dio: dio,
    //       connectivity: Connectivity(),
    //     ),
    //   ),
    // );
    return dio;
  }

  int getLanguageCode() {
    final languageCode = Get.locale!.languageCode;
    switch (languageCode) {
      case 'ar':
        return 10;
      case 'en':
        return 10;
      case 'fr':
        return 10;
      default:
        return 2;
    }
  }

  Response _validate(Response res) {
    // if (res.statusCode == 500) {
    //   throw 'Server Error';
    // } else if (res.statusCode == 404) {
    //   throw 'Not Found';
    // } else if (res.statusCode == 422) {
    //   throw 'Validation Error';
    // } else if (res.data == null) {
    //   throw 'api returned null response';
    // }
    return res;
  }

  /// sends a [GET] request to the given [url]
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = false,
    bool wantBytes = false,
  }) async {
    if (attachToken && Prefs.getString(PrefsKeys.token).isEmpty) {
      throw 'unauthenticated';
    }
    if (await connectivity.connectedToInternet()) {
      final res = await dio.get(
        url,
        queryParameters: {...query},
        options: Options(
          headers: {
            if (attachToken && Prefs.getString(PrefsKeys.token).isNotEmpty)
              HttpHeaders.authorizationHeader:
                  'Bearer ${Prefs.getString(PrefsKeys.token)}',
            'Accept-Language': getLanguageCode(),
            'Accept': 'application/json',
            'Content-type': 'application/json',
            ...headers,
          },
          responseType: wantBytes ? ResponseType.bytes : null,
        ),
      );
      return _validate(res);
    } else {
      throw 'your_device_doesn\'t _connected'.tr;
    }
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = false,
  }) async {
    if (attachToken && Prefs.getString(PrefsKeys.token).isEmpty) {
      throw 'unauthenticated';
    }
    if (await connectivity.connectedToInternet()) {
      final res = await dio.post(
        path,
        data: body,
        queryParameters: {...query},
        options: Options(
          headers: {
            if (attachToken)
              HttpHeaders.authorizationHeader:
                  'Bearer ${Prefs.getString(PrefsKeys.token)}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Accept-Language': getLanguageCode(),
            ...headers,
          },
          contentType: contentType,
        ),
      );
      return _validate(res);
    } else {
      throw 'your_device_doesn\'t _connected'.tr;
    }
  }

  Future<Response> put(
    String path, {
    dynamic body = const {},
    bool attachToken = true,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    if (attachToken && Prefs.getString(PrefsKeys.token).isEmpty) {
      throw 'unauthenticated';
    }
    if (await connectivity.connectedToInternet()) {
      final res = await dio.put(
        path,
        data: body,
        queryParameters: {...query},
        options: Options(
          headers: {
            if (attachToken)
              HttpHeaders.authorizationHeader:
                  'Bearer ${Prefs.getString(PrefsKeys.token)}',
            'Accept-Language': getLanguageCode(),
            ...headers,
          },
        ),
      );
      return _validate(res);
    } else {
      throw 'your_device_doesn\'t _connected'.tr;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    if (Prefs.getString(PrefsKeys.token).isEmpty) {
      throw 'unauthenticated';
    }
    if (await connectivity.connectedToInternet()) {
      final res = await dio.delete(
        path,
        data: body,
        queryParameters: {...query},
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${Prefs.getString(PrefsKeys.token)}',
            'Accept-Language': getLanguageCode(),
            ...headers,
          },
        ),
      );
      return _validate(res);
    } else {
      throw 'your_device_doesn\'t _connected'.tr;
    }
  }
}
