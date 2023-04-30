import 'package:fit_healthy/business/suggestion/suggestion_provider.dart';
import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:provider/provider.dart';

class SuggestionsListPage extends StatelessWidget {
  const SuggestionsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suggestionProvider = Provider.of<SuggestionProvider>(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 8, right: 8),
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
            ...suggestionProvider.allSuggestions.map((e) {
              int idx = suggestionProvider.allSuggestions.indexOf(e);
              if (e.type == TypeSuggestion.physical) {
                return Stack(
                  children: [
                    ChatBubble(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: ComplementPalette.green.shade50,
                      clipper:
                          ChatBubbleClipper6(type: BubbleType.receiverBubble),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(e.description),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: size.width * 0.35,
                      child: IconButton(
                        icon: Icon(
                          e.like ? Icons.favorite : Icons.favorite_border,
                          size: 30,
                          color: Colors.blue.shade500,
                        ),
                        onPressed: () {
                          suggestionProvider.updateFavorite(idx, !e.like);
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Stack(
                  children: [
                    ChatBubble(
                      margin: const EdgeInsets.only(top: 20),
                      backGroundColor: ComplementPalette.green.shade100,
                      alignment: Alignment.topRight,
                      clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(e.description),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: size.width * 0.35,
                      child: IconButton(
                        icon: Icon(
                          e.like ? Icons.favorite : Icons.favorite_border,
                          size: 30,
                          color: Colors.red.shade600,
                        ),
                        onPressed: () {
                          suggestionProvider.updateFavorite(idx, !e.like);
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
            /*const SuggestionBubbleMessageWidget(
              message:
                  'Según la OMS debes alcanzar de 3000 a 4000 MET minutos por semana',
              suggestion: TypeSuggestion.physical,
            ),
            const SuggestionBubbleMessageWidget(
              message:
                  'Según la OMS debes alcanzar de 3000 a 4000 MET minutos por semana',
              suggestion: TypeSuggestion.nutritional,
            ),*/
          ],
        ),
      ),
    );
  }
}
