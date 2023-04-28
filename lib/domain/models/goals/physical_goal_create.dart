import 'dart:convert';

class PhysicalGoalCreate {
  int? steps;
  double? kilometers;
  double? calories;
  int? cardioPoints;
  int? frequency;

  PhysicalGoalCreate({
    this.steps,
    this.kilometers,
    this.calories,
    this.cardioPoints,
    this.frequency,
  });

  PhysicalGoalCreate copyWith({
    int? steps,
    double? kilometers,
    double? calories,
    int? cardioPoints,
    int? frequency,
  }) {
    return PhysicalGoalCreate(
      steps: steps ?? this.steps,
      kilometers: kilometers ?? this.kilometers,
      calories: calories ?? this.calories,
      cardioPoints: cardioPoints ?? this.cardioPoints,
      frequency: frequency ?? this.frequency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'steps': steps,
      'kilometers': kilometers,
      'calories': calories,
      'cardio_points': cardioPoints,
      'frequency': frequency,
    };
  }

  factory PhysicalGoalCreate.fromMap(Map<String, dynamic> map) {
    return PhysicalGoalCreate(
      steps: map['steps'],
      kilometers: map['kilometers'] == null
          ? null
          : (map['kilometers'] as int).toDouble(),
      calories:
          map['calories'] == null ? null : (map['calories'] as int).toDouble(),
      cardioPoints: map['cardio_points'],
      frequency: map['frequency'] == null ? null : map['frequency'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalGoalCreate.fromJson(String source) =>
      PhysicalGoalCreate.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhysicalGoalCreate(steps: $steps, kilometers: $kilometers, calories: $calories, cardioPoints: $cardioPoints, frequency: $frequency)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PhysicalGoalCreate &&
        o.steps == steps &&
        o.kilometers == kilometers &&
        o.calories == calories &&
        o.cardioPoints == cardioPoints &&
        o.frequency == frequency;
  }

  @override
  int get hashCode {
    return steps.hashCode ^
        kilometers.hashCode ^
        calories.hashCode ^
        cardioPoints.hashCode ^
        frequency.hashCode;
  }
}
