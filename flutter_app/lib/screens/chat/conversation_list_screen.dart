import 'package:flutter/material.dart';

class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Chats')),
    body: ListView(children: const [
      ListTile(title: Text('Rahul'), subtitle: Text('Is this still available?'), trailing: Text('10:21')),
      ListTile(title: Text('Priya'), subtitle: Text('Can you share more photos?'), trailing: Text('09:14')),
    ]),
  );
}
