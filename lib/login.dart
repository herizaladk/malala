import 'package:flutter/material.dart';
import 'register.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment(0.0, 0.0),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/aftersplash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
             bottom: 550,
             right: 150,
            child: new Column(
              children: <Widget>[    
                  Text(
                    'The New \n Way to \n Travel ', textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.normal),
                  ),
              ],
            ),
          ),

          Positioned(
            bottom: 200,
            left:70,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                  new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>Register()
                        ),
                      );
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal:62.0,
                      ),
                    child: Text('Create Account',
                    textAlign:TextAlign.center,
                    style:TextStyle(
                      color:Colors.white
                    ),),
                    )
                  ),
                
              ],
            ),
          ),

          Positioned(
            bottom: 120,
            left:70,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                  new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    onPressed: () {},
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal:90.0,
                      ),
                    child: Text('Sign In',
                    textAlign:TextAlign.center,
                    style:TextStyle(
                      color:Colors.blue
                    ),),
                    )
                  ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}