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
        return macos;
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
    apiKey: 'AIzaSyBcKDyfDyCi9AE7rNTN6co8J38Q1OWp2B0',
    appId: '1:683653647616:web:5fb2e753e076ee4a0df7e5',
    messagingSenderId: '683653647616',
    projectId: 'abler-familynum',
    authDomain: 'abler-familynum.firebaseapp.com',
    storageBucket: 'abler-familynum.appspot.com',
    measurementId: 'G-6PQ9PPN7L7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAFL9TR-02cSxiGi5z390W0XljOny-ZGY',
    appId: '1:683653647616:android:4b737a8431772b110df7e5',
    messagingSenderId: '683653647616',
    projectId: 'abler-familynum',
    storageBucket: 'abler-familynum.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA-zUwsKAGwWk4-nVsyRm0NWTEcGDFn5U',
    appId: '1:683653647616:ios:8f425678b172aa040df7e5',
    messagingSenderId: '683653647616',
    projectId: 'abler-familynum',
    storageBucket: 'abler-familynum.appspot.com',
    iosBundleId: 'com.example.ablerProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDA-zUwsKAGwWk4-nVsyRm0NWTEcGDFn5U',
    appId: '1:683653647616:ios:b52ced584a74cd5b0df7e5',
    messagingSenderId: '683653647616',
    projectId: 'abler-familynum',
    storageBucket: 'abler-familynum.appspot.com',
    iosBundleId: 'com.example.ablerProject.RunnerTests',
  );
}