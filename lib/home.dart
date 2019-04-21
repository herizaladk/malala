import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController ctrl = PageController();
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          margin: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Hello Jhon!',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Bandung',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '23C',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
              SizedBox(height:60.0),
              Container(
                height:400,
                child:ListView(
                  scrollDirection:Axis.horizontal,
                  children: <Widget>[
                    homeWidget(),
                    homeWidget(),
                    homeWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    // );
  }

  Widget homeWidget() {
    return Container(
      padding:EdgeInsets.all(10.0),
      width: 250.0,
      height: 400.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250.0,
            height: 300.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0)),
                image: DecorationImage(
                    image: AssetImage('assets/dago.jpg'), fit: BoxFit.cover)),
          ),
          // Positioned(
          //   bottom: 1,
          //   right: 5,
          //   child: FloatingActionButton(
          //     mini: true,
          //     backgroundColor: Colors.orange,
          //     child: Icon(
          //       Icons.chevron_right,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          Positioned(
            bottom: 100,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Dago Pakar',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize:18.0,)
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      '5KM Away',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
