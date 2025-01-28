import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
      ),
      body: Center(
        child: Text('Logged in!'),
      ),
    );
  }
}
