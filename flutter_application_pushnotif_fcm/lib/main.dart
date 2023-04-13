import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_pushnotif_fcm/myapp.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  // await Firebase.initializeApp();

  // print("Handling a background message: ${message.messageId}");
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  ///Initialize flutterLocalNotification before further usage
  await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(android: AndroidInitializationSettings('ic_launcher')));

  token = await FirebaseMessaging.instance.getToken();
  // print('Token: $token');

  runApp(const MyApp());
}