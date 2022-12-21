// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter/material.dart';

// import 'Chat/cubit/chatcubit_cubit.dart';
// import 'config/flavor_config.dart';
import '../app.dart';
import '../app/config/utils/flavor_config.dart';
import '../app/config/utils/inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await boot();
  FlavorConfig(
      flavor: Flavor.galasmansoura,
      values: FlavorValues(
        baseUrl: "https://schooleverywhere-galsmansoura.com/schooleverywhere/",
        schoolName: 'Gals Mansoura School',
        imagePath: 'img/galsmansoura.png',
        schoolWebsite: 'https://www.gals-mansoura.com/',
        storagePath: '/data/user/0/com.schooleverywhere.galsmansoura',
      ));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // // Bloc.observer = AppBlocObserver();

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
  runApp(const MyApp());
}
