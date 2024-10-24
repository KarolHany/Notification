import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
    required this.message,
  });

  final message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
          radius: 20, backgroundColor: Colors.blue, child: Icon(Icons.person)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Person Name '),
              Text(
                message.notification!.body.toString(),
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const Text(
            '52 M',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
