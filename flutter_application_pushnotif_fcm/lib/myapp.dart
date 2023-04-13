import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

///Create a new AndroidNotificationChannel instance
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
);

///Create the channel on the device (if a channel with an id already exists, it will be updated):
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> createNotificationChannel() async{
  await flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
}

String? token;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState(){

    print('Token: $token');
    createNotificationChannel();


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if(message.notification != null){
        print('Message also contained a notification: ${message.notification}');
      }

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;


      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription : channel.description,
                // icon: android.smallIcon,
                priority: Priority.max,
                // other properties...
              ),
            ));
      }

      messageData.value = message.data.toString();
      messageNotification.value = message.notification?.toMap().toString();
    });
    

    super.initState();
  }

  ValueNotifier<String?> messageData = ValueNotifier(null);
  ValueNotifier<String?> messageNotification = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Token: $token'),
            ValueListenableBuilder(
              valueListenable: messageData,
              builder: (context, value, child) {
                return Text('Message data : ${messageData.value.toString()}');
              }
            ),
            ValueListenableBuilder(
              valueListenable: messageNotification,
              builder: (context, value, child) {
                return Text('Message also contained a notification: ${messageNotification.value.toString()}');
              }
            ),
          ],
        ),
      ),
    );
  }
}
