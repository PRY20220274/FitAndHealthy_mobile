import 'dart:convert';

class QuestionnaireRead {
  int id;
  String scale;
  int score;
  QuestionnaireRead({
    required this.id,
    required this.scale,
    required this.score,
  });

  QuestionnaireRead copyWith({
    int? id,
    String? scale,
    int? score,
  }) {
    return QuestionnaireRead(
      id: id ?? this.id,
      scale: scale ?? this.scale,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'scale': scale,
      'score': score,
    };
  }

  factory QuestionnaireRead.fromMap(Map<String, dynamic> map) {
    return QuestionnaireRead(
      id: map['id'] as int,
      scale: map['scale'],
      score: map['score'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionnaireRead.fromJson(String source) =>
      QuestionnaireRead.fromMap(json.decode(source));

  @override
  String toString() =>
      'QuestionnaireRead(id: $id, scale: $scale, score: $score)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionnaireRead &&
        o.id == id &&
        o.scale == scale &&
        o.score == score;
  }

  @override
  int get hashCode => id.hashCode ^ scale.hashCode ^ score.hashCode;
}
