import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/types/objective.dart';
import 'package:fit_healthy/domain/models/types/activity.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_types_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypesRepository extends BaseTypesRepository {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<List<Activity>> getActivities() async {
    try {
      const url = _baseUrl + '/motivations-api/activities';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      final activities =  (response.data as List)
        .map((e) => Activity.fromMap(e))
        .toList();
      
      return activities;

    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Objective>> getObjectives() async {
    try {
      const url = _baseUrl + '/motivations-api/objectives';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      final objectives =  (response.data as List)
        .map((e) => Objective.fromMap(e))
        .toList();
      
      return objectives;

    } on Exception catch (_) {
      rethrow;
    }
  }
}
