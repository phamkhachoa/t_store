import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/product_details/product_detail.dart';

import '../features/shop/screens/navigation/navigation_menu.dart';

class Routes {
  static const onboardingPage = '/onboardingPage';
  static const homePage = '/homePage';
  static const loginPage = '/loginPage';
  static const navigationPage = '/navigationPage';
  static const productDetailPage = '/productDetailPage';

  static var routes = <String, WidgetBuilder>{
    onboardingPage: (_) => OnBoardingScreen(),
    homePage: (_) => HomeScreen(),
    loginPage: (_) => LoginScreen(),
    navigationPage: (_) => NavigationMenu(),
    productDetailPage: (_) => ProductDetailScreen(),
  };
}
