// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Activity {
  int id;
  String name;

  Activity({
    required this.id,
    required this.name,
  });

  Activity copyWith({
    int? id,
    String? name,
  }) {
    return Activity(
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

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Activity(id: $id, name: $name)';

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
