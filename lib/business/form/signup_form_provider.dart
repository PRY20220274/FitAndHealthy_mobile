import 'package:fit_healthy/domain/models/auth/user_signup.dart';
import 'package:flutter/foundation.dart';

class SignUpFormProvider extends ChangeNotifier {
  late UserSignUp _userSignUp = UserSignUp(
    firstName: '',
    email: '',
    password: '',
    gender: '',
    birthDate: DateTime.now(),
  );

  UserSignUp get userSignUp => _userSignUp;

  void buildUserSignUp({
    String? firstName,
    String? email,
    String? password,
    String? gender,
    DateTime? birthDate,
  }) {
    if (gender != null) gender = gender == 'Femenino' ? 'F' : 'M';

    _userSignUp = _userSignUp.copyWith(
      firstName: firstName,
      email: email,
      password: password,
      gender: gender,
      birthDate: birthDate,
    );
  }

  void resetUserSignUp() {
    _userSignUp = UserSignUp(
      firstName: '',
      email: '',
      password: '',
      gender: '',
      birthDate: DateTime.now(),
    );
  }
}
