import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/model_user.dart';

class SettingAppProvider extends ChangeNotifier {
  String uId = '';
  ModelUser? userInfo;

  void updateUid(String id) async {
    uId = id;
    Map<String, dynamic> data = await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((snapshot) => snapshot.data()!);
    userInfo = ModelUser.fromMap(data);
    notifyListeners();
  }

  void updateInfo(ModelUser user) async {
    userInfo = user;
    await FirebaseFirestore.instance.collection('users').doc(uId).set({
      'email': user.email,
      'name': user.name,
      'userName': user.fullName,
      'phoneNumber': user.phone,
      'image': user.image,
      'sex': user.sex,
      'createdAt': Timestamp.now(),
    });
    notifyListeners();
  }

  void updateAvata(String link) async {
    if (uId.isEmpty || userInfo == null) return;

    userInfo!.image = link;

    await FirebaseFirestore.instance.collection('users').doc(uId).update({
      'image': link,
    });
    notifyListeners();
  }

  void deleteUser() async {
    if (uId.isEmpty) return;
    {
      await FirebaseFirestore.instance.collection('users').doc(uId).delete();
      uId = '';
      userInfo = null;
      notifyListeners();
    }
  }
}
