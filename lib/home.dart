import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'description.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart' as weather;
import 'dart:async';
import 'schedule.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showStuff() async {
    Map data = await getweather(weather.appId, weather.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
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
                // Container(
                //   width: 50.0,
                //   height: 50.0,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Jatinangor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            new Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: updateTemp('Cileunyi')),
            // Text(
            //   '23C',
            //   style: TextStyle(color: Colors.white, fontSize: 30.0),
            // ),
            SizedBox(height: 50.0),
            // GestureDetector(
            // onTap: ()=> Desription(),
            // child:
            Container(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  homeWidget(
                      url: 'assets/dago.jpg',
                      name: 'Dago Pakar',
                      loc: 'Dago Street'),
                  homeWidget(
                      url: 'assets/bubu.jpg', 
                      name: 'Bubu Jungle', 
                      loc: 'ABC'),
                  homeWidget(
                      url: 'assets/alun.jpg', 
                      name: 'Alun-Alun', 
                      loc: 'AA'),
                ],
              ),
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () => showStuff()),
            IconButton(
                icon: Icon(Icons.date_range),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Schedule()));
                }),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
      ),
    );
    // );
  }

  Widget homeWidget({@required String url, name, loc}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 250.0,
      height: 400.0,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Description()));
            },
            child: Container(
              width: 250.0,
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      bottomLeft: Radius.circular(35.0),
                      bottomRight: Radius.circular(35.0)),
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover)),
            ),
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
                Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      loc,
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

  Future<Map> getweather(String appId, String city) async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city,id&appid=${weather.appId}&units=metric';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateTemp(String defaultcity) {
    return new FutureBuilder(
        future: getweather(weather.appId, weather.defaultCity),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      content['main']['temp'].toString(),
                      style: new TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}
