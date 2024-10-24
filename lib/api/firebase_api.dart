import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/main.dart';
import 'package:hive/hive.dart';

class FirebaseApi {
  // create an instense of firebase messaging
  final _messaging = FirebaseMessaging.instance;

  // create function to initialize notification messaging
  Future<void> init() async {
    // request permision from user
    await _messaging.requestPermission();
    // get token for push notification
    final fcmMessages = await _messaging.getToken();
    //print that token (normally you send it to server)
    print('FCM token: $fcmMessages');
    // initialize background settings
    await initBackground();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    globalKey.currentState?.pushNamed('/notifications', arguments: message);
  }

  //function to initialize background settings
  Future initBackground() async {
    // initialize messages if the app terminated and now open
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  // Method to send notification and store it in Hive
Future<void> sendNotificationAndStore(
    String title, String body, String token) async {
  const String functionUrl = "https://your-cloud-function-url/sendNotification";
  
  try {
    // Send FCM Notification
    final response = await http.post(
      Uri.parse(functionUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "token": token,
        "title": title,
        "body": body,
      }),
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully!");

      // Store notification details in Hive
      var box = Hive.box('notificationsBox');
      box.add({
        'title': title,
        'body': body,
        'timestamp': DateTime.now().toString(),
      });
      print("Notification stored in Hive");
    } else {
      print("Failed to send notification: ${response.body}");
    }
  } catch (e) {
    print("Error sending notification: $e");
  }
}
}
