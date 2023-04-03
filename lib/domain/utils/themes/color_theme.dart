import 'package:flutter/material.dart';

class Palette {
  static const int _kgreen = 0xFF3BAD8C;

  static const MaterialColor green = MaterialColor(_kgreen, <int, Color>{
    50: Color.fromRGBO(224, 242, 237, 1),
    200: Color(_kgreen),
  });
}

class ComplementPalette {
  static const int _kgreen = 0xFF3BAD8C;

  static const MaterialColor green = MaterialColor(_kgreen, <int, Color> {
    50: Color(0XFFe1f3ef),
    100: Color(0XFFb6e2d5),
    200: Color(0XFF88d0bb),
    300: Color(0XFF5abca0),
    400: Color(_kgreen),
    500: Color(0XFF279e7b),
    600: Color(0XFF23906f),
    700: Color(0XFF1d8060),
    800: Color(0XFF167052),
    900: Color(0XFF0f5438),
  });
}
