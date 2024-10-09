import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRegistetProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Đăng ký người dùng và lưu thông tin bổ sung vào Firestore
  Future<bool> register(String email, String password, String name,
      String userName, String phoneNumber) async {
    try {
      // Tạo người dùng bằng Xác thực Firebase
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Lưu thông tin người dùng vào Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'name': name,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'createdAt': Timestamp.now(),
      });

      return true; // Đăng ký thành công
    } on FirebaseAuthException catch (e) {
      //Xử lý lỗi đăng ký
      if (e.code == 'email-already-in-use') {
        // Xử lý lỗi email đã sử dụng
      } else if (e.code == 'weak-password') {
        //Xử lý lỗi mật khẩu yếu
      }
      return false; // Đăng ký không thành công
    } catch (e) {
      return false; // Lỗi
    }
  }
}
