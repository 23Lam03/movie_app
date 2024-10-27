import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyListProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteMovies = [];

  List<Map<String, dynamic>> get favoriteMovies => _favoriteMovies;

  Future<void> addToFavourites(
      String userId, int movieId, String posterPath) async {
    DocumentReference favouriteRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favourites')
        .doc(movieId.toString());

    try {
      await favouriteRef.set({
        'time': DateTime.now(),
        'posterPath': posterPath,
      });
      print("Movie Added to Favourites");
      notifyListeners();
    } catch (error) {
      print("Failed to add movie: $error");
    }
  }

  Future<void> fetchFavoriteMovies(String userId) async {
    List<Map<String, dynamic>> favoriteMoviesList = [];

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .get();

      for (var doc in snapshot.docs) {
        favoriteMoviesList.add({
          'idMovie': doc.id,
          'posterPath': doc['posterPath'],
        });
      }

      _favoriteMovies.clear();
      _favoriteMovies.addAll(favoriteMoviesList);
      notifyListeners();
    } catch (error) {
      print("Failed to fetch favorite movies: $error");
    }
  }
}
