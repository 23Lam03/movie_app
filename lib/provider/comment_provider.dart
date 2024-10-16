import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentProvider extends ChangeNotifier {
  void comment(String usersId, String message, int idMovie) {
    DocumentReference comment = FirebaseFirestore.instance
        .collection('comment')
        .doc(idMovie.toString());

    comment
        .collection('userComment')
        .add({
          'time': DateTime.now(),
          'message': message,
          'userId': usersId,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
