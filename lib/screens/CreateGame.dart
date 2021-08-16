import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/locationmodel.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'authenticate.dart';
import 'login-page.dart';

class CreateGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateGameState();
  }
}
class CreateGameState extends State<CreateGame> {
  get userData => null;
  String myUsername;
  Map<String, dynamic> userMap;
  Position _currentPosition=null;
  String lat = '0';
  String long = '0';
  Position position=null;
  String tt;
  var currDt;



  void initState(){

    location();

  }

  Future<void> location() async {
    position =await _getCurrentLocation();
    lat = position.latitude.toString();
    long =position.longitude.toString();

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


                  title: Text("Create Room"),

                ),
                body: Form(


                    child: SafeArea(
                      child: Column(
                          children: [
                            SizedBox(
                              height: 235
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 97),

                              shape: StadiumBorder(),
                              onPressed: () async {
                                myUsername = await HelperFunctions.getUserNameSharedPreference();
                                print(myUsername);

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .where("userName", isEqualTo: myUsername)
                                    .get()
                                    .then((value) {

                                    if (value != null) {
                                      userMap = value.docs[0].data();}
                                    }
                                 );
                                currDt = DateTime.now();
                                await HelperFunctions.savedaySharedPreference(currDt.day.toString());
                                await HelperFunctions.savehourSharedPreference(currDt.hour.toString());
                                await HelperFunctions.savemonthSharedPreference(currDt.month.toString());
                                print("bbbbbbbbbbbbbbbbbb");




                                await FirebaseFirestore.instance.collection(myUsername+"_room").doc(myUsername.toString()).set({
                                  "userName": userMap["userName"],
                                  "Locationlat": lat,
                                  "Locationlon" : long,
                                  "kind" : "Runner",
                                  "identifier" : "Player",
                                  "risk" :'',
                                }).catchError((e) {
                                  print(e.toString());
                                });
                                print("aaaaaaaaaaaaaaaaaaaaa");
                                await FirebaseFirestore.instance.collection(myUsername+"_room").doc("GameStats").set({
                                  "identifier" : "GameStats",
                                  "statsTab" : [],
                                }).catchError((e) {
                                  print(e.toString());
                                });
                                await FirebaseFirestore.instance.collection(myUsername+"_room").doc("Time").set({
                                  "identifier" : "Time",
                                  "day" : currDt.day.toString(),
                                  "hour" : currDt.hour.toString(),
                                }).catchError((e) {
                                  print(e.toString());
                                });
                                await HelperFunctions.savegameSharedPreference(true);

                                print("cccccccccccccccccc");

                                await HelperFunctions.saveRoomSharedPreference(myUsername+"_room");
                                tt=await HelperFunctions.getRoomSharedPreference();
                                print(tt);
                                Navigator.of(context).pushNamed(
                                    'SetDate', arguments: '');



                                },
                                  child: Text('Create Room', style: TextStyle(color: Colors
                                      .white, fontSize: 25, fontWeight: FontWeight.w700
                                    ,),),
                                  color: Colors.red[800],

                                ),
                            SizedBox(
                              height: 30
                              ,
                            ),
                                FlatButton(
                                padding: EdgeInsets.symmetric(

                            vertical: 10, horizontal: 97),

                        shape: StadiumBorder(),
                        onPressed: () async {Navigator.of(context).pushNamed(
                            'GameRules', arguments: '');




                        },
                        child: Text('Game Rules', style: TextStyle(color: Colors
                            .white, fontSize: 25, fontWeight: FontWeight.w700
                          ,),),
                        color: Colors.red[800],

                      ),

                            SizedBox(
                              height: 20
                              ,
                            ),
                            Center(
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