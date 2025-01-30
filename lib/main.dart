import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/app.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'common/routes.dart';
import 'notifi_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // // get device token
  // var token = await FirebaseMessaging.instance.getToken();
  // print(token);
  // NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  // // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //   // print('Message: ${message.toString()}');
  //
  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification!.title}');
  //   }
  // });
  //
  // NotificationService
  //
  // NotificationService().initNotification();

  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  NotificationService.init();
  NotificationService.localNotification();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the background!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.title}');
    }

    NotificationService.showNotification(
        title: 'title', body: 'body', payload: 'payload');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.title}');
    }
  });

  var initRoute = await checkAppFlow();
  runApp(App(
    initRoute: initRoute,
  ));
}

void notificationHandler() {
  FirebaseMessaging.onMessage.listen((msg) {
    print(msg.notification!.title);
  });
}

// Check onboarding and token status
Future<String> checkAppFlow() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isOnboarded = prefs.getBool("onboarded") ?? false;
  String? token = prefs.getString("token");

  // Determine the navigation flow
  if (!isOnboarded) {
    // Navigate to onboarding screen
    return Routes.onboardingPage;
  } else if (token != null && token.isNotEmpty) {
    // Navigate to home screen
    return Routes.homePage;
  } else {
    // Navigate to login screen
    return Routes.loginPage;
  }
}
