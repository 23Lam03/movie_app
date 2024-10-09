import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieSearchModel {
  String backdrop_path;
  String name;
  int id;
  MovieSearchModel({
    required this.backdrop_path,
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdrop_path,
      'name': name,
      'id': id,
    };
  }

  factory MovieSearchModel.fromMap(Map<String, dynamic> map) {
    return MovieSearchModel(
      backdrop_path: map['poster_path'] ?? '',
      name: map['name'] ?? '',
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieSearchModel.fromJson(String source) =>
      MovieSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
