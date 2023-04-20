import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/suggestions/suggestion.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_suggestion_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestionRepository extends BaseSuggestionRepository {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<Suggestion> getNutritionalSuggestionToday() async {
    try {
      const url = _baseUrl + '/recommendations-api/food/today';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final nutritionalSuggestionToday = Suggestion.fromMap(response.data);
      return nutritionalSuggestionToday;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<Suggestion> getPhysycalSuggestionToday() async {
    try {
      const url = _baseUrl + '/recommendations-api/physical/today';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final physicalSuggestionToday = Suggestion.fromMap(response.data);
      return physicalSuggestionToday;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
