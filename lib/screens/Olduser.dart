import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/screens/spetial2.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'login-page.dart';

String RoomName="";

class Olduser extends StatelessWidget {
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
                body: Form(

                  child:  SafeArea(
                      child: Column(
                          children: [
                            Container(margin: const EdgeInsets.only(left: 15.0, right: 15.0,top :15),alignment: Alignment.centerRight,
                                child :IconButton(icon: Icon(Icons.album,color: Colors.amber,), onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => spetial2()),);})),
                            SizedBox(
                              height: 125
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 60),
                              shape: StadiumBorder(),
                              onPressed: () async {
                                RoomName=await HelperFunctions.getRoomSharedPreference();
                                print(RoomName);
                                Navigator.of(context).pushNamed(
                                  'Loading3', arguments: '');




                              },
                              child: Text('Continue Game', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),

                            Center(
                              child :SizedBox(
                                height: 1
                                ,
                              ),
                            ),
                            SizedBox(
                              height: 14
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 80),
                              shape: StadiumBorder(),
                              onPressed: () async {Navigator.of(context).pushNamed(
                                  'gamestats', arguments: '');



                              },
                              child: Text('Game Stats ', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),
                            SizedBox(
                              height: 15
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 115),
                              shape: StadiumBorder(),
                              onPressed: () async {
                                RoomName=await HelperFunctions.getRoomSharedPreference();
                                print(RoomName);
                                Navigator.of(context).pushNamed(
                                    'peopleintheroom', arguments: '');




                              },
                              child: Text('Room', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),
                            SizedBox(
                              height: 15
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 100),
                              shape: StadiumBorder(),
                              onPressed: () async {
                                Navigator.of(context).pushNamed(
                                  'Settings', arguments: '');



                              },
                              child: Text('Settings', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),
                            SizedBox(
                              height: 15
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 83),
                              shape: StadiumBorder(),
                              onPressed: () async {exit(0);



                              },
                              child: Text('Quite Game', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),
                            SizedBox(
                              height: 70
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 55),
                              shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),


                              onPressed: () async {Navigator.of(context).pushNamed(
                                  'shareWithfriends', arguments: '');




                              },
                              child: Text('Share with Friends', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              //color: Colors.red[800],

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
  }}