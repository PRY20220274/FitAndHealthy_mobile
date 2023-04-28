import 'package:fit_healthy/domain/models/goals/nutritional_goal_create.dart';
import 'package:fit_healthy/domain/models/goals/nutritional_goal_read.dart';
import 'package:fit_healthy/persistence/remote/implements/goals_repository.dart';
import 'package:flutter/foundation.dart';

class NutritionalGoalProvider extends ChangeNotifier {
  final GoalsRepository _goalsRepository;

  NutritionalGoalProvider(this._goalsRepository);

  NutritionalGoalRead? _nutritionalGoalRead;
  NutritionalGoalCreate _nutritionalGoalCreate = NutritionalGoalCreate(objective: 0, activity: 0);

  NutritionalGoalRead? get nutritionalGoalRead => _nutritionalGoalRead;
  NutritionalGoalCreate get nutritionalGoalCreate => _nutritionalGoalCreate;

  Future<void> postNutritionalGoal() async {
    try {
      _nutritionalGoalRead = await _goalsRepository.postNutritionalGoal(_nutritionalGoalCreate);
      notifyListeners();
    } on Exception catch (_) {
      rethrow;
    }
  }

  void builNutritionalGoal({int? activity, int? objective}) {
    _nutritionalGoalCreate = _nutritionalGoalCreate.copyWith(activity: activity, objective: objective);
  }

  void resetNutritionalGoal() {
    _nutritionalGoalCreate = NutritionalGoalCreate(objective: 0, activity: 0);
    _nutritionalGoalRead = null;
  }
}