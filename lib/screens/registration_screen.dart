import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat_demo/component/auth_button.dart';
import 'package:fire_chat_demo/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _showSpinner = false;

  void RegistrationHandler(){
    _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? loggedUser = _auth.currentUser;
    if(loggedUser != null){
      print(loggedUser.email);
      Navigator.pushNamed(context, ChatScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Image(width: 100, image: AssetImage('images/firechat.png')),
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
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  onChanged: (value){
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'email',
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              AuthButton(text: 'Register', buttonHandler:(){RegistrationHandler();})
            ],
          ),
        ),
      ),
    );
  }
}
