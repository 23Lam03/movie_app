import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Genres {
  int id;
  String name;
  Genres({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genres.fromMap(Map<String, dynamic> map) {
    return Genres(
      id: map['id'] as int,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Genres.fromJson(String source) =>
      Genres.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductionCompanies {
  int id;
  String logo_path;
  String name;
  String origin_country;
  ProductionCompanies({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo_path': logo_path,
      'name': name,
      'origin_country': origin_country,
    };
  }

  factory ProductionCompanies.fromMap(Map<String, dynamic> map) {
    return ProductionCompanies(
      id: map['id'] as int,
      logo_path: map['logo_path'] ?? '',
      name: map['name'] ?? '',
      origin_country: map['origin_country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompanies.fromJson(String source) =>
      ProductionCompanies.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SpokenLanguages {
  String english_name;
  String iso_639_1;
  String name;
  SpokenLanguages({
    required this.english_name,
    required this.iso_639_1,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'english_name': english_name,
      'iso_639_1': iso_639_1,
      'name': name,
    };
  }

  factory SpokenLanguages.fromMap(Map<String, dynamic> map) {
    return SpokenLanguages(
      english_name: map['english_name'] ?? '',
      iso_639_1: map['iso_639_1'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguages.fromJson(String source) =>
      SpokenLanguages.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MovieDetailModel {
  String backdrop_path;
  List<Genres> genres;
  String homepage;
  int id;
  List origin_country;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String poster_path;
  List<ProductionCompanies> production_companies;
  int revenue;
  int runtime;
  List<SpokenLanguages> spoken_languages;
  String status;

  String tagline;
  String title;
  bool video;
  double vote_average;
  int vote_count;
  String release_date;

  MovieDetailModel({
    required this.backdrop_path,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.origin_country,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.revenue,
    required this.runtime,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
    required this.release_date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdrop_path,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'origin_country': origin_country,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'production_companies':
          production_companies.map((x) => x.toMap()).toList(),
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spoken_languages.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
      'release_date': release_date,
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      backdrop_path: map['backdrop_path'] ?? '',
      genres: List<Genres>.from(
        (map['genres']).map<Genres>(
          (x) => Genres.fromMap(x as Map<String, dynamic>),
        ),
      ),
      homepage: map['homepage'] ?? '',
      id: map['id'] as int,
      origin_country: map['origin_country'] ?? [],
      original_language: map['original_language'] ?? '',
      original_title: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity'] as double,
      poster_path: map['poster_path'] ?? '',
      production_companies: List<ProductionCompanies>.from(
        (map['production_companies']).map<ProductionCompanies>(
          (x) => ProductionCompanies.fromMap(x as Map<String, dynamic>),
        ),
      ),
      revenue: map['revenue'] as int,
      runtime: map['runtime'] as int,
      spoken_languages: List<SpokenLanguages>.from(
        (map['spoken_languages']).map<SpokenLanguages>(
          (x) => SpokenLanguages.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] as bool,
      vote_average: map['vote_average'] as double,
      vote_count: map['vote_count'] as int,
      release_date: map['release_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
