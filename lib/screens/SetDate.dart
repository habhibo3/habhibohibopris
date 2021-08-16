import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'login-page.dart';

class SetDate extends StatefulWidget {
  @override
  _SetDateState createState() => _SetDateState();

}

class _SetDateState extends State<SetDate> with WidgetsBindingObserver {

@override
Widget build(BuildContext context) {
  final size = MediaQuery
      .of(context)
      .size;
  return Center(
    child: Stack(
        children: [
          BackgroundImage1(),
          Center(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 153, 0, 0),
                actions: [


                ],

                title: Text("Set date"),

              ),
              body: Form(

                child:  SafeArea(
                    child: Column(
                        children: [
                          SizedBox(
                            height: 150
                            ,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 100),
                            shape: StadiumBorder(),
                            onPressed: () async {
                              HelperFunctions.savetimeSharedPreference('3');
                              Navigator.of(context).pushNamed(
                                  'invitefriends', arguments: '');



                            },
                            child: Text('3 days', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.red[800],

                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),

                          Center(
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 100),
                              shape: StadiumBorder(),
                              onPressed: () async {await HelperFunctions.savetimeSharedPreference('7');
                              Navigator.of(context).pushNamed(
                                  'invitefriends', arguments: '');



                              },
                              child: Text('7 days', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),
                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 93),
                            shape: StadiumBorder(),
                            onPressed: () async {await HelperFunctions.savetimeSharedPreference('14');
                            Navigator.of(context).pushNamed(
                                'invitefriends', arguments: '');



                            },
                            child: Text('14 days', style: TextStyle(color: Colors
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
                                vertical: 10, horizontal: 93),
                            shape: StadiumBorder(),
                            onPressed: () async {await HelperFunctions.savetimeSharedPreference('21');
                            Navigator.of(context).pushNamed(
                                'invitefriends', arguments: '');



                            },
                            child: Text('21 days', style: TextStyle(color: Colors
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
                                vertical: 10, horizontal: 90),
                            shape: StadiumBorder(),
                            onPressed: () async {await
                              HelperFunctions.savetimeSharedPreference('30');
                              Navigator.of(context).pushNamed(
                                  'invitefriends', arguments: '');



                            },
                            child: Text('1 month', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.red[800],

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