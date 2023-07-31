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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          color: const Color.fromRGBO(204, 68, 63, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 60,
                child: const Placeholder(),),
                const Icon(Icons.logout,color: Colors.white,
                size: 28,)
              ],
            ),
          ),
        ),
      ),
      body: Center(child:  Text('chatscreen')),
    );
  }
}
