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
    apiKey: 'AIzaSyArUa56bo8vntuyupVO1XjjrAFC7YYFJUs',
    appId: '1:775326377887:web:966565ba153d912690bfaa',
    messagingSenderId: '775326377887',
    projectId: 'bikerecord-data',
    authDomain: 'bikerecord-data.firebaseapp.com',
    databaseURL: 'https://bikerecord-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'bikerecord-data.appspot.com',
    measurementId: 'G-J6TYC6LCY5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWHcADGH7HUP3ueuBEtSqZ21STZ3pa9Wk',
    appId: '1:775326377887:android:293f64806738cc4790bfaa',
    messagingSenderId: '775326377887',
    projectId: 'bikerecord-data',
    databaseURL: 'https://bikerecord-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'bikerecord-data.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsCJW_46qlCvxN1qoG6nSuChHz4nVOJH0',
    appId: '1:775326377887:ios:287a67508afd6f9b90bfaa',
    messagingSenderId: '775326377887',
    projectId: 'bikerecord-data',
    databaseURL: 'https://bikerecord-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'bikerecord-data.appspot.com',
    iosBundleId: 'com.example.bikeRecord',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsCJW_46qlCvxN1qoG6nSuChHz4nVOJH0',
    appId: '1:775326377887:ios:fd41aa6b7cf3c37190bfaa',
    messagingSenderId: '775326377887',
    projectId: 'bikerecord-data',
    databaseURL: 'https://bikerecord-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'bikerecord-data.appspot.com',
    iosBundleId: 'com.example.bikeRecord.RunnerTests',
  );
}
