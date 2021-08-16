import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'login-page.dart';

class FriendsInUserList extends StatelessWidget {
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


                    child: SafeArea(
                      child: Column(
                          children: [
                            SizedBox(
                              height: 240
                              ,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 107),
                              shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                              onPressed: () async {Navigator.of(context).pushNamed(
                                  'friends', arguments: '');



                              },
                              child: Text('Your Friends', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),


                            ),
                            SizedBox(
                              height: 20
                              ,
                            ),
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 57),

                                shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                                onPressed: () async {Navigator.of(context).pushNamed(
                                    'HomeScreen', arguments: '');



                                },
                                child: Text('Send a friend request', style: TextStyle(color: Colors
                                    .white, fontSize: 25, fontWeight: FontWeight.w700
                                  ,),),


                              ),
                            ),
                            SizedBox(
                              height: 20
                              ,),
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal:30),

                                shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                                onPressed: () async {Navigator.of(context).pushNamed(
                                    'friendsrequests', arguments: '');



                                },
                                child: Text('friends requests received ', style: TextStyle(color: Colors
                                    .white, fontSize: 25, fontWeight: FontWeight.w700
                                  ,),),


                              ),
                            ),
                            SizedBox(
                              height: 300
                              ,),



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