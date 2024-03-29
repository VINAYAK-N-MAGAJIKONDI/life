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
    apiKey: 'AIzaSyABCb7q0gp9ZgSi9V9sEW1PVwwRr_SLPNQ',
    appId: '1:18534472639:web:e2340d9a4d6ac3c8605f0a',
    messagingSenderId: '18534472639',
    projectId: 'lifeunderwater-f982b',
    authDomain: 'lifeunderwater-f982b.firebaseapp.com',
    storageBucket: 'lifeunderwater-f982b.appspot.com',
    measurementId: 'G-4KJ52XZ24R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpZ4CcX6p00RVL0bu5LvS5Dmmhtfr4Y_Q',
    appId: '1:18534472639:android:fa58c49ba41b25c3605f0a',
    messagingSenderId: '18534472639',
    projectId: 'lifeunderwater-f982b',
    storageBucket: 'lifeunderwater-f982b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQ0nMf-xNY4zWDDeDNTd9z-LWgy0hCb7Y',
    appId: '1:18534472639:ios:b3505c24c2550d47605f0a',
    messagingSenderId: '18534472639',
    projectId: 'lifeunderwater-f982b',
    storageBucket: 'lifeunderwater-f982b.appspot.com',
    iosBundleId: 'com.example.life',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQ0nMf-xNY4zWDDeDNTd9z-LWgy0hCb7Y',
    appId: '1:18534472639:ios:b3505c24c2550d47605f0a',
    messagingSenderId: '18534472639',
    projectId: 'lifeunderwater-f982b',
    storageBucket: 'lifeunderwater-f982b.appspot.com',
    iosBundleId: 'com.example.life',
  );
}
