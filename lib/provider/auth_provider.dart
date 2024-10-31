import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/app/const/accout.dart';
import 'package:movie_app/app/helper/share_pre.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Email/Password login
  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return await _handleAuthSuccess(userCredential);
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      return false;
    } catch (e) {
      print("Unexpected error during login: $e");
      return false;
    }
  }

  // Google Sign-In login
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false; // User canceled login

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return await _handleAuthSuccess(userCredential);
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      return false;
    } catch (e) {
      print("Unexpected error during Google Sign-In: $e");
      return false;
    }
  }

  // Logout function to sign out from both Firebase and Google
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await SharePre.remove(Accout.keyUserId);
    notifyListeners();
  }

  // Handle successful login and store the user ID
  Future<bool> _handleAuthSuccess(UserCredential userCredential) async {
    if (userCredential.user != null && userCredential.user!.uid.isNotEmpty) {
      await SharePre.setString(Accout.keyUserId, userCredential.user!.uid);
      notifyListeners();
      return true;
    }
    return false;
  }

  // Handle authentication errors
  void _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        break;
      case 'wrong-password':
        print("Incorrect password.");
        break;
      default:
    }
  }
}
