import 'package:dio/dio.dart';

class AuthRepository {
  Future<void> login({
    String? username,
    String? password,
  }) async {
    try {
      final res = await Dio()
          .post('https://vpaygate.vinhomes.vn/api/iam/v0/login/local', data: {
        'username': username,
        'password': password,
        'accountType': 'VHM'
      });
      print(res.data);
    } catch (e) {
      print('error = $e');
      rethrow;
    }
  }
}
