// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA_Ah-S0hex4JLDY8T1d0H4LzNCj32xOM8',
    appId: '1:805140147122:web:a34618a1482da9151b92ab',
    messagingSenderId: '805140147122',
    projectId: 'newtask-77f87',
    authDomain: 'newtask-77f87.firebaseapp.com',
    storageBucket: 'newtask-77f87.appspot.com',
    measurementId: 'G-0K34JLR840',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdhbWU7jg4d0IDrU4BBkhdxNlkl5wh0CQ',
    appId: '1:805140147122:android:bba7fb80531ba7e91b92ab',
    messagingSenderId: '805140147122',
    projectId: 'newtask-77f87',
    storageBucket: 'newtask-77f87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-B4jYo1JIXVyyTsJm9jlYwSPhKRZv4m4',
    appId: '1:805140147122:ios:a870013ca2ec5af71b92ab',
    messagingSenderId: '805140147122',
    projectId: 'newtask-77f87',
    storageBucket: 'newtask-77f87.appspot.com',
    iosBundleId: 'com.example.newtaskharshita',
  );
}