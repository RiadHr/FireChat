import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function buttonHandler;
  AuthButton({required this.text,required this.buttonHandler});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 5,
        borderRadius:BorderRadius.circular(30),
        color: const Color.fromRGBO(204, 68, 63, 1),
        child: MaterialButton(
          minWidth: 220,
          textColor: Colors.white,
          onPressed:() {
            buttonHandler();
          },
          child:  Text(text),
        ),
      ),
    );
  }
}
