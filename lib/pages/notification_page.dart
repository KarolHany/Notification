import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('notificationsBox');

    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
          var notification = box.getAt(index);
          return ListTile(
            title: Text(notification['title']),
            subtitle: Text(notification['body']),
            trailing: Text(notification['timestamp']),
          );
        },
      ),
    );
  }
}
