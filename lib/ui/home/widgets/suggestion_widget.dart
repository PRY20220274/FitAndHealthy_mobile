import 'package:fit_healthy/domain/utils/constants/suggestions_titles_constant.dart';
import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    Key? key,
    required this.typeSuggestion,
    required this.description,
  }) : super(key: key);

  final TypeSuggestion typeSuggestion;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(children: [
        Text(
          suggestionsTitles[typeSuggestion]!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Palette.green.shade200,//Colors.teal,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 250,
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
