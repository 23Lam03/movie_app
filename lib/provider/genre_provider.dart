import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_genre.dart';

class GenreProvider extends ChangeNotifier {
  List<MovieGenre> listGenre = [];
  GenreProvider();
}
