import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movie_repo.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> listMovieNowPlaying = [];
  List<MovieModel> listMovieReleases = [];
  List<MovieModel> listMovieTopRated = [];
  List<MovieModel> listMovieUpcoming = [];

  Future<void> initHome() async {
    await getListMovieNowPlaying();
  }

  Future<void> getListMovieNowPlaying() async {
    List<MovieModel> data = await MovieRepo.getListMovieNowPlaying();
    listMovieNowPlaying = data;
    notifyListeners();
  }

  Future<void> getListMovieReleases() async {
    List<MovieModel> dataRelease = await MovieRepo.getListMovieReleases();
    listMovieReleases = dataRelease;
    notifyListeners();
  }

  Future<void> getListMovieTopRated() async {
    List<MovieModel> dataTopRated = await MovieRepo.getListMovieTopRated();
    listMovieTopRated = dataTopRated;
    notifyListeners();
  }

  Future<void> getListMovieUpcoming() async {
    List<MovieModel> dataUpcoming = await MovieRepo.getListMovieUpcoming();
    listMovieUpcoming = dataUpcoming;
    notifyListeners();
  }
}
