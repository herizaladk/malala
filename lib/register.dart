import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Widget child;

  Register({Key key, this.child}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.white])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: ('Fullname'),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: ('Email'),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: ('Password'),
                ),
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    'By Clicking Register You Must Agree Policy Agreement',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  new Checkbox(
                    value:(true),
                    onChanged:(null),
                  )
                ],
              ),
              new FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  onPressed: () {},
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 62.0,
                    ),
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
