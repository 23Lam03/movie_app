import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/video_model.dart';

class MovieRepo {
  static Future<List<MovieModel>> getListMovieNowPlaying() async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    const url =
        'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1';
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

  static Future<List<MovieModel>> getListMovieReleases() async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    const url =
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
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

  static Future<List<MovieModel>> getListMovieTopRated() async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    const url =
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1';
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

  static Future<List<MovieModel>> getListMovieUpcoming() async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1';
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

  static Future<MovieDetailModel?> getMovieDetail(int id) async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    final url = 'https://api.themoviedb.org/3/movie/$id?language=en-US';

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      MovieDetailModel data = MovieDetailModel.fromMap(body);
      return data;
    }
    return null;
  }

  static Future<List<VideoModel>> getMovieTrailers(int id) async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTdiYzE4N2E0NmU1YWNmZWFhMjBlMDJkMmRiZDEwMSIsIm5iZiI6MTcyNjYzMTMwMS45NjA5NTIsInN1YiI6IjY2ZTdiNzJhMzc2OGE3M2Y4ZDkxYWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bN9xeOHXXDSXDR_SZD4UpDkHwxFyaU_zytd8p4pwAzc';
    final url = 'https://api.themoviedb.org/3/movie/$id/videos?language=en-US';

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    Map body = jsonDecode(response.body);
    List results = body['results'];
    List<VideoModel> data = results.map((e) => VideoModel.fromMap(e)).toList();
    return data;
  }
}
