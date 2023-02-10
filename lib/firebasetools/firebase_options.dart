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
    apiKey: 'AIzaSyDpS16n5dUvPtnZrYgui-sRA-8cbOFVRlY',
    appId: '1:240018970740:web:6ae1ff51cd5e949d27d921',
    messagingSenderId: '240018970740',
    projectId: 'tasktoday-ca9e6',
    authDomain: 'tasktoday-ca9e6.firebaseapp.com',
    storageBucket: 'tasktoday-ca9e6.appspot.com',
    measurementId: 'G-HYB1Y2Y609',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAr9ujoH6iOZT356zDFK9shux5XyXD3ocQ',
    appId: '1:240018970740:android:276f0ebed6128cfa27d921',
    messagingSenderId: '240018970740',
    projectId: 'tasktoday-ca9e6',
    storageBucket: 'tasktoday-ca9e6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUNfo4MiqFDY1iNgQ2S1vIjKqSKaNJy4g',
    appId: '1:240018970740:ios:6f0960b4902e900927d921',
    messagingSenderId: '240018970740',
    projectId: 'tasktoday-ca9e6',
    storageBucket: 'tasktoday-ca9e6.appspot.com',
    iosClientId: '240018970740-fj2kfku6evc2us12o5io6ouqnb4cvn81.apps.googleusercontent.com',
    iosBundleId: 'com.example.tasktoday',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUNfo4MiqFDY1iNgQ2S1vIjKqSKaNJy4g',
    appId: '1:240018970740:ios:6f0960b4902e900927d921',
    messagingSenderId: '240018970740',
    projectId: 'tasktoday-ca9e6',
    storageBucket: 'tasktoday-ca9e6.appspot.com',
    iosClientId: '240018970740-fj2kfku6evc2us12o5io6ouqnb4cvn81.apps.googleusercontent.com',
    iosBundleId: 'com.example.tasktoday',
  );
}
