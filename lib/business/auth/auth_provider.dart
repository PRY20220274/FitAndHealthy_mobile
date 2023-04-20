import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/persistence/remote/implements/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  late bool _isLoading = false;
  late String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<String> signIn(UserLogin userLogin) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _authRepository.signIn(userLogin);
      _isLoading = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print('===== token ${prefs.getString("token")}');

      notifyListeners();
      return result;
    } on Exception catch (err) {
      _isLoading = false;
      _errorMessage = err.toString();
      notifyListeners();
      rethrow;
    }
  }
}
