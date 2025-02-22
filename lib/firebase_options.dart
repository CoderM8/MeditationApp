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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjFN1WPt_4cE9n6mlq0PWkg16geSmtM5c',
    appId: '1:696617949622:android:ac24b82e12b715ea088917',
    messagingSenderId: '696617949622',
    projectId: 'relaxmeditation-7e049',
    storageBucket: 'relaxmeditation-7e049.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlPRhDHX21LPE-wwSPNGqsNswiwcrj62w',
    appId: '1:696617949622:ios:b072d1371594dfd3088917',
    messagingSenderId: '696617949622',
    projectId: 'relaxmeditation-7e049',
    storageBucket: 'relaxmeditation-7e049.appspot.com',
    androidClientId:
        '696617949622-a560euoalgh1f8ckqseas7o27h1the29.apps.googleusercontent.com',
    iosClientId:
        '696617949622-tt2g5esouf7utdepq3r6c5qq3dbn01t8.apps.googleusercontent.com',
    iosBundleId: 'com.vocsy.meditation',
  );
}
