import 'package:fit_healthy/domain/models/suggestions/suggestion.dart';
import 'package:fit_healthy/persistence/remote/implements/suggestion_repository.dart';
import 'package:flutter/material.dart';

class SuggestionProvider extends ChangeNotifier {
  final SuggestionRepository _suggestionRepository;

  SuggestionProvider(this._suggestionRepository);

  late Suggestion _physicalSuggestionToday = Suggestion(id: 0, description: '');
  late Suggestion _nutritionalSuggestionToday = Suggestion(id: 0, description: '');

  Suggestion get physicalSuggestionToday => _physicalSuggestionToday;
  Suggestion get nutritionalSuggestionToday => _nutritionalSuggestionToday;


  Future<void> getSuggestionsToday() async {
    try {
      _physicalSuggestionToday = await _suggestionRepository.getPhysycalSuggestionToday();
      _nutritionalSuggestionToday = await _suggestionRepository.getNutritionalSuggestionToday();
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
      rethrow;
    }
  }

}