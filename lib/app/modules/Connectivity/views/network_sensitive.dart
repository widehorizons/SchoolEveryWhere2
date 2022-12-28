import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/NetworkCubit/internet_cubit.dart';
import 'connectivity_page.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget? child;

  const NetworkSensitive({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is InternetDisconnected) {
            log("Dialog page Change state");
            Timer(
                const Duration(milliseconds: 900),
                () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return ConnectivityPage(
                        parent: this,
                      );
                    }));
          }
        },
        child: Opacity(
          opacity: 1,
          child: child,
        ));
  }
}
