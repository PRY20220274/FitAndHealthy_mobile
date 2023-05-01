import 'package:fit_healthy/domain/models/goals/physical_goal_create.dart';
import 'package:fit_healthy/domain/models/goals/physical_goal_read.dart';
import 'package:fit_healthy/domain/models/goals/nutritional_goal_create.dart';
import 'package:fit_healthy/domain/models/goals/nutritional_goal_read.dart';
import 'package:fit_healthy/domain/models/goals/physical_nutricional_goal.dart';

abstract class BaseGoalsRepository {
  Future<List<PhysicalNutricionalGoal>> getAllGoals();
  Future<PhysicalGoalRead> postPhysicalGoal(PhysicalGoalCreate physicalGoal);
  Future<NutritionalGoalRead> postNutritionalGoal(NutritionalGoalCreate goal);
  Future<bool> pathGoalCompleted(int idGoal);
}
