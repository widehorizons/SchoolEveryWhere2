import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

// import 'Chat/cubit/chatcubit_cubit.dart';
// import 'Pages/ManagementPage.dart';
// import 'Pages/OnlineQuiz/provider/quiz_controller.dart';
// import 'Pages/ParentPage.dart';
// import 'Pages/SplashScreen.dart';
// import 'Pages/StaffPage.dart';
// import 'Pages/StudentPage.dart';
// import 'SharedPreferences/Prefs.dart';
// import 'Staff/Assignments.dart';
// import 'Student/Attendance.dart';
// import 'Student/MailInboxPage.dart';
// import 'Student/ReceiveFromTeacher.dart';
// import 'Student/StudentAssignments.dart';
import 'app/config/Constants/prefs_keys.dart';
import 'app/config/theme/theme.dart';
import 'app/config/tr/message.dart';
import 'app/config/utils/prefs.dart';
import 'app/controllers/NetworkCubit/internet_cubit.dart';
import 'app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  String textValue = 'Hello World !';
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     new FlutterLocalNotificationsPlugin();
  // late ChatCubit chatCubit;

  String? typeUser;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // getLoggedInUser();
    // chatCubit = BlocProvider.of<ChatCubit>(context);
    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {
    //   // _notificationNavigator(message);
    // });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('A new onMessage event was published!');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;

    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             channelDescription: channel.description,
    //             // TODO add a proper drawable resource to android, for now using
    //             //      one that already exists in example app.
    //             icon: 'mipmap/ic_launcher',
    //           ),
    //         ));
    //   }
    //   _notificationNavigator(message);
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   Map<String, dynamic> messageData = message.data;
    //   print('A new onMessageOpenedApp event was published!' +
    //       messageData['screen'].toString());
    //   _notificationNavigator(message);
    // });
  }

  // Future<void> getLoggedInUser() async {
  //   String? type = await (getUserType());
  //   setState(() {
  //     typeUser = type;
  //   });
  // }

  // void _notificationNavigator(RemoteMessage? message) {
  //   Map<String, dynamic>? messageData = message?.data;
  //   print("Notification Data ==================>> $messageData");
  //   switch (messageData!['screen']) {
  //     case "ReceiveFromTeacher":
  //       navigatorKey.currentState!.push(
  //           MaterialPageRoute(builder: (_) => ReceiveFromTeacher(typeUser!)));
  //       break;
  //     case "Mail Inbox":
  //       navigatorKey.currentState!
  //           .push(MaterialPageRoute(builder: (_) => MailInboxPage(typeUser!)));
  //       break;
  //     case "New Mailbox":
  //       navigatorKey.currentState!
  //           .push(MaterialPageRoute(builder: (_) => MailInboxPage(typeUser!)));
  //       break;
  //     case "Student Attendance":
  //       navigatorKey.currentState!
  //           .push(MaterialPageRoute(builder: (_) => Attendance(typeUser!)));
  //       break;
  //     case "Assignment":
  //       navigatorKey.currentState!.push(
  //           MaterialPageRoute(builder: (_) => StudentAssignments(typeUser!)));
  //       break;
  //     case "Reply Send to class":
  //       print("Notification Data For Chat ==================>> $messageData");
  //       chatCubit.getAllLang(
  //           messageData['role'], messageData['id'], messageData['regno'],
  //           staffid: messageData['staffid']);
  //       break;
  //     case "Health":
  //       print("Notification Data For Health ==================>> $messageData");
  //       navigatorKey.currentState!
  //           .push(MaterialPageRoute(builder: (_) => HealthScreen()));
  //       break;
  //     case "Reply Assignment":
  //       navigatorKey.currentState!
  //           .push(MaterialPageRoute(builder: (_) => Assignments()));
  //       break;
  //     default:
  //       if (typeUser == "Student") {
  //         navigatorKey.currentState!
  //             .push(MaterialPageRoute(builder: (_) => StudentPage()));
  //       } else if (typeUser == "Staff") {
  //         navigatorKey.currentState!
  //             .push(MaterialPageRoute(builder: (_) => StaffPage()));
  //       } else if (typeUser == "Parent") {
  //         navigatorKey.currentState!
  //             .push(MaterialPageRoute(builder: (_) => ParentPage()));
  //       } else if (typeUser == "Management") {
  //         navigatorKey.currentState!
  //             .push(MaterialPageRoute(builder: (_) => ManagementPage()));
  //       }
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => ChatCubit()),
          BlocProvider<InternetCubit>(
            create: (internetCubitContext) => InternetCubit(),
          ),
        ],
        // child: MultiProvider(
        //     providers: [
        //       ChangeNotifierProvider(create: (_) => OnlineQuizProvider()),
        //     ],
        child: GetMaterialApp(
          title: "Testing...",
          initialRoute: (Prefs.getString(PrefsKeys.token).isNotEmpty)
              ? Routes.HOME
              : (Prefs.getString(PrefsKeys.lang).isEmpty)
                  ? Routes.LANGUAGE_PICKER
                  : Routes.LOGIN,
          getPages: AppPages.routes,
          themeMode: ThemeMode.dark,
          theme: appLightTheme,
          locale: (Prefs.getString(PrefsKeys.lang).isEmpty)
              ? Get.deviceLocale
              : Locale(
                  Prefs.getString(PrefsKeys.lang),
                ),
          translations: Lang(),
          supportedLocales: const [Locale('ar'), Locale('en'), Locale('fr')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          fallbackLocale: const Locale('en'),
        ));
  }
}
