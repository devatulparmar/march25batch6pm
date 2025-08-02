import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:march25batch6pm/home_screen.dart';
import 'package:march25batch6pm/services/notification_service.dart';
import 'package:march25batch6pm/services/push_notification_service.dart';
import 'package:march25batch6pm/utils/color_const.dart';
import 'package:march25batch6pm/utils/const.dart';
import 'package:march25batch6pm/utils/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await NotificationService.init();
  await NotificationService.isAndroidPermissionGranted();
  await NotificationService.requestPermissions();
  await NotificationService.configureDidReceiveLocalNotificationSubject();
  await NotificationService.configureSelectNotificationSubject();
  await PushNotificationService.setupInteractedMessage();

  runApp(
    MaterialApp(
      navigatorKey: mainKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: clrAppBarBackTheme,
        ),
      ),
      // home: const HomeScreen(),
      onGenerateRoute: MyRoutes.onGenerate,
    // routes: {
    //   "/": (BuildContext context) => const HomeScreen(),
    //   routeScreen1: (BuildContext context) => const Screen1(),
    //   routeScreen2: (BuildContext context) => const Screen2(),
    // },
  ),
  );
}