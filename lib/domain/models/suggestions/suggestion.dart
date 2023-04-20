// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Suggestion {
  int id;
  String description;

  Suggestion({
    required this.id,
    required this.description,
  });

  Suggestion copyWith({
    int? id,
    String? description,
  }) {
    return Suggestion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory Suggestion.fromMap(Map<String, dynamic> map) {
    return Suggestion(
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Suggestion.fromJson(String source) =>
      Suggestion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Suggestion(id: $id, description: $description)';

  @override
  bool operator ==(covariant Suggestion other) {
    if (identical(this, other)) return true;

    return other.id == id && other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
