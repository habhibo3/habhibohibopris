import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'login-page.dart';

class GameRules extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 153, 0, 0),


                  title: Text("Game Rules"),

                ),
                body: Form(


                    child: SafeArea(
                      child: Column(
                          children: [
                            SizedBox(
                              height: 40
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),width: 500,
                            child: Text("  1. Maximum player 10.",style: TextStyle(fontSize: 20,color: Colors.white),), ),
                            Container(margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              child: Text("2. When is game complete.",style: TextStyle(fontSize: 20,color: Colors.white),),width: 500, ),
                            SizedBox(
                              height: 5
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                              child: Text("After everyone is tagged.",style: TextStyle(fontSize: 20,color: Colors.white),),width: 300, ),
                            Container(margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                              child: Text("After everyone is tagged to",style: TextStyle(fontSize: 20,color: Colors.white),),width: 300, ),
                            SizedBox(
                              height: 10
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

                              child: Text("Time Limit :3 days/7 days/14 days/21 days/1 month",style: TextStyle(fontSize: 18,color: Colors.white),),width: 300, ),




                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ]
      );

  }}