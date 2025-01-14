import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/app.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';

import 'common/routes.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  var initRoute = await checkAppFlow();
  runApp(App(initRoute: initRoute,));
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