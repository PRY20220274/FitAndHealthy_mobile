import 'dart:convert';

class UserToken {
  String token;
  UserToken({
    required this.token,
  });

  UserToken copyWith({
    String? token,
  }) {
    return UserToken(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory UserToken.fromMap(Map<String, dynamic> map) {
    return UserToken(
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserToken.fromJson(String source) =>
      UserToken.fromMap(json.decode(source));

  @override
  String toString() => 'UserToken(token: $token)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserToken && o.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
