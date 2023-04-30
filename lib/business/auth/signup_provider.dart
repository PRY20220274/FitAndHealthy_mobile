import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/domain/models/auth/user_signup.dart';
import 'package:fit_healthy/persistence/remote/implements/auth_repository.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  SignUpProvider(this._authRepository);

  late bool _isLoading = false;
  late bool _userCreated = false;

  bool get isLoading => _isLoading;
  bool get userCreated => _userCreated;

  Future<void> signUp(UserSignUp userSignUp) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _authRepository.signUp(userSignUp);

      final userLogin = UserLogin(
        email: userSignUp.email,
        password: userSignUp.password,
      );

      await _authRepository.signIn(userLogin);

      _isLoading = false;
      _userCreated = result;
      notifyListeners();
    } on Exception catch (_) {
      _isLoading = false;
      _userCreated = false;
      notifyListeners();
      rethrow;
    }
  }
}
