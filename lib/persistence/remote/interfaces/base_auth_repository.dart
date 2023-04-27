import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/domain/models/auth/user_signup.dart';
import 'package:fit_healthy/domain/models/auth/user_token.dart';

abstract class BaseAuthRepository {
  Future<String> signIn(UserLogin userLogin);
  Future<void> signUp(UserSignUp userSignUp);
}
