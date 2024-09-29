import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  List<MovieModel> searchApi = [];

  Future<List<MovieModel>> getSearch(String keyword) async {
    List<MovieModel> search = await SearchRepo.callSearch(keyword);
    return search;
  }
}
