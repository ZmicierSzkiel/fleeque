import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBnSrqBMzuZjXfDGHw4a_ar_33c8vn4EGk',
    appId: '1:440376019098:web:2d39b7d1bf07526828f723',
    messagingSenderId: '440376019098',
    projectId: 'fleeque-660f3',
    authDomain: 'fleeque-660f3.firebaseapp.com',
    storageBucket: 'fleeque-660f3.appspot.com',
    measurementId: 'G-24P5B7PZ6N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGMuQYQp5ViafdSL0CvHZPGy3_DmmwZQs',
    appId: '1:440376019098:android:6dced6cdcb837a1828f723',
    messagingSenderId: '440376019098',
    projectId: 'fleeque-660f3',
    storageBucket: 'fleeque-660f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfhHdWszei45neNX9cwhkq8luNSOVT1pE',
    appId: '1:440376019098:ios:4bf9cb229051d27728f723',
    messagingSenderId: '440376019098',
    projectId: 'fleeque-660f3',
    storageBucket: 'fleeque-660f3.appspot.com',
    iosBundleId: 'com.example.fleeque',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfhHdWszei45neNX9cwhkq8luNSOVT1pE',
    appId: '1:440376019098:ios:4bf9cb229051d27728f723',
    messagingSenderId: '440376019098',
    projectId: 'fleeque-660f3',
    storageBucket: 'fleeque-660f3.appspot.com',
    iosBundleId: 'com.example.fleeque',
  );
}
