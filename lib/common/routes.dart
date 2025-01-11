import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/home/home.dart';

class Routes {
  static const homePage = '/homePage';

  static var routes = <String, WidgetBuilder>{
    homePage: (_) => HomeScreen(),
  };
}
