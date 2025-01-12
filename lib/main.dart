import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/app.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  var initRoute = await OnboardingController.instance.checkAppFlow();
  runApp(App(initRoute: initRoute,));
}
