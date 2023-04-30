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

  String? validateCalories(String? value) {
    if (value == null || value.isEmpty) return 'Campo requerido.';

    const heightRegex = r"""^(?!0*[.,]0*$|[.,]0*$|0*$)\d+[,.]?\d{0,2}$""";

    if (!RegExp(heightRegex).hasMatch(value)) {
      return 'Calorías inválidas.';
    } else {
      return null;
    }
  }

  String? validateKilometers(String? value) {
    if (value == null || value.isEmpty) return 'Campo requerido.';

    const heightRegex = r"""^(?!0*[.,]0*$|[.,]0*$|0*$)\d+[,.]?\d{0,2}$""";

    if (!RegExp(heightRegex).hasMatch(value)) {
      return 'Kilómetros inválidos.';
    } else {
      return null;
    }
  }

  String? validateNulls(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido.';
    } else {
      return null;
    }
  }

}
