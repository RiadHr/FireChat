import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fire_chat_demo/component/auth_button.dart';
import 'package:fire_chat_demo/screens/login_screen.dart';
import 'package:fire_chat_demo/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void NavigateToLogin(){
    Navigator.pushNamed(context, LoginScreen.id);
  }

  void NavigateToRegister(){
    Navigator.pushNamed(context, RegistrationScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    width: 100, image: AssetImage('images/firechat.png')),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Firechat',
                      speed: const Duration(seconds: 2),

                      textStyle: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            AuthButton(text: 'Login', buttonHandler:NavigateToLogin),
            const SizedBox(height: 10,),
            AuthButton(text: 'Register', buttonHandler:NavigateToRegister),
          ],
        ),
      ),
    );
  }
}
