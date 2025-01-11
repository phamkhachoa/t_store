// import 'package:dio/dio.dart';
// import 'package:vhr/common/constant.dart';
// import 'package:vhr/common/extensions/string_extensions.dart';
// import 'package:vhr/common/global.dart';
// import 'package:vhr/common/logger.dart';
//
// class ApiError {
//   ApiError.parseError(dynamic error) {
//     if (error is DioException) {
//       Logger.d('parseError type ${error.type}');
//       if (error.type == DioExceptionType.connectionTimeout ||
//           error.type == DioExceptionType.sendTimeout ||
//           error.type == DioExceptionType.receiveTimeout ||
//           error.type == DioExceptionType.connectionError) {
//         message = getString().cannotConnectToServer;
//         code = ErrorCode.cannotConnectToServer;
//         return;
//       } else if (error.error is ApiError) {
//         //Lỗi trả về từ BE
//         var apiError = error.error as ApiError;
//         code = apiError.code;
//         message = apiError.message;
//         if (message?.isNotNullEmpty() == true) {
//           return;
//         }
//       } else if (error.response != null) {
//         if (error.response?.data?.toString().contains('message') == true) {
//           message = error.response?.data['message'] as String?;
//           var _code = error.response?.data['code'];
//           if (_code is String) {
//             code = int.parse(_code);
//           } else if (_code is int?) {
//             code = _code;
//           }
//           if (message?.isNotNullEmpty() == true) {
//             return;
//           }
//         } else {
//           code = error.response?.statusCode;
//         }
//       } else {
//         message = error.message;
//       }
//     } else {
//       message = error.toString();
//     }
//     if (message?.toLowerCase().replaceAll(' ', '').contains('networkerror') == true) {
//       message = getString().connectionErrorMsg;
//       code = ErrorCode.networkError;
//     } else if (message?.isNotEmpty == true && code != null) {
//       message = getString().commonErrorMessageAndCode('$code');
//     }
//   }
//
//   ApiError.fromJson(Map<String, dynamic> json) {
//     var _code = json['code'];
//     if (_code is String) {
//       code = int.parse(_code);
//     } else if (_code is int?) {
//       code = _code;
//     }
//     message = json['message'] as String?;
//   }
//
//   ApiError({this.code, this.message});
//
//   int? code;
//   String? message;
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['code'] = code;
//     data['message'] = message;
//     return data;
//   }
// }
//
// extension ApiErrorX on ApiError {
//   String? get clientErrorMessage {
//     switch (code) {
//       case 901:
//         return getString().otpExpired;
//       case 956:
//         // return 'Tính năng OTP của bạn đã bị khóa. Hãy thử lại sau 24 giờ';
//         return message;
//       case 957:
//         return getString().wrongOtp;
//       default:
//         return message;
//     }
//   }
//
//   (bool isError, bool isLock) get checkOTPError {
//     final err = switch (code) {
//       901 => true,
//       956 => true,
//       957 => true,
//       _ => false,
//     };
//     final lock = code == 956;
//     return (err, lock);
//   }
//
//   bool get checkUtilityBookingException => code == 400 || checkRecaptchaInvalid;
//
//   bool get checkRecaptchaInvalid => code == 952;
//
//   bool get checkUtilitySuspicious => code == 1320 || code == 1321;
// }
