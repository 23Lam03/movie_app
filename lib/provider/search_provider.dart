import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_search_model.dart';
import 'package:movie_app/repository/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  Timer? debounce;
  List<MovieSearchModel> searchResults = [];
  bool isLoading = true;
  StreamController streamController = StreamController();

  Future<void> getSearch(String keyword) async {
    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(const Duration(milliseconds: 500), () async {
      List<MovieSearchModel> data = await SearchRepo.callSearch(keyword);
      searchResults.clear();
      searchResults.addAll(data);
      streamController.add(data);
    });
  }

  // onrefest ()
  // loadmore
  //  Future<void> loadmore(String keyword) async {
  //   page ++;
  //     List<MovieSearchModel> data = await SearchRepo.callSearch(keyword , page);
  //     searchResults.addAll(data);
  //     streamController.add(searchResults);
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debounce!.cancel();
    streamController.close();

    print('dispose');
  }
}
