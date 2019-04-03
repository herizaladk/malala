import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/aftersplash.png'),
            fit:BoxFit.cover,
            ),    
        ),
      ),
    );
  }
}