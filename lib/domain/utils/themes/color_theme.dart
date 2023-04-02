import 'package:flutter/material.dart';

class Palette {
  static const int _kgreen = 0xFF3BAD8C;

  static const MaterialColor green = MaterialColor(_kgreen, <int, Color>{
    50: Color.fromRGBO(224, 242, 237, 1),
    200: Color(_kgreen),
  });
}
