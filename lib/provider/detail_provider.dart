import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/repository/movie_repo.dart';

class DetailProvider extends ChangeNotifier {
  MovieDetailModel? movieDetail;
  bool isLoading = true;
// lay id de ddo detail
  Future<void> getDetail(int id) async {
    movieDetail = await MovieRepo.getMovieDetail(id);
    notifyListeners();
  }

  Future<List<VideoModel>> getMovieTrailer(int id) async {
    List<VideoModel> data = await MovieRepo.getMovieTrailers(id);
    return data;
  }
}
