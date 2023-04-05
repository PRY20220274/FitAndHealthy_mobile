import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';

InputDecoration appInputDecoration(
    {required String labelText, required Color fillColor}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Palette.green.shade200),
    border: const OutlineInputBorder(),
    fillColor: fillColor,
    filled: true,
  );
}