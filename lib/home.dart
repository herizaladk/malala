import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
   const Home({Key key, this.user}) : super(key: key);
final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor:Colors.lightBlueAccent,
      resizeToAvoidBottomPadding:false,
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child:Text('Hello',
                  style: TextStyle(fontSize:24.0,fontWeight:FontWeight.normal,color:Colors.white),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}