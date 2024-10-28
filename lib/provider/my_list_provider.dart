import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyListProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> favoriteMovies = [];
  final List<int> checkListFa = [];

  Future<void> addToFavourites(
      String userId, int movieId, String backdropPath) async {
    if (checkListFa.contains(movieId)) {
      checkListFa.remove(movieId);
      await FirebaseFirestore.instance
          .collection('favourites')
          .doc(userId)
          .collection('userfavourite')
          .doc(movieId.toString())
          .delete();
      notifyListeners();
      return;
    }
    print('ko id');
    Map<String, dynamic> data = {
      "movieId": movieId,
      "backdropPath": backdropPath,
      'time': DateTime.now(),
    };

    final favouriteRef = FirebaseFirestore.instance
        .collection('favourites')
        .doc(userId)
        .collection('userfavourite')
        .doc(movieId.toString())
        .set(data);

    checkListFa.add(movieId);
    print("Movie Added to Favourites");
    notifyListeners();
  }

  Future<void> fetchFavoriteMovies(String userId) async {
    List<Map<String, dynamic>> favoriteMoviesList = [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('favourites')
        .doc(userId)
        .collection('userfavourite')
        .get();

    checkListFa.clear();

    for (var doc in snapshot.docs) {
      favoriteMoviesList.add({
        'idMovie': doc['movieId'],
        'backdrop_path': doc['backdropPath'],
      });
      checkListFa.add(doc['movieId']);
    }

    favoriteMovies.clear();
    favoriteMovies.addAll(favoriteMoviesList);
    notifyListeners();
  }

  Future<void> checkFavourite(String userId, int movideId) async {
    // QuerySnapshot snapshot = await FirebaseFirestore.instance
    //     .collection('favourites')
    //     .doc(userId)
    //     .collection('userfavourite')
    //     .where('movieId', isEqualTo: movideId)
    //     .get();

    // var data = snapshot.docs.length;
    // return data == 0 ? false : true;
    fetchFavoriteMovies(userId);
  }
}
