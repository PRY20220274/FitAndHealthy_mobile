import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fit_healthy/domain/models/forms/question_read.dart';

class FormRead {
  String name;
  String category;
  int id;
  List<QuestionRead> questions;
  String frequency;
  FormRead({
    required this.name,
    required this.category,
    required this.id,
    required this.questions,
    required this.frequency,
  });

  FormRead copyWith(
      {String? name,
      String? category,
      int? id,
      List<QuestionRead>? questions,
      String? frequency}) {
    return FormRead(
      name: name ?? this.name,
      category: category ?? this.category,
      id: id ?? this.id,
      questions: questions ?? this.questions,
      frequency: frequency ?? this.frequency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'id': id,
      'questions': questions.map((x) => x.toMap()).toList(),
      'frequency': frequency,
    };
  }

  factory FormRead.fromMap(Map<String, dynamic> map) {
    return FormRead(
      name: map['name'],
      category: map['category'],
      id: map['id'],
      questions: List<QuestionRead>.from(
          map['questions']?.map((x) => QuestionRead.fromMap(x))),
      frequency: map['frequency'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FormRead.fromJson(String source) =>
      FormRead.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FormRead(name: $name, category: $category, id: $id, questions: $questions, frequency: $frequency)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FormRead &&
        o.name == name &&
        o.category == category &&
        o.id == id &&
        listEquals(o.questions, questions) &&
        o.frequency == frequency;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        id.hashCode ^
        questions.hashCode ^
        frequency.hashCode;
  }
}
