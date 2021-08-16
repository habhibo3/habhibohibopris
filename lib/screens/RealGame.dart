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


class RealGame extends StatefulWidget {
  @override
  _RealGameState createState() => _RealGameState();



}

class _RealGameState extends State<RealGame> with WidgetsBindingObserver {





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
  double minDistance;
  double minDistanceabsolute=1000;
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
  int reloadduration ;
  double distancetime;
  bool newtest=true;
  String gamepointsstring;

  int gamepoints;











  initState() {

    //Roomget();
    mybigfunction();
  }
  Future<void> location() async {
    position =await _getCurrentLocation();
    lat = position.latitude.toString();
    long =position.longitude.toString();

  }

  /*Future<void> Roomget() async {
    RoomName=await HelperFunctions.getRoomSharedPreference();
    print("ghghghghgh");
    print(RoomName);
  }*/




  Future<void> mybigfunction()  async {
    await location();
    //romname= await HelperFunctions.getRoomSharedPreference();
    print('laaaaaaaaaafaaaaaaaaaafa');
    print("hhhhhhhhhhhhhhh");
    //print(romname+"h               hhhhhhhhhhhhhh");
    RoomName=await HelperFunctions.getRoomSharedPreference();
    print("ghghghghgh");
    print(RoomName);





    //RoomName="karezet_room";
    //await HelperFunctions.getRoomSharedPreference();
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(RoomName+"         eeeeeeeeeeeeeeeeeeeeee");
    myUsername= await HelperFunctions.getUserNameSharedPreference();
    print(")))))))))))))))))");
    print(myUsername);
    print(RoomName+"hhhhhhhhhhhhhhhhhh");
    print("------------------------");


    await FirebaseFirestore.instance.collection(RoomName).doc(myUsername).update({
      "Locationlat": lat,
      "Locationlon" : long,
    }).catchError((e) {
      print(e.toString());
    });
    print("aaaaaaaaaaaaaaaaaa");
    await FirebaseFirestore.instance
        .collection(RoomName).where("identifier", isEqualTo : "Player")
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          size = value.size;
          print(size = value.size);
          for(int index = 0 ; index < size; index++){
            nameTab.add(value.docs[index].data()["userName"]);
            distanceTab.add(Geolocator.distanceBetween(double.parse(value.docs[index].data()["Locationlat"]), double.parse(value.docs[index].data()["Locationlon"]),double.parse(lat),double.parse(long)));

          }
        }
      });
    });

    print("bbbbbbbbbbbbbbbbb");
    await FirebaseFirestore.instance
        .collection(RoomName)
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) async {
        if (value != null) {
          userMap = value.docs[0].data();
          kind = userMap["kind"];
          if(kind=='out'){await HelperFunctions.savegameSharedPreference(false);
            showDialog(context: context, builder: (context){

            return AlertDialog(title:Text('Phone Alert'),content: Text("You are out of the game" ),actions: [FlatButton(onPressed: (){Navigator.of(context).pushNamed(
                'GameStats', );}, child: Text('Continue'))],);
          });}


        }
      });
    print("kkkkkkkkkkkkkkkkk");
    if(kind=="Tagger"){setState(() { text = 'Tag'; });
      }
    else{setState(() { text = 'Run'; });}
    print(text);

    otherDistanceTab=distanceTab;
    distanceTab.sort();
    minDistance =distanceTab[0];
    minName=nameTab[otherDistanceTab.indexOf(minDistance)];
    print("cccccccccccccc");
    if(minDistanceabsolute>minDistance){minDistanceabsolute=minDistance;}


    if(minDistance>20){newtest==true;}
    print(kind);

    if(kind=='Runner' && minDistance<15) {
        await FirebaseFirestore.instance
            .collection('users')
            .get()
            .then((value)  async {
            if (value != null) {
              for (i = 0; i < size; i++){
              userMap = value.docs[i].data();
             if(userMap[kind]=='Runner'){
               await FirebaseFirestore.instance.collection(RoomName).doc(userMap['userName']).update({

                 "risk" :myUsername



               }).catchError((e) {
                 print(e.toString());
               });

             }

            }
          }});



    }
    print("dddddddddddddd");
    print(kind+"thisisit");
    if(kind=='Runner'){
      {setState(() {R=G=B=0; });}

      await FirebaseFirestore.instance
        .collection(RoomName)
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          userMap = value.docs[0].data();
          friendAtRisk = userMap['risk'];

        }
      });
    });}
    if(friendAtRisk!='' && newtest==true){
      newtest=false;
      showDialog(context: context, builder: (context){

        return AlertDialog(title:Text('Phone Alert'),content: Text('Your Friend '+friendAtRisk +'is about to get tagged' ),actions: [FlatButton(onPressed: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RealGame()),);}, child: Text('Continue'))],);


      });
    }
    if(minDistanceabsolute>15 && minDistance>30 && kind=="Runner"){oldpoints=oldpoints+10;
    await FirebaseFirestore.instance.collection('users').doc(myUsername).update({
      "points":oldpoints,
    }).catchError((e) {
      print(e.toString());
    });}
    print("fffffffffff");
    await FirebaseFirestore.instance.collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) async {
        if (value != null) {
          oldpoints= int.parse(value.docs[0].data()["points"]);

        }
      });

    if(minDistance>0 && minDistance<50){distancetime=5;}
    else{distancetime=minDistance/8;}

    reloadduration = distancetime.toInt();


      var duration = new Duration(seconds: reloadduration);
      return new Timer(duration,  mybigfunction);


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

                                  if(kind=='Tagger' && minDistance<15 &&State!='blocked'){

                                    await FirebaseFirestore.instance.collection(RoomName)
                                        .where("identifier", isEqualTo: "GameStats")
                                        .get()
                                        .then((value) async {
                                        if (value != null) {
                                          statsTab = value.docs[0].data()["statsTab"];
                                          statsTab.add(myUsername+" has tagged"+minName );
                                          await FirebaseFirestore.instance.collection(RoomName).doc("GameStats").update({
                                            "statsTab":statsTab,
                                          }).catchError((e) {
                                            print(e.toString());
                                          });

                                        }

                                    });


                                          oldpoints=oldpoints+10;
                                          await FirebaseFirestore.instance.collection('users').doc(myUsername).update({
                                            "points":oldpoints,
                                          }).catchError((e) {
                                            print(e.toString());
                                          });


                                    gamepointsstring=await HelperFunctions.getpointsSharedPreference().toString();
                                    gamepoints=int.parse(gamepointsstring);
                                    gamepoints=gamepoints+10;
                                    await HelperFunctions.savepointsSharedPreference(gamepoints.toString());



                                  }
                                  if(kind=='Tagger' && minDistance>15 ){
                                    State='blocked';
                                    setState(() {R=174;G=0;B=0;});





                                  }






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