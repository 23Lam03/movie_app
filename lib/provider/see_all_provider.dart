import 'package:flutter/material.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movie_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllProvider extends ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<MovieModel> listData = [];
  int page = 1;
  TopMovie typeMovie = TopMovie.PLAYING;
  bool isLoading = true;
  void onRefresh() async {
    page = 1;
    getListTop(typeMovie);
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    page++;
    getListTop(typeMovie);
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

  Future<void> getListTop(TopMovie type) async {
    List<MovieModel> data = await MovieRepo.getListMovieTop(type, page: page);
    if (page == 1) {
      listData = data;
    } else {
      listData = [...listData, ...data];
    }

    typeMovie = type;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    refreshController.dispose();
  }
}
