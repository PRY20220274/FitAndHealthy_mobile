import 'dart:convert';

class AlternativeRead {
  int id;
  String description;
  int score;
  AlternativeRead({
    required this.id,
    required this.description,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'score': score,
    };
  }

  factory AlternativeRead.fromMap(Map<String, dynamic> map) {
    return AlternativeRead(
      id: map['id'],
      description: map['description'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlternativeRead.fromJson(String source) =>
      AlternativeRead.fromMap(json.decode(source));

  @override
  String toString() =>
      'AlternativeRead(id: $id, description: $description, score: $score)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AlternativeRead &&
        o.id == id &&
        o.description == description &&
        o.score == score;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ score.hashCode;

  AlternativeRead copyWith({
    int? id,
    String? description,
    int? score,
  }) {
    return AlternativeRead(
      id: id ?? this.id,
      description: description ?? this.description,
      score: score ?? this.score,
    );
  }
}
