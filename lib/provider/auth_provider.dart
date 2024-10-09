// import 'package:flutter/material.dart';

// class AuthProvider extends ChangeNotifier {
//   Future<bool> login(String email, String password) async {
//     /// xu li
//     await Future.delayed(const Duration(seconds: 2));

//     //xong
//     // 1. kiem dung khong
//     // 2. sai => thong bao
//     // 3. dung => 1.tra ve true , 2.chuyen trang
//     return false;
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    try {
      //Đăng nhập xác thực Firebase
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true; // Successful login
    } on FirebaseAuthException catch (e) {
      // Xử lý lỗi đăng nhập
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      return false; // Login failed
    } catch (e) {
      return false;
    }
  }
}
