// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserPhysicalData {
  int id;
  int steps;
  int heartRate;
  int cardioPoints;
  int breathingRate;
  double calories;
  double kilometersTraveled;

  UserPhysicalData({
    required this.id,
    required this.steps,
    required this.heartRate,
    required this.cardioPoints,
    required this.breathingRate,
    required this.calories,
    required this.kilometersTraveled,
  });


  UserPhysicalData copyWith({
    int? id,
    int? steps,
    int? heartRate,
    int? cardioPoints,
    int? breathingRate,
    double? calories,
    double? kilometersTraveled,
  }) {
    return UserPhysicalData(
      id: id ?? this.id,
      steps: steps ?? this.steps,
      heartRate: heartRate ?? this.heartRate,
      cardioPoints: cardioPoints ?? this.cardioPoints,
      breathingRate: breathingRate ?? this.breathingRate,
      calories: calories ?? this.calories,
      kilometersTraveled: kilometersTraveled ?? this.kilometersTraveled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'steps': steps,
      'heart_rate': heartRate,
      'cardio_points': cardioPoints,
      'breathing_rate': breathingRate,
      'calories': calories,
      'kilometers_traveled': kilometersTraveled,
    };
  }

  factory UserPhysicalData.fromMap(Map<String, dynamic> map) {
    return UserPhysicalData(
      id: map['id'] as int,
      steps: map['steps'] as int,
      heartRate: map['heart_rate'] as int,
      cardioPoints: map['cardio_points'] as int,
      breathingRate: map['breathing_rate'] as int,
      calories: (map['calories'] as int).toDouble(),
      kilometersTraveled: (map['kilometers_traveled'] as int).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPhysicalData.fromJson(String source) => UserPhysicalData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserPhysicalData(id: $id, steps: $steps, heartRate: $heartRate, cardioPoint: $cardioPoints, breathingRate: $breathingRate, calories: $calories, kilometersTraveled: $kilometersTraveled)';
  }

  @override
  bool operator ==(covariant UserPhysicalData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.steps == steps &&
      other.heartRate == heartRate &&
      other.cardioPoints == cardioPoints &&
      other.breathingRate == breathingRate &&
      other.calories == calories &&
      other.kilometersTraveled == kilometersTraveled;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      steps.hashCode ^
      heartRate.hashCode ^
      cardioPoints.hashCode ^
      breathingRate.hashCode ^
      calories.hashCode ^
      kilometersTraveled.hashCode;
  }
}
