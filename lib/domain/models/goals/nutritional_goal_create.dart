// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NutritionalGoalCreate {
  int objective;
  int activity;
  
  NutritionalGoalCreate({
    required this.objective,
    required this.activity,
  });

  NutritionalGoalCreate copyWith({
    int? objective,
    int? activity,
  }) {
    return NutritionalGoalCreate(
      objective: objective ?? this.objective,
      activity: activity ?? this.activity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objective': objective,
      'activity': activity,
    };
  }

  factory NutritionalGoalCreate.fromMap(Map<String, dynamic> map) {
    return NutritionalGoalCreate(
      objective: map['objective'] as int,
      activity: map['activity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NutritionalGoalCreate.fromJson(String source) => NutritionalGoalCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NutritionalGoalCreate(objective: $objective, activity: $activity)';

  @override
  bool operator ==(covariant NutritionalGoalCreate other) {
    if (identical(this, other)) return true;
  
    return 
      other.objective == objective &&
      other.activity == activity;
  }

  @override
  int get hashCode => objective.hashCode ^ activity.hashCode;
}
