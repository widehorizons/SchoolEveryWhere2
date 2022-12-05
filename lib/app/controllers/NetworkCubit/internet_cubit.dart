import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';
import 'package:schooleverywhereV2/app/config/utils/api_client.dart';

import '../../config/Constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity = Get.put(Connectivity());
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit() : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    log("monitorInternetConnection");
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.wifi) {
        try {
          final res = await Api.get("https://www.google.com/");
          log(res.statusCode.toString());

          if (res.statusCode == HttpStatus.ok) {
            emitInternetConnected(ConnectionType.wifi);
          }
        } catch (e) {
          log(e.toString());
          emitInternetDisconnected();
        }
      } else if (connectivityResult == ConnectivityResult.mobile) {
        try {
          final res = await Api.get("https://www.google.com");
          log(res.statusCode.toString());
          if (res.statusCode == HttpStatus.ok) {
            emitInternetConnected(ConnectionType.mobile);
          }
        } catch (e) {
          log(e.toString());
          emitInternetDisconnected();
        }
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      } else {
        emitInternetDisconnected();
        log(connectivityResult.toString());
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
