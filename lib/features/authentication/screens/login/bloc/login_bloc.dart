import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/global.dart';
import 'package:t_store/common/routes.dart';
import 'package:t_store/features/authentication/screens/login/bloc/login_event.dart';
import 'package:t_store/features/authentication/screens/login/bloc/login_state.dart';
import 'package:t_store/repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  final AuthRepository _repository = AuthRepository();

  void _onSubmitted(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    _onLogin(username: state.username,  password: state.password);
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
    emit(state.copyWith(
        password: password));
    bool isFillFull = _isFillFull(state);
    emit(state.copyWith(isFillFull: isFillFull));
  }

  bool _isFillFull(LoginState state) {
    return state.username?.isNotEmpty == true && state.password?.isNotEmpty == true;
  }

  Future<void> _onLogin({String? username, String? password}) async {
    try {
      if (isValidInput(username, password)) {
        // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        final apiError = await _repository.login(
          username: username,
          password: password,
        );

          _registerDeviceToken();
          // redirect to home
        Global.pushNamed(Routes.homePage, arguments: null);
      }
    } catch (_) {
      // emit(state.copyWith(
      //   apiError: ApiError(code: ErrorCode.loginFailed),
      //   status: FormzSubmissionStatus.success,
      // ));
    }
  }

  bool isValidInput(String? username, String? password) {
    return username?.isNotEmpty == true && password?.isNotEmpty == true;
  }

  void _registerDeviceToken() {
    print('Register device token');
  }
}