import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  Description({Key key}) : super(key: key);

  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/dago.jpg',
              fit: BoxFit.cover,
            ),
            height: screenHeight * 0.5,
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.4),
            child: Material(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0)),
              child: Container(
                padding: EdgeInsets.only(
                    left: 50.0, top: 20.0,bottom: 30.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Dago Pakar',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      leading:Icon(Icons.streetview),
                      title:Text('Address'),
                      subtitle:Text('Jln.Dago Pakar'),     
                    ),
                    ListTile(
                      leading:Icon(Icons.call),
                      title:Text('Contact'),
                      subtitle:Text('1 500 377'),
                    ),
                    ListTile(
                      leading:Icon(Icons.access_time),
                      title:Text('Operation Hour'),
                      subtitle:Text('07:00 - 21:00'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
