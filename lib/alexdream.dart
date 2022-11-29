// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'Chat/cubit/chatcubit_cubit.dart';
// import 'config/flavor_config.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'app/config/utils/flavor_config.dart';
import 'inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await boot();
  FlavorConfig(
      flavor: Flavor.ALEXDREAM,
      values: FlavorValues(
        baseUrl: "https://schooleverywhere-alexdream.com/schooleverywhere/",
        schoolName: 'Alex Dream Language School',
        imagePath: 'img/alexdream.png',
        schoolWebsite: 'https://schooleverywhere-alexdream.com/',
        storagePath: '/data/user/0/com.schooleverywhere.alexdream',
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
  runApp(
      // new BlocProvider(create: (context) => ChatCubit(), child:
      MyApp());
}
