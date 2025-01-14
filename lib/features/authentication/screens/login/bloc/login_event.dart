import 'package:flutter/cupertino.dart';

abstract class LoginEvent {
  const LoginEvent();
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class UpdatePageOnboarding extends LoginEvent {
  const UpdatePageOnboarding(this.value);

  final int value;

  @override
  List<Object> get props => [value];
}

class NextPageOnboarding extends LoginEvent {
  const NextPageOnboarding(this.pageController);

  final PageController pageController;
}