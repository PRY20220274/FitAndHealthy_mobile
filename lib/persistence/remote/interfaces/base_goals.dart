import 'package:fit_healthy/domain/models/goals/nutritional_goal_create.dart';
import 'package:fit_healthy/domain/models/goals/nutritional_goal_read.dart';
import 'package:fit_healthy/domain/models/goals/physical_nutricional_goal.dart';

abstract class BaseGoals {
  Future<List<PhysicalNutricionalGoal>> getAllGoals();
  Future<NutritionalGoalRead> postNutritionalGoal(NutritionalGoalCreate goal);
}
