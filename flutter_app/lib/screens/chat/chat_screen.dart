import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Chat')),
    body: Column(children: [
      Expanded(child: ListView(children: const [
        Align(alignment: Alignment.centerLeft, child: Card(child: Padding(padding: EdgeInsets.all(8), child: Text('Is this available?')))),
        Align(alignment: Alignment.centerRight, child: Card(color: Color(0xffd6f5d6), child: Padding(padding: EdgeInsets.all(8), child: Text('Yes, available')))),
      ])),
      const Padding(padding: EdgeInsets.all(8), child: Row(children: [Expanded(child: TextField(decoration: InputDecoration(hintText: 'Message'))), Icon(Icons.send)]))
    ]),
  );
}
