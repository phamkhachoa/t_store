import 'package:flutter/cupertino.dart';

abstract class HomeEvent {
  const HomeEvent();
}

final class SliderFetchEvent extends HomeEvent {
  const SliderFetchEvent();
}

final class PopularCategoryFetchEvent extends HomeEvent {
  const PopularCategoryFetchEvent();
}

final class LoginSuccessEvent extends HomeEvent {
  const LoginSuccessEvent();
}