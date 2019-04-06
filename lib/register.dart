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
              // Material(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0)),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
                      child: TextFormField(
                        style:new TextStyle(color:Colors.blue),
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor:Colors.white,
                          filled:true,
                          hintText: 'Fullname',
                          hintStyle: TextStyle(color:Colors.blue),
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            // borderSide:const BorderSide(color:Colors.white),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'By Clicking Register You Must Agree Policy Agreement',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    new Checkbox(
                      value: (true),
                      onChanged: (null),
                    )
                  ],
                ),
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
