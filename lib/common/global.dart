
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature_enum.dart';
import 'hive_utils.dart';

class Global {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState getNav() {
    return Global.navigatorKey.currentState!;
  }

  static Future<Object?> pushNamed(String name, {Object? arguments, FeatureEnum? feature}) {
    // if (feature != null) {
    //   countUsageFeature(feature);
    // }
    // logEvent(name);
    return getNav().pushNamed(name, arguments: arguments);
  }

  static Future<void> countUsageFeature(FeatureEnum feature) async {
    final box = await HiveUtils.openBox(boxName: HiveBox.featureUsage);
    int count = box.get(feature.name, defaultValue: 0);
    box.put(feature.name, count + 1);
  }
}

void logEvent(String name, {Map<String, Object>? parameters}) async {
  // FirebaseAnalytics.instance.logEvent(
  //   name: name.replaceAll(RegExp(r"[^\s\w]"), ''),
  //   parameters: parameters,
  // );
  final prefs = await SharedPreferences.getInstance();
  final screenCount = prefs.getInt(PrefKeys.prefScreenCount) ?? 0;
  prefs.setInt(PrefKeys.prefScreenCount, screenCount + 1);
}

class HiveBox {
  static const newsPopup = "news_popup";
  static const featureUsage = "feature_usage";
  static const existNewsPopupBox = "exist_news_popup_box";
}

class PrefKeys {
  static const prefStarted = 'prefStarted';
  static const prefLoggedIn = 'prefLoggedIn';
  static const prefAuthInfo = 'prefAuthInfo';
  static const prefBaseUrl = 'prefBaseUrl';
  static const prefUserPhone = 'prefUserPhone';
  static const prefUserId = 'prefUserId';
  static const prefFCMToken = 'prefFCMToken';
  static const prefVoIPToken = 'prefVoIPToken';
  static const prefUserInfo = 'prefUserInfo';
  static const prefDeviceId = 'prefDeviceId';
  static const prefIsBiometric = 'prefIsBiometric';
  static const prefUtilities = 'prefUtilities';
  static const prefServices = 'prefServices';
  static const prefAppConfigs = 'prefAppConfigs';
  static const prefCustomerInfo = 'prefCustomerInfo';
  static const prefNewsPopupId = 'prefNewsPopupId';
  static const prefTimeCount = 'prefTimeCount';
  static const prefDevEnvironment = 'prefDevEnvironment';
  static const prefPaymentMethods = 'prefPaymentMethods';

  static const prefLastComment = 'prefLastComment';
  static const prefInAppReviewAt = 'prefInAppReviewAt';
  static const prefSuccessCount = 'prefSuccessCount';
  static const prefScreenCount = 'prefScreenCount';
  static const prefSipAccount = 'prefSipAccount';
  static const prefZKCallSetting = 'prefZKCallSetting';

  static const prefRecommendedUpdate = "prefRecommendedUpdate";
  static const prefBannerVersion = "prefBannerVersion";
  static const prefCurrentRunEventId = "prefCurrentRunEventId";

  static const prefUploadedLogs = "prefUploadedLogs";
}