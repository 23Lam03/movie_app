import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  Future<List<MovieModel>> getSearch(String keyword) async {
    List<MovieModel> search = await SearchRepo.callSearch(keyword);
    print(search);
    return search;
  }
}
