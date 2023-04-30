// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MeasureUpdate {
  double weight;
  double height;

  MeasureUpdate({
    required this.weight,
    required this.height,
  });

  MeasureUpdate copyWith({
    double? weight,
    double? height,
  }) {
    return MeasureUpdate(
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight,
      'height': height,
    };
  }

  factory MeasureUpdate.fromMap(Map<String, dynamic> map) {
    return MeasureUpdate(
      weight: map['weight'] as double,
      height: map['height'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeasureUpdate.fromJson(String source) =>
      MeasureUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MeasureUpdate(weight: $weight, height: $height)';

  @override
  bool operator ==(covariant MeasureUpdate other) {
    if (identical(this, other)) return true;

    return other.weight == weight && other.height == height;
  }

  @override
  int get hashCode => weight.hashCode ^ height.hashCode;
}
