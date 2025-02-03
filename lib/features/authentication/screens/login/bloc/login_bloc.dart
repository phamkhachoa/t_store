import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/common/global.dart';
import 'package:t_store/common/routes.dart';
import 'package:t_store/features/authentication/screens/login/bloc/login_event.dart';
import 'package:t_store/features/authentication/screens/login/bloc/login_state.dart';
import 'package:t_store/repository/auth_repository.dart';
import 'package:flutter/material.dart';

import '../../../../shop/screens/home/bloc/home_bloc.dart';
import '../../../../shop/screens/home/bloc/home_event.dart';
import '../../../../shop/screens/home/popup_bloc/popup_bloc.dart';
import '../../../../shop/screens/home/popup_bloc/popup_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<UpdatePageOnboarding>(_onUpdatePageOnboarding);
    on<NextPageOnboarding>(_onNextPageOnboarding);
  }

  final AuthRepository _repository = AuthRepository();

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    _onLogin(username: state.username, password: state.password, onSuccess: event.onSuccess);
  }

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = event.username;
    emit(state.copyWith(
      // apiError: null,
      username: username,
      // isValidInput: isValidInput(state.password, username.value),
    ));

    emit(state.copyWith(isFillFull: _isFillFull(state)));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password;
    emit(state.copyWith(password: password));
    bool isFillFull = _isFillFull(state);
    emit(state.copyWith(isFillFull: isFillFull));
  }

  bool _isFillFull(LoginState state) {
    return state.username?.isNotEmpty == true &&
        state.password?.isNotEmpty == true;
  }

  Future<void> _onLogin({
    String? username,
    String? password,
    required VoidCallback onSuccess,
  }) async {
    try {
      onSuccess();
      // emit(state.copyWith(status: 'authenticated'));
      // Global.pushNamed(Routes.navigationPage, arguments: null);
      // if (isValidInput(username, password)) {
      //   // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      //   final apiError = await _repository.login(
      //     username: username,
      //     password: password,
      //   );
      //
      //   _registerDeviceToken();
      //   // redirect to home
      //   Global.pushNamed(Routes.navigationPage, arguments: null);
      // }
      // Dispatch a success event to the HomeBloc or PopupBloc
      // add(LoadPopupEvent());
    } catch (_) {
      // emit(state.copyWith(
      //   apiError: ApiError(code: ErrorCode.loginFailed),
      //   status: FormzSubmissionStatus.success,
      // ));
    }
  }

  void _onUpdatePageOnboarding(
      UpdatePageOnboarding event, Emitter<LoginState> emit) {
    int page = event.value;
    emit(LoginState(pageIndex: page));
  }

  void _onNextPageOnboarding(
      NextPageOnboarding event, Emitter<LoginState> emit) {
    int nextPage = state.pageIndex + 1;
    emit(state.copyWith(pageIndex: nextPage));
    if (nextPage == 3) {
      // mark is onboarded
      markOnboarded();

      // Router to login screen
      Global.pushNamed(Routes.loginPage, arguments: null);
      // Get.offAll(const LoginScreen());
    } else {
      event.pageController.animateToPage(nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    }
  }

  bool isValidInput(String? username, String? password) {
    return username?.isNotEmpty == true && password?.isNotEmpty == true;
  }

  void _registerDeviceToken() {
    print('Register device token');
  }

  markOnboarded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarded", true);
  }
}
