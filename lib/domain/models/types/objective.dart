// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Objective {
  int id;
  String name;

  Objective({
    required this.id,
    required this.name,
  });
  

  Objective copyWith({
    int? id,
    String? name,
  }) {
    return Objective(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Objective.fromMap(Map<String, dynamic> map) {
    return Objective(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Objective.fromJson(String source) => Objective.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Objective(id: $id, name: $name)';

  @override
  bool operator ==(covariant Objective other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
