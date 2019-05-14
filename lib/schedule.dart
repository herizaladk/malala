import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // double _imageHeight = 256.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.lightBlueAccent,
      body:Stack(
        children: <Widget>[
          _buildBottom()
        ],
  
      ),

    );
  }

   Widget _buildBottom () {
    return new Padding(
      padding: new EdgeInsets.only(top:150.0),
      child: new Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          _buildMyTaskHeader(),
          _buildTaskList(),


        ],
      ),
    );
  }

  Widget _buildTaskList () {
    return new Container();
  }

  Widget _buildMyTaskHeader(){
    return new Padding(
      padding:new EdgeInsets.only(left:0.0),
      child:new Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Schedule',
            style:TextStyle (fontSize:34.0,
            color:Colors.white,
            fontWeight:FontWeight.w600
            ),
            ),
        ],
      ),
    );
  }

}