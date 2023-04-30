import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionnaireCreate {
  int questionnaire;
  List<int> answers;
  QuestionnaireCreate({
    required this.questionnaire,
    required this.answers,
  });

  QuestionnaireCreate copyWith({
    int? questionnaire,
    List<int>? answers,
  }) {
    return QuestionnaireCreate(
      questionnaire: questionnaire ?? this.questionnaire,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionnaire': questionnaire,
      'answers': answers,
    };
  }

  factory QuestionnaireCreate.fromMap(Map<String, dynamic> map) {
    return QuestionnaireCreate(
      questionnaire: map['questionnaire'] as int,
      answers: List<int>.from(map['answers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionnaireCreate.fromJson(String source) =>
      QuestionnaireCreate.fromMap(json.decode(source));

  @override
  String toString() =>
      'QuestionnaireCreate(questionnaire: $questionnaire, answers: $answers)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionnaireCreate &&
        o.questionnaire == questionnaire &&
        listEquals(o.answers, answers);
  }

  @override
  int get hashCode => questionnaire.hashCode ^ answers.hashCode;
}
