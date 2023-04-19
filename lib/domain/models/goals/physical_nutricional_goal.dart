import 'dart:convert';

import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';

class PhysicalNutricionalGoal {
  int id;
  String description;
  String? activity;
  String? objective;
  String completed;

  int? steps;
  double? kilometers;
  double? calories;
  int? cardioPoints;
  String? frequency;
  TypeGoal typeGoal;

  PhysicalNutricionalGoal({
    required this.id,
    required this.description,
    this.activity,
    this.objective,
    required this.completed,
    this.steps,
    this.kilometers,
    this.calories,
    required this.cardioPoints,
    this.frequency,
    required this.typeGoal,
  });

  PhysicalNutricionalGoal copyWith(
      {int? id,
      String? description,
      String? activity,
      String? objective,
      String? completed,
      int? steps,
      double? kilometers,
      double? calories,
      int? cardioPoints,
      String? frequency,
      TypeGoal? typeGoal}) {
    return PhysicalNutricionalGoal(
      id: id ?? this.id,
      description: description ?? this.description,
      activity: activity ?? this.activity,
      objective: objective ?? this.objective,
      completed: completed ?? this.completed,
      steps: steps ?? this.steps,
      kilometers: kilometers ?? this.kilometers,
      calories: calories ?? this.calories,
      cardioPoints: cardioPoints ?? this.cardioPoints,
      frequency: frequency ?? this.frequency,
      typeGoal: typeGoal ?? this.typeGoal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'activity': activity,
      'objective': objective,
      'completed': completed,
      'steps': steps,
      'kilometers': kilometers,
      'calories': calories,
      'cardio_points': cardioPoints,
      'frequency': frequency,
    };
  }

  factory PhysicalNutricionalGoal.fromMap(
      Map<String, dynamic> map, TypeGoal typeGoal) {
    return PhysicalNutricionalGoal(
        id: map['id'] as int,
        description: map['description'],
        activity: map['activity'],
        objective: map['objective'],
        completed: map['completed'],
        steps: map['steps'],
        kilometers: map['kilometers'] == null
            ? null
            : (map['kilometers'] as int).toDouble(),
        calories: map['calories'] == null
            ? null
            : (map['calories'] as int).toDouble(),
        cardioPoints: map['cardio_points'],
        frequency: map['frequency'],
        typeGoal: typeGoal);
  }

  String toJson() => json.encode(toMap());

  factory PhysicalNutricionalGoal.fromJson(String source, TypeGoal typeGoal) =>
      PhysicalNutricionalGoal.fromMap(json.decode(source), typeGoal);

  @override
  String toString() {
    return 'PhysicalNutricionalGoal(id: $id, description: $description, activity: $activity, objective: $objective, completed: $completed, steps: $steps, kilometers: $kilometers, calories: $calories, cardioPoints: $cardioPoints, frequency: $frequency)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PhysicalNutricionalGoal &&
        o.id == id &&
        o.description == description &&
        o.activity == activity &&
        o.objective == objective &&
        o.completed == completed &&
        o.steps == steps &&
        o.kilometers == kilometers &&
        o.calories == calories &&
        o.cardioPoints == cardioPoints &&
        o.frequency == frequency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        activity.hashCode ^
        objective.hashCode ^
        completed.hashCode ^
        steps.hashCode ^
        kilometers.hashCode ^
        calories.hashCode ^
        cardioPoints.hashCode ^
        frequency.hashCode;
  }
}
