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
    apiKey: 'AIzaSyAlpDlMLsFyfZoTwXyJAmyROhbgQrx3Z7I',
    appId: '1:1018624565037:web:7a9c0c9291803e01cabda4',
    messagingSenderId: '1018624565037',
    projectId: 'semi-final-lab-flutter',
    authDomain: 'semi-final-lab-flutter.firebaseapp.com',
    storageBucket: 'semi-final-lab-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlutFMJkaedHEMiNyY2No1UYPrflSV1Ic',
    appId: '1:1018624565037:android:c12dab7bef5ff8e5cabda4',
    messagingSenderId: '1018624565037',
    projectId: 'semi-final-lab-flutter',
    storageBucket: 'semi-final-lab-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAJ4apODRCWGG-llAPMvAeD4IMy8U_PgU',
    appId: '1:1018624565037:ios:326e8fa154c72118cabda4',
    messagingSenderId: '1018624565037',
    projectId: 'semi-final-lab-flutter',
    storageBucket: 'semi-final-lab-flutter.appspot.com',
    iosClientId: '1018624565037-sb3ui2mej8ksg8787tdh1gtekkt8jvkv.apps.googleusercontent.com',
    iosBundleId: 'com.example.citycafeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAJ4apODRCWGG-llAPMvAeD4IMy8U_PgU',
    appId: '1:1018624565037:ios:326e8fa154c72118cabda4',
    messagingSenderId: '1018624565037',
    projectId: 'semi-final-lab-flutter',
    storageBucket: 'semi-final-lab-flutter.appspot.com',
    iosClientId: '1018624565037-sb3ui2mej8ksg8787tdh1gtekkt8jvkv.apps.googleusercontent.com',
    iosBundleId: 'com.example.citycafeApp',
  );
}
