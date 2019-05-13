import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('place').snapshots() ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (!snapshot.hasData)
          return Container(
            child:Text('KOSONG')
          );
          return Column(
            children: <Widget>[
              Text(snapshot.data.documents[0]['address'])
            ],

          );
        },
      ),
      
    );
  }
}

