import 'package:fit_healthy/domain/models/goals/physical_nutricional_goal.dart';

abstract class BaseGoals {
  Future<List<PhysicalNutricionalGoal>> getAllGoals();
}
