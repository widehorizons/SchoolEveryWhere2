// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'Chat/cubit/chatcubit_cubit.dart';
import 'app.dart';
import 'package:flutter/material.dart';

import 'app/config/utils/flavor_config.dart';
import 'app/config/utils/inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await boot();
  FlavorConfig(
      flavor: Flavor.SMARTALEX,
      values: FlavorValues(
        baseUrl: "https://schooleverywhere-smartalex.com/schooleverywhere/",
        schoolName: 'Smart Alex School',
        imagePath: 'img/smartAlex.png',
        schoolWebsite: 'https://www.smartalex.school/',
        storagePath: '/data/user/0/com.schooleverywhere.smartalex',
      ));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // NotificationSettings settings =
  //     await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   print('User granted permission');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   print('User granted provisional permission');
  // } else {
  //   print('User declined or has not accepted permission');
  // }

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  // await FlutterDownloader.initialize(debug: true);
  runApp(MyApp());
}
