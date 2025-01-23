import 'package:flutter/cupertino.dart';

abstract class PopupEvent {
  const PopupEvent();
}

final class LoadPopupEvent extends PopupEvent {
  const LoadPopupEvent();
}