import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'login-page.dart';

class shareWithfriends extends StatelessWidget {
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


                  title: Text("Share with friends"),

                ),
                body: SingleChildScrollView(
                  child: Form(

                    child:  SafeArea(
                        child: Column(
                            children: [
                              SizedBox(
                                height: 220
                                ,
                              ),
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 60),
                                shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                                onPressed: () async {
                                  Navigator.of(context).pushNamed(
                                      'friends', arguments:'');



                                },
                                child: Text('Friend in user List', style: TextStyle(color: Colors
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
                                      vertical: 10, horizontal: 90),

                                  shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                                  onPressed: () async {Navigator.of(context).pushNamed(
                                      'HomeScreen', arguments:'');




                                  },
                                  child: Text('Send request', style: TextStyle(color: Colors
                                      .white, fontSize: 25, fontWeight: FontWeight.w700
                                    ,),),


                                ),
                              ),
                              SizedBox(
                                height: 20
                                ,
                              ),
                         FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 90),

                          shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                          onPressed: () async {;
                          Navigator.of(context).pushNamed(
                              'friendsrequests', arguments:'');




                          },
                          child: Text('your requests', style: TextStyle(color: Colors
                              .white, fontSize: 25, fontWeight: FontWeight.w700
                            ,),),


                        ),

                            



                            ]
                        ),
                      ),
                    ),
                ),
                ),
              ),
            ]
      ),
    );
  }}