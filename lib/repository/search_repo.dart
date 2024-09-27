import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model.dart';

class SearchRepo {
  static Future<List<MovieModel>> callSearch(String keyword) async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    final url =
        'https://api.themoviedb.org/3/search/tv?query=$keyword&api_key=$token';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    Map body = jsonDecode(response.body);
    List results = body['results'];
    List<MovieModel> data = results.map((e) => MovieModel.fromMap(e)).toList();
    return data;
  }
}
