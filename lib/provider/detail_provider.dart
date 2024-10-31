import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/repository/movie_repo.dart';

class DetailProvider extends ChangeNotifier {
  MovieDetailModel? movieDetail;
  bool isLoading = true;

  void removeMovieDetail() {
    isLoading = false;
  }

// lay id de ddo detail
  Future<void> getDetail(int id) async {
    movieDetail = await MovieRepo.getMovieDetail(id);
    isLoading = false;
    notifyListeners();
  }

  Future<List<VideoModel>> getMovieTrailer(int id) async {
    List<VideoModel> data = await MovieRepo.getMovieTrailers(id);
    return data;
  }
}
