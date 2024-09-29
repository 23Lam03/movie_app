import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieModel {
  int id;
  String title;
  String overview;
  double vote_average;
  String poster_path;
  String release_date;
  List<int> genre_ids;
  int vote_count;
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.vote_average,
    required this.poster_path,
    required this.release_date,
    required this.genre_ids,
    required this.vote_count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'vote_average': vote_average,
      'poster_path': poster_path,
      'release_date': release_date,
      'genre_ids': genre_ids,
      'vote_count': vote_count,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      vote_average: map['vote_average'] as double,
      poster_path: map['poster_path'] ?? '',
      release_date: map['release_date'] ?? '',
      genre_ids: List<int>.from(map['genre_ids']),
      vote_count: map['vote_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
