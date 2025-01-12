import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

import '../../../common/routes.dart';
import '../../../common/global.dart';

class OnboardingController extends ChangeNotifier {
  // Private constructor
  OnboardingController._privateConstructor();

  // The single instance
  static final OnboardingController instance = OnboardingController._privateConstructor();

  // Factory constructor to return the same instance
  factory OnboardingController() {
    return instance;
  }

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  markOnboarded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarded", true);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      // mark is onboarded
      markOnboarded();

      // Router to login screen
      Global.pushNamed(Routes.loginPage, arguments: null);
      // Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
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
}
