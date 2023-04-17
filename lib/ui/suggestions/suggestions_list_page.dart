import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:fit_healthy/ui/suggestions/widgets/suggestion_bubble_message_widget.dart';
import 'package:flutter/material.dart';

class SuggestionsListPage extends StatelessWidget {
  const SuggestionsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top:40, bottom: 20, left: 8, right: 8),
              child: TitlePageWidget(title: 'Recomendaciones'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recomendaciones\nFísicas',
                    style: TextStyle(color: ComplementPalette.green.shade700),
                  ),
                  Text(
                    'Recomendaciones\nAlimenticias',
                    style: TextStyle(color: ComplementPalette.green.shade700),
                  ),
                ],
              ),
            ),
            const SuggestionBubbleMessageWidget(
              message:
                  'Según la OMS debes alcanzar de 3000 a 4000 MET minutos por semana',
              suggestion: TypeSuggestion.physical,
            ),
            const SuggestionBubbleMessageWidget(
              message:
                  'Según la OMS debes alcanzar de 3000 a 4000 MET minutos por semana',
              suggestion: TypeSuggestion.nutritional,
            ),
          ],
        ),
      ),
    );
  }
}
