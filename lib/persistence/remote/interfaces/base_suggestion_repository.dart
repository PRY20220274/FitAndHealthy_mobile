import 'package:fit_healthy/domain/models/suggestions/suggestion.dart';

abstract class BaseSuggestionRepository {
  Future<Suggestion> getPhysycalSuggestionToday();
  Future<Suggestion> getNutritionalSuggestionToday();
}