import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/domain/models/auth/user_token.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<String> signIn(UserLogin userLogin) async {
    try {
      const url = _baseUrl + '/auth-api/login';
      final request = userLogin.toJson();
      final response = await _dio.post(url, data: request);

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      final userToken = UserToken.fromMap(response.data);

      return userToken.token;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
