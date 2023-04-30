import 'dart:collection';

import 'package:fit_healthy/domain/models/suggestions/suggestion.dart';
import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/persistence/remote/implements/suggestion_repository.dart';
import 'package:flutter/material.dart';

class SuggestionProvider extends ChangeNotifier {
  final SuggestionRepository _suggestionRepository;

  SuggestionProvider(this._suggestionRepository);

  late Suggestion _physicalSuggestionToday = Suggestion(
    id: 0,
    description: '',
    like: false,
    type: TypeSuggestion.physical,
  );
  late Suggestion _nutritionalSuggestionToday = Suggestion(
    id: 0,
    description: '',
    like: false,
    type: TypeSuggestion.nutritional,
  );

  late List<Suggestion> _allSuggestions = [];

  Suggestion get physicalSuggestionToday => _physicalSuggestionToday;
  Suggestion get nutritionalSuggestionToday => _nutritionalSuggestionToday;
  List<Suggestion> get allSuggestions => _allSuggestions;

  Future<void> getSuggestionsToday() async {
    try {
      _physicalSuggestionToday =
          await _suggestionRepository.getPhysycalSuggestionToday();
      _nutritionalSuggestionToday =
          await _suggestionRepository.getNutritionalSuggestionToday();
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  Future<void> getAllSuggestions() async {
    try {
      final physicalSuggestions =
          await _suggestionRepository.getAllPhysicalSuggestions();
      final nutritionalSuggestions =
          await _suggestionRepository.getAllNutritionalSuggestions();

      final leftQueue = ListQueue.of(physicalSuggestions);
      final rightQueue = ListQueue.of(nutritionalSuggestions);

      List<Suggestion> finalList = [];
      bool left = true;

      while (!leftQueue.isEmpty || !rightQueue.isEmpty) {
        if (left) {
          finalList.add(leftQueue.removeFirst());
          if (!rightQueue.isEmpty) left = false;
        } else {
          finalList.add(rightQueue.removeFirst());
          if (!leftQueue.isEmpty) left = true;
        }
      }

      _allSuggestions = finalList;

      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  void updateFavorite (int index, bool value) {
    _allSuggestions[index].like = value;
    notifyListeners();
  }
}
