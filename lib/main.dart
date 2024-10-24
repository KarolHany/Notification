import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notification/api/firebase_api.dart';
import 'package:firebase_notification/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'pages/home_page.dart';
import 'pages/notification_page.dart';

final globalKey = GlobalKey<NavigatorState>();

void main() async {
  await Hive.initFlutter();  // Initialize Hive
  await Hive.openBox('notificationsBox');  // Open a box to store notifications
  // Ensure Flutter is initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with your Firebase project configuration.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Firebase Notification.
  await FirebaseApi().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      navigatorKey: globalKey,
      routes: {
        '/notifications': (context) => NotificationPage(),
      },
      
    );
  }
}
