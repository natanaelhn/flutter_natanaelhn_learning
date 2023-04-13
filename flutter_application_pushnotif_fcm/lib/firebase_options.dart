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
    apiKey: 'AIzaSyBYh1NNDZKhOVrihuYgQbirJLmLuphvXrw',
    appId: '1:890800002014:web:71740badddfff0b3b5034f',
    messagingSenderId: '890800002014',
    projectId: 'flutter-app-pushnotif-crm',
    authDomain: 'flutter-app-pushnotif-crm.firebaseapp.com',
    storageBucket: 'flutter-app-pushnotif-crm.appspot.com',
    measurementId: 'G-29906GVDB6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-phuzakfhYTV3kULr3WZ7cI0pxIsr9Sg',
    appId: '1:890800002014:android:cb7450669b48efd3b5034f',
    messagingSenderId: '890800002014',
    projectId: 'flutter-app-pushnotif-crm',
    storageBucket: 'flutter-app-pushnotif-crm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOr7yDVfLxosbsLblPeWHuGUGGcJFQW9E',
    appId: '1:890800002014:ios:8fef9e8f7c10cbc8b5034f',
    messagingSenderId: '890800002014',
    projectId: 'flutter-app-pushnotif-crm',
    storageBucket: 'flutter-app-pushnotif-crm.appspot.com',
    iosClientId: '890800002014-4ci4o3ccmc5l35k3q12a4hr6e1cfplvo.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationPushnotifFcm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOr7yDVfLxosbsLblPeWHuGUGGcJFQW9E',
    appId: '1:890800002014:ios:8fef9e8f7c10cbc8b5034f',
    messagingSenderId: '890800002014',
    projectId: 'flutter-app-pushnotif-crm',
    storageBucket: 'flutter-app-pushnotif-crm.appspot.com',
    iosClientId: '890800002014-4ci4o3ccmc5l35k3q12a4hr6e1cfplvo.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationPushnotifFcm',
  );
}