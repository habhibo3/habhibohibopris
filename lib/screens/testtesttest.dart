import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/locationmodel.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'Olduser.dart';


class testtesttest extends StatefulWidget {
  @override
  _testtesttestState createState() => _testtesttestState();



}

class _testtesttestState extends State<testtesttest> with WidgetsBindingObserver {





  Map<String, dynamic> userMap;
  get userData => null;
  String myUsername;
  Position _currentPosition=null;

  int size = 0;
  List nameTab = new List();
  List distanceTab = new List();
  String myLocationlat ='';
  String myLocationlon ='';
  String minName ='';
  double minDistance = 0;
  List otherDistanceTab = new List();
  String kind = '';
  int i = 0;
  String friendAtRisk = '';
  String State = '';
  String color ='Green';
  List statsTab = new List();
  int points = 0;
  int R=48;
  int G=183;
  int B =66;
  int time = 0;
  int day =0;
  int oldpoints =0;
  String lat = '0';
  String long = '0';
  String text ='';
  String romname;
  String RoomName ="";

  Position position=null;











  initState() {
    startTime();

    //Roomget();
  }

  void myfn(){
    print('a');

  }
  startTime() async {
    var duration = new Duration(seconds: 20);
    return new Timer(duration,  myfn);
  }







  @override
  @override
  Widget build(BuildContext context) {


    return Center(
      child: Stack(
          children: [
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 153, 0, 0),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Olduser()),)),
                  actions: [
    ],

                  title: Text("Game On"),

                ),
                body: Form(

                  child:  SafeArea(
                    child: Column(
                        children: [
                          SizedBox(
                            height: 270
                            ,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, R, G, B)),

                              onPressed: () async {
                                print("khedmet aasba");



                              },


                              child: Text(text, style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),


                            ),
                          ),
                          SizedBox(
                            height: 80
                            ,
                          ),








                        ]
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
  _getCurrentLocation() async {
    await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
    return _currentPosition;
  }
}