import 'package:firebase_notification/api/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationButton extends StatelessWidget {
  final String token;  // FCM token

  NotificationButton({required this.token});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FirebaseApi().sendNotificationAndStore(
          "Hello User",
          "This is a test notification",
          token,
        );
      },
      child: const Text("Send Notification"),
    );
  }
}
