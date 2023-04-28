import 'package:fit_healthy/domain/models/goals/physical_goal_create.dart';

class GoalFormProvider {
  late PhysicalGoalCreate _physicalGoalCreate = PhysicalGoalCreate(
      frequency: null,
      steps: null,
      kilometers: null,
      cardioPoints: null,
      calories: null);

  PhysicalGoalCreate get physicalGoalCreate => _physicalGoalCreate;

  void buildPhysicalGoalCreate(
      {int? frequency,
      int? steps,
      double? kilometers,
      double? calories,
      int? cardioPoints}) {
    _physicalGoalCreate = _physicalGoalCreate.copyWith(
        frequency: frequency,
        kilometers: kilometers,
        steps: steps,
        cardioPoints: cardioPoints,
        calories: calories);
  }
}
