import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieGenre {
  int id;
  String name;
  MovieGenre({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory MovieGenre.fromMap(Map<String, dynamic> map) {
    return MovieGenre(
      id: map['id'] as int,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieGenre.fromJson(String source) =>
      MovieGenre.fromMap(json.decode(source) as Map<String, dynamic>);
}
