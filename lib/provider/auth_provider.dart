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

      if (userCredential.user != null && userCredential.user!.uid.isNotEmpty) {
        await SharePre.setString(Accout.keyUserId, userCredential.user!.uid);
        return true; // Successful login
      }
      return false;
    } on FirebaseAuthException catch (e) {
      // Handle specific errors
      if (e.code == 'user-not-found') {
        print("No user found with this email.");
      } else if (e.code == 'wrong-password') {
        print("Incorrect password.");
      }
      return false;
    } catch (e) {
      print("Error during login: $e");
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
      if (userCredential.user != null && userCredential.user!.uid.isNotEmpty) {
        await SharePre.setString(Accout.keyUserId, userCredential.user!.uid);
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException during Google Sign-In: ${e.message}");
      return false;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return false;
    }
  }

  // Logout function to sign out from both Firebase and Google
  Future<void> logout() async {
    await _auth.signOut(); // Firebase sign-out
    await _googleSignIn.signOut(); // Google sign-out
    await SharePre.remove(Accout.keyUserId); // Clear saved user ID
    notifyListeners(); // Notify listeners if the user state is being used in the app
  }
}
