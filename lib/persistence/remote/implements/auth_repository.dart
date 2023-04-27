import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/domain/models/auth/user_signup.dart';
import 'package:fit_healthy/domain/models/auth/user_token.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", userToken.token);
      return userToken.token;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> signUp(UserSignUp userSignUp) async {
    try {
      const url = _baseUrl + '/auth-api/register';
      final request = userSignUp.toJson();
      final response = await _dio.post(url, data: request);

      if (response.statusCode != 201) {
        throw Exception(response.statusCode);
      }
      return true;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
