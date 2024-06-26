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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCWWnQ96e_FmDMStFEEpS91N4OL9sKGzxg',
    appId: '1:709631960207:web:2267db5799aca4165f3cfa',
    messagingSenderId: '709631960207',
    projectId: 'sparking-firebase',
    authDomain: 'sparking-firebase.firebaseapp.com',
    storageBucket: 'sparking-firebase.appspot.com',
    measurementId: 'G-WSQ6SW0FY9',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDio5doh2nVoL-3eBMRaqRf-qtzqnsDP9k',
    appId: '1:709631960207:ios:b83f873d58fb073a5f3cfa',
    messagingSenderId: '709631960207',
    projectId: 'sparking-firebase',
    storageBucket: 'sparking-firebase.appspot.com',
    iosBundleId: 'com.example.smartCarParking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDio5doh2nVoL-3eBMRaqRf-qtzqnsDP9k',
    appId: '1:709631960207:ios:b83f873d58fb073a5f3cfa',
    messagingSenderId: '709631960207',
    projectId: 'sparking-firebase',
    storageBucket: 'sparking-firebase.appspot.com',
    iosBundleId: 'com.example.smartCarParking',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCWWnQ96e_FmDMStFEEpS91N4OL9sKGzxg',
    appId: '1:709631960207:web:572ca7857f606c205f3cfa',
    messagingSenderId: '709631960207',
    projectId: 'sparking-firebase',
    authDomain: 'sparking-firebase.firebaseapp.com',
    storageBucket: 'sparking-firebase.appspot.com',
    measurementId: 'G-ZJ5F2R095F',
  );
}
