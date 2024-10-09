// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAG7j0fVKV9-s5CIhnH_Y7wKMDHlAVe-uI',
    appId: '1:831793052695:web:0a24fe777d50bd4ecc3052',
    messagingSenderId: '831793052695',
    projectId: 'movieapp-f7586',
    authDomain: 'movieapp-f7586.firebaseapp.com',
    storageBucket: 'movieapp-f7586.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwnyqqcVjnwcIPiHiOu7RsNLRzxYSVeDY',
    appId: '1:831793052695:android:ece91b6a21806f14cc3052',
    messagingSenderId: '831793052695',
    projectId: 'movieapp-f7586',
    storageBucket: 'movieapp-f7586.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfM8miqnXXrjSmyZ-Mprwe0SaZL3s8BuQ',
    appId: '1:831793052695:ios:f1e01452ba19f8e0cc3052',
    messagingSenderId: '831793052695',
    projectId: 'movieapp-f7586',
    storageBucket: 'movieapp-f7586.appspot.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfM8miqnXXrjSmyZ-Mprwe0SaZL3s8BuQ',
    appId: '1:831793052695:ios:f1e01452ba19f8e0cc3052',
    messagingSenderId: '831793052695',
    projectId: 'movieapp-f7586',
    storageBucket: 'movieapp-f7586.appspot.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAG7j0fVKV9-s5CIhnH_Y7wKMDHlAVe-uI',
    appId: '1:831793052695:web:fba6c579af6eb3d3cc3052',
    messagingSenderId: '831793052695',
    projectId: 'movieapp-f7586',
    authDomain: 'movieapp-f7586.firebaseapp.com',
    storageBucket: 'movieapp-f7586.appspot.com',
  );

}