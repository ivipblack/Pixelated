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
    apiKey: 'AIzaSyDScW4RndiEQgP5LnuPnH16RrIaewWmZBE',
    appId: '1:905867896345:web:bf3235a007210ea732ac88',
    messagingSenderId: '905867896345',
    projectId: 'pixelated-436a3',
    authDomain: 'pixelated-436a3.firebaseapp.com',
    storageBucket: 'pixelated-436a3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKEoA3DdUcmLkRug-bKVivSZQH_J5dcyM',
    appId: '1:905867896345:android:9bf3c33e33e23c8432ac88',
    messagingSenderId: '905867896345',
    projectId: 'pixelated-436a3',
    storageBucket: 'pixelated-436a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDJuuYw72BWFM66JCL2a5azR5n24Bivew',
    appId: '1:905867896345:ios:e4efebdf78ea482432ac88',
    messagingSenderId: '905867896345',
    projectId: 'pixelated-436a3',
    storageBucket: 'pixelated-436a3.appspot.com',
    iosClientId: '905867896345-45j74li8m85e30o0tpg931u21ca7h3ir.apps.googleusercontent.com',
    iosBundleId: 'com.example.pixelated',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDJuuYw72BWFM66JCL2a5azR5n24Bivew',
    appId: '1:905867896345:ios:e4efebdf78ea482432ac88',
    messagingSenderId: '905867896345',
    projectId: 'pixelated-436a3',
    storageBucket: 'pixelated-436a3.appspot.com',
    iosClientId: '905867896345-45j74li8m85e30o0tpg931u21ca7h3ir.apps.googleusercontent.com',
    iosBundleId: 'com.example.pixelated',
  );
}
