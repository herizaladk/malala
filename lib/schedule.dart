import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar:AppBar(
          title:Text('Schedule'
          ),
        ),
      
      )

    );
  }
}