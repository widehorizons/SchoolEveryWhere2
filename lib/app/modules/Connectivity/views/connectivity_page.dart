import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../controllers/NetworkCubit/internet_cubit.dart';

class ConnectivityPage extends StatefulWidget {
  final Widget parent;

  const ConnectivityPage({Key? key, required this.parent}) : super(key: key);
  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
      if (state is InternetConnected) Navigator.pop(context);
    }, builder: (context, state) {
      return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: context.width,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/connection_failure.png',
                        ),
                        RichText(
                          text: TextSpan(
                              text: "${"looks_like_you're_offline".tr} \n",
                              style: context.textTheme.titleLarge,
                              children: [
                                TextSpan(
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(height: 3),
                                    text:
                                        'make_sure_you_are_connected_first'.tr),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              )));
    });
  }
}
