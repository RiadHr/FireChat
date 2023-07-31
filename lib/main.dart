import 'package:fire_chat_demo/firebase_options.dart';
import 'package:fire_chat_demo/screens/chat_screen.dart';
import 'package:fire_chat_demo/screens/login_screen.dart';
import 'package:fire_chat_demo/screens/registration_screen.dart';
import 'package:fire_chat_demo/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute:WelcomeScreen.id ,
      routes: {
        LoginScreen.id:(context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id : (context) => WelcomeScreen(),
        ChatScreen.id : (context) => ChatScreen()
      },
    );
  }
}


