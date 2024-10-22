import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_genre.dart';
import 'package:movie_app/repository/movie_repo.dart'; // hypothetical repo for fetching genres

class GenreProvider extends ChangeNotifier {
  List<MovieGenre> listGenre = [];
  bool _isLoading = false;

  GenreProvider();

  bool get isLoading => _isLoading;

  Future<void> fetchGenres() async {
    _isLoading = true;

    List<MovieGenre> genres = await MovieRepo.getMovieGenres();
    listGenre = genres;
    notifyListeners();
  }
}
