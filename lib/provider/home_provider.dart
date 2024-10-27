import 'package:flutter/material.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movie_repo.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> listMovieNowPlaying = [];
  List<MovieModel> listMovieReleases = [];
  List<MovieModel> listMovieTopRated = [];
  List<MovieModel> listMovieUpcoming = [];
  int notificationCount = 0;

  bool isLoading = true;
  Future<void> initHome() async {
    await getListMovieNowPlaying();
  }

  Future<List<MovieModel>> getListTop(TopMovie type) async {
    List<MovieModel> data = await MovieRepo.getListMovieTop(type);
    return data;
  }

  Future<void> getListMovieNowPlaying() async {
    List<MovieModel> data = await MovieRepo.getListMovieTop(TopMovie.PLAYING);
    listMovieNowPlaying = data;
    notifyListeners();
  }

  Future<void> getListMovieReleases() async {
    List<MovieModel> dataRelease =
        await MovieRepo.getListMovieTop(TopMovie.RELASES);
    listMovieReleases = dataRelease;
    notifyListeners();
  }

  Future<void> getListMovieTopRated() async {
    List<MovieModel> dataTopRated =
        await MovieRepo.getListMovieTop(TopMovie.RATED);
    listMovieTopRated = dataTopRated;
    notifyListeners();
  }

  Future<void> getListMovieUpcoming() async {
    List<MovieModel> dataUpcoming =
        await MovieRepo.getListMovieTop(TopMovie.UPCOMING);
    listMovieUpcoming = dataUpcoming;
    notifyListeners();
  }

  void updateNotificationCount() async {
    notificationCount++;
    notifyListeners();
  }
}
