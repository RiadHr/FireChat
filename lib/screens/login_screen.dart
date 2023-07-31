import 'package:fire_chat_demo/component/auth_button.dart';
import 'package:fire_chat_demo/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User? currrentUser;
  late String email;
  late String password;
  bool _spinner = false;

  void LoginHandler()async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    currrentUser = _auth.currentUser;
    if(currrentUser != null){
      print(currrentUser?.email);
      Navigator.pushNamed(context, ChatScreen.id);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:_spinner ,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Hero(
                      tag: 'logo',
                      child: Image(width: 100, image: AssetImage('images/firechat.png'))),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Firechat',
                        speed: const Duration(seconds: 1),
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
                borderRadius: BorderRadius.circular(30),
                elevation: 5,
                child: TextField(
                  onChanged: (value){
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
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
                  onChanged: (value){
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        ),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              AuthButton(text: 'Login', buttonHandler:LoginHandler)
            ],
          ),
        ),
      ),
    );
  }
}

