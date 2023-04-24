import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fit_healthy/domain/models/forms/alternative_read.dart';

class QuestionRead {
  int id;
  String description;
  List<AlternativeRead> alternatives;

  QuestionRead({
    required this.id,
    required this.description,
    required this.alternatives,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'alternatives': alternatives.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionRead.fromMap(Map<String, dynamic> map) {
    return QuestionRead(
      id: map['id'],
      description: map['description'],
      alternatives: List<AlternativeRead>.from(
          map['alternatives']?.map((x) => AlternativeRead.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionRead.fromJson(String source) =>
      QuestionRead.fromMap(json.decode(source));

  @override
  String toString() =>
      'QuestionRead(id: $id, description: $description, alternatives: $alternatives)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionRead &&
        o.id == id &&
        o.description == description &&
        listEquals(o.alternatives, alternatives);
  }

  @override
  int get hashCode =>
      id.hashCode ^ description.hashCode ^ alternatives.hashCode;

  QuestionRead copyWith({
    int? id,
    String? description,
    List<AlternativeRead>? alternatives,
  }) {
    return QuestionRead(
      id: id ?? this.id,
      description: description ?? this.description,
      alternatives: alternatives ?? this.alternatives,
    );
  }
}
