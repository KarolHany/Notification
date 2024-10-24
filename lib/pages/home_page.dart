import 'package:firebase_notification/pages/notification_page.dart';
import 'package:firebase_notification/widgets/button_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: NotificationButton(token: "c5gQKfcSQAml2QjLWn6cgU:APA91bEpaaEJ-OBq9bPZr0YBpiQHQOGEz89PhIH0K4lj1m284VYkNrSQNQN9Acot-7SyBSOikxOAOjPNBXTJ1oPMNVnsVtuCcdQDA2CWdO4Q1ywEe-KoXPE"),
      ),
    );
  }
}
