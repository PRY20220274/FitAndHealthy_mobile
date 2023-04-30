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

InputDecoration appInputDecoration2(
    {required String labelText, required Color fillColor}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Palette.green.shade200),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.green.shade200, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.green.shade200, width: 2),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.green.shade200, width: 2),
    ),
    fillColor: fillColor,
    filled: true,
  );
}
