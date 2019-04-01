import 'package:flutter/material.dart';

void main() => runApp(MyApp());

@override
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: new Color(0xFF43B0F1),
                  gradient: LinearGradient(
                      colors: [new Color(0xFF43B0F1), new Color(0xffE8EEF1)])),
            ),
          ],
        ),
      ),
    );
  }
}