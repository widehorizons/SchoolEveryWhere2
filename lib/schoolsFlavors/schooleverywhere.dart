// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'Chat/cubit/chatcubit_cubit.dart';
// import 'config/flavor_config.dart';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../app.dart';
import '../app/config/theme/theme_setup.dart';
import '../app/config/utils/app_bloc_observer.dart';
import '../app/config/utils/firebase_config.dart';
import '../app/config/utils/flavor_config.dart';
import '../inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await boot();
  FlavorConfig(
      theme: ThemeConfig.defaultTheme,
      flavor: Flavor.schooleverywhere,
      values: FlavorValues(
        baseUrl: "https://schooleverywhere-try.com/new/",
        schoolName: 'Schooleverywhere',
        schoolWebsite: 'https://schooleverywhere-try.com/',
        imagePath: 'img/schooleverywhere.png',
        storagePath: '/data/user/0/com.schooleverywhere.schooleverywhere',
      ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Bloc.observer = AppBlocObserver();
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    log('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    log('User granted provisional permission');
  } else {
    log('User declined or has not accepted permission');
  }

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await FlutterDownloader.initialize(debug: true);
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
