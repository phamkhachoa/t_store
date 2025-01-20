import 'package:flutter/cupertino.dart';

abstract class NavigationEvent {
  const NavigationEvent();
}

final class PageSelectedEvent extends NavigationEvent {
  final int selectedPage;
  const PageSelectedEvent(this.selectedPage);
}