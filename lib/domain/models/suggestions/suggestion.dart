// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';

class Suggestion {
  int id;
  String description;
  TypeSuggestion type;
  bool like;

  Suggestion({
    required this.id,
    required this.description,
    required this.type,
    required this.like,
  });

  Suggestion copyWith({
    int? id,
    String? description,
    TypeSuggestion? type,
    bool? like,
  }) {
    return Suggestion(
      id: id ?? this.id,
      description: description ?? this.description,
      type: type ?? this.type,
      like: like ?? this.like,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'type': type.toString(),
      'like': like,
    };
  }

  factory Suggestion.fromMap(Map<String, dynamic> map, TypeSuggestion type) {
    return Suggestion(
      id: map['id'] as int,
      description: map['description'] as String,
      type: type,
      like: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Suggestion.fromJson(String source, TypeSuggestion type) =>
      Suggestion.fromMap(json.decode(source) as Map<String, dynamic>, type);

  @override
  String toString() {
    return 'Suggestion(id: $id, description: $description, type: $type, like: $like)';
  }

  @override
  bool operator ==(covariant Suggestion other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.type == type &&
        other.like == like;
  }

  @override
  int get hashCode {
    return id.hashCode ^ description.hashCode ^ type.hashCode ^ like.hashCode;
  }
}
