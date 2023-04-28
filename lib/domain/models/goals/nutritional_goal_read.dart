// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NutritionalGoalRead {
  int id;
  String description;
  String objective;
  String activity;
  bool completed;

  NutritionalGoalRead({
    required this.id,
    required this.description,
    required this.objective,
    required this.activity,
    required this.completed,
  });

  NutritionalGoalRead copyWith({
    int? id,
    String? description,
    String? objective,
    String? activity,
    bool? completed,
  }) {
    return NutritionalGoalRead(
      id: id ?? this.id,
      description: description ?? this.description,
      objective: objective ?? this.objective,
      activity: activity ?? this.activity,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'objective': objective,
      'activity': activity,
      'completed': completed,
    };
  }

  factory NutritionalGoalRead.fromMap(Map<String, dynamic> map) {
    return NutritionalGoalRead(
      id: map['id'] as int,
      description: map['description'] as String,
      objective: map['objective'] as String,
      activity: map['activity'] as String,
      completed: map['completed'] == 'No completado' ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory NutritionalGoalRead.fromJson(String source) => NutritionalGoalRead.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NutritionalGoalRead(id: $id, description: $description, objective: $objective, activity: $activity, completed: $completed)';
  }

  @override
  bool operator ==(covariant NutritionalGoalRead other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.objective == objective &&
      other.activity == activity &&
      other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      objective.hashCode ^
      activity.hashCode ^
      completed.hashCode;
  }
}
