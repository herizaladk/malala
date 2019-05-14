import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart' as weather;
import 'dart:async';
import 'schedule.dart';
import 'settings.dart';

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

  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('place').getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Description(
                  post: post,
                )));
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
                // Text(
                //   'Hello Jhon!',
                //   style: TextStyle(
                //       fontSize: 24.0,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
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

            
            SizedBox(
              height: 20.0,
            ),

            Text(
              'Rekomendasi',
              style: TextStyle(
                color:Colors.white,
                fontSize:24.0,
                fontWeight:FontWeight.bold,
                 ),
              ),

            SizedBox(height:30.0),
            FutureBuilder(
              future: getPosts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text('Loading...');
                } else {
                  return new Container(
                    width: 400,
                    height: 400,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(10.0),
                            width: 250.0,
                            height: 400.0,
                            child: Stack(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () =>
                                      navigateToDetail(snapshot.data[index]),
                                  child: Container(
                                    width: 250.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(35.0),
                                            bottomLeft: Radius.circular(35.0),
                                            bottomRight: Radius.circular(35.0)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                snapshot.data[index].data['image']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 100,
                                  left: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(snapshot.data[index].data['name'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          )),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on,
                                              color: Colors.white),
                                          Text(
                                            snapshot.data[index].data['address'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }
              },
            )
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
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                }),
          ],
        ),
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

class Description extends StatefulWidget {
  final DocumentSnapshot post;
  Description({this.post});

  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        description(
          url: widget.post.data['image'],
          name: widget.post.data['name'],
          address: widget.post.data['address'],
          contact: widget.post.data['call'],
          hour: widget.post.data['hour'],
        )
      ],
    ));
  }

  Widget description({@required String url, name, address, contact, hour}) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          child: Image.asset(
            url,
            fit: BoxFit.cover,
          ),
          height: screenHeight * 0.5,
        ),
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.4),
          child: Material(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0)),
            child: Container(
              padding: EdgeInsets.only(left: 50.0, top: 20.0, bottom: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
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
                    leading: Icon(Icons.streetview),
                    title: Text('Address'),
                    subtitle: Text(address),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text('Contact'),
                    subtitle: Text(contact),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text('Operation Hour'),
                    subtitle: Text(hour),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}