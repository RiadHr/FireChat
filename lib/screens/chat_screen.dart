import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id ='ChatSCreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:  Text('chatscreen')),
    );
  }
}
