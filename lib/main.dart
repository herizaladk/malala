import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'login.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Login(),
      image: Image.asset('assets/logo.png'),
      gradientBackground: new LinearGradient(colors: [Colors.blue, Colors.white], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Malala"),
      loaderColor: Colors.white,
    );
  }
}

// class AfterSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Text("Welcome!",
//         style: new TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 30.0
//         ),),

//       ),
//     );
//   }
// }