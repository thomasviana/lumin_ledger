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
    apiKey: 'AIzaSyACmnSZUFSyf7yUk034ExpZl55_vgAKP7I',
    appId: '1:455165020316:web:5a1b314234267897730559',
    messagingSenderId: '455165020316',
    projectId: 'lumin-ledger',
    authDomain: 'lumin-ledger.firebaseapp.com',
    storageBucket: 'lumin-ledger.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4sZRsICJA_tPKPafSTttOCugR2oqICqA',
    appId: '1:455165020316:android:5a00b2707b16768c730559',
    messagingSenderId: '455165020316',
    projectId: 'lumin-ledger',
    storageBucket: 'lumin-ledger.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMxt1JNfDEkI0YYmFycSZp4-_fXJO-dLQ',
    appId: '1:455165020316:ios:40e83f51fca187d3730559',
    messagingSenderId: '455165020316',
    projectId: 'lumin-ledger',
    storageBucket: 'lumin-ledger.appspot.com',
    iosBundleId: 'com.thomasviana.luminLedger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMxt1JNfDEkI0YYmFycSZp4-_fXJO-dLQ',
    appId: '1:455165020316:ios:167f4a4bb7d5bc0d730559',
    messagingSenderId: '455165020316',
    projectId: 'lumin-ledger',
    storageBucket: 'lumin-ledger.appspot.com',
    iosBundleId: 'com.thomasviana.luminLedger.RunnerTests',
  );
}