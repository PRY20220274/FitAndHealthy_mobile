import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/goals/physical_nutricional_goal.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_goals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalsRepository extends BaseGoals {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<List<PhysicalNutricionalGoal>> getAllGoals() async {
    try {
      // Get all nutricional goals
      const urlFood = _baseUrl + '/motivations-api/food-goals';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final responseFood = await _dio.get(urlFood,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (responseFood.statusCode != 200) {
        throw Exception(responseFood.statusCode);
      }

      final nutricionalGoals = (responseFood.data as List)
          .map((e) => PhysicalNutricionalGoal.fromMap(e, TypeGoal.nutritional))
          .toList();

      // Get all Physical goals
      const urlPhysical = _baseUrl + '/motivations-api/physical-goals';
      final responsePhysical = await _dio.get(urlPhysical,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (responsePhysical.statusCode != 200) {
        throw Exception(responsePhysical.statusCode);
      }

      final physicalGoals = (responsePhysical.data as List)
          .map((e) => PhysicalNutricionalGoal.fromMap(e, TypeGoal.physical))
          .toList();

      final allGoals = List<PhysicalNutricionalGoal>.from(nutricionalGoals)
        ..addAll(physicalGoals);

      return allGoals;
    } on Exception catch (_) {
      rethrow;
    }
  }
}