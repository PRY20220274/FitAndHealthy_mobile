// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class UserSignUp {
  String firstName;
  String email;
  String password;
  String gender;
  DateTime birthDate;
  UserSignUp({
    required this.firstName,
    required this.email,
    required this.password,
    required this.gender,
    required this.birthDate,
  });

  UserSignUp copyWith({
    String? firstName,
    String? email,
    String? password,
    String? gender,
    DateTime? birthDate,
  }) {
    return UserSignUp(
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    final names = firstName.split(' ');
    return <String, dynamic>{
      'first_name': names[0],
      'last_name': names.length > 1 ? names[1] : names[0],
      'email': email,
      'password': password,
      'genre': gender,
      'birth_date': DateFormat('dd/MM/yyyy').format(birthDate),
    };
  }

  factory UserSignUp.fromMap(Map<String, dynamic> map) {
    return UserSignUp(
      firstName: map['first_name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      gender: map['genre'] as String,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birth_date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSignUp.fromJson(String source) =>
      UserSignUp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserSignUp(firstName: $firstName, email: $email, password: $password, gender: $gender, birthDate: $birthDate)';
  }

  @override
  bool operator ==(covariant UserSignUp other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.email == email &&
        other.password == password &&
        other.gender == gender &&
        other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        gender.hashCode ^
        birthDate.hashCode;
  }
}
