import 'dart:ffi';

import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    // this.status = FormzSubmissionStatus.initial,
    // this.isValidInput = false,
    this.username,
    this.password,
    // this.apiError,
    // this.biometricType = BiometricType.weak,
    // this.toggle = const PasswordToggle.pure(),
    this.isFillFull = false,
    // this.isSave = false,
    // this.isShowBiometric = false,
    // this.typeBiometric,
    // this.sipAccountInfo,
  });

  // final FormzSubmissionStatus status;
  // final bool? isValidInput;
  final String? username;
  final String? password;
  // final PasswordToggle toggle;
  // final ApiError? apiError;
  // final BiometricType biometricType;
  final bool? isFillFull;
  // final bool? isSave;
  // final bool isShowBiometric;
  // final List<BiometricType>? typeBiometric;
  // final SipAccountModel? sipAccountInfo;

  LoginState copyWith({
    String? username,
    String? password,
    bool? isFillFull
  }) {
    var loginState = LoginState(
      // status: status ?? this.status,
      // isValidInput: isValidInput ?? this.isValidInput,
      isFillFull: isFillFull ?? this.isFillFull,
      username: username ?? this.username,
      password: password ?? this.password,
      // apiError: apiError,
      // biometricType: biometricType ?? this.biometricType,
      // toggle: toggle ?? this.toggle,

      // isSave: isSave ?? this.isSave,
      // isShowBiometric: isShowBiometric ?? this.isShowBiometric,
      // typeBiometric: typeBiometric ?? this.typeBiometric,
      // sipAccountInfo: sipAccountInfo ?? this.sipAccountInfo,
    );
    return loginState;
  }

  @override
  List<Object?> get props => [
    // status,
    // isValidInput,
    username,
    password,
    // apiError,
    // biometricType,
    // toggle,
    isFillFull,
    // isSave,
    // typeBiometric,
    // sipAccountInfo
  ];
}
