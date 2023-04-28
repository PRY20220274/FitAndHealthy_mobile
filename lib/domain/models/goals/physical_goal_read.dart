import 'dart:convert';

class PhysicalGoalRead {
  int id;
  int cardioPoints;
  int steps;
  String frequency;
  double calories;
  String description;
  String completed;
  double kilometers;

  PhysicalGoalRead({
    required this.id,
    required this.cardioPoints,
    required this.steps,
    required this.frequency,
    required this.calories,
    required this.description,
    required this.completed,
    required this.kilometers,
  });

  PhysicalGoalRead copyWith({
    int? id,
    int? cardioPoints,
    int? steps,
    String? frequency,
    double? calories,
    String? description,
    String? completed,
    double? kilometers,
  }) {
    return PhysicalGoalRead(
      id: id ?? this.id,
      cardioPoints: cardioPoints ?? this.cardioPoints,
      steps: steps ?? this.steps,
      frequency: frequency ?? this.frequency,
      calories: calories ?? this.calories,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      kilometers: kilometers ?? this.kilometers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardio_points': cardioPoints,
      'steps': steps,
      'frequency': frequency,
      'calories': calories,
      'description': description,
      'completed': completed,
      'kilometers': kilometers,
    };
  }

  factory PhysicalGoalRead.fromMap(Map<String, dynamic> map) {
    return PhysicalGoalRead(
      id: map['id'],
      cardioPoints: map['cardio_points'],
      steps: map['steps'],
      frequency: map['frequency'],
      calories: map['calories'] == null ? null : (map['calories']).toDouble(),
      description: map['description'],
      completed: map['completed'],
      kilometers:
          map['kilometers'] == null ? null : (map['kilometers']).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalGoalRead.fromJson(String source) =>
      PhysicalGoalRead.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhysicalGoalRead(id: $id, cardioPoints: $cardioPoints, steps: $steps, frequency: $frequency, calories: $calories, description: $description, completed: $completed, kilometers: $kilometers)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PhysicalGoalRead &&
        o.id == id &&
        o.cardioPoints == cardioPoints &&
        o.steps == steps &&
        o.frequency == frequency &&
        o.calories == calories &&
        o.description == description &&
        o.completed == completed &&
        o.kilometers == kilometers;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cardioPoints.hashCode ^
        steps.hashCode ^
        frequency.hashCode ^
        calories.hashCode ^
        description.hashCode ^
        completed.hashCode ^
        kilometers.hashCode;
  }
}
