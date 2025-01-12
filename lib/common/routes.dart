import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/shop/screens/home/home.dart';

class Routes {
  static const onboardingPage = '/onboardingPage';
  static const homePage = '/homePage';
  static const loginPage = '/loginPage';

  static var routes = <String, WidgetBuilder>{
    onboardingPage: (_) => OnBoardingScreen(),
    homePage: (_) => HomeScreen(),
    loginPage: (_) => LoginScreen(),
  };
}
