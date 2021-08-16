import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';
import 'package:flutter_loginpage/widgets/background-image.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'login-page.dart';



class spetial2 extends StatefulWidget {
  @override
  _spetial2State createState() => _spetial2State();



}

class _spetial2State extends State<spetial2> with WidgetsBindingObserver {
  @override
  @override
  String points ='';
  String myUsername;
  bool test ;



  initState() {
    fn();
  }

  Future<void> fn() async {
    test = await HelperFunctions.getgameSharedPreference();
    myUsername=await HelperFunctions.getUserNameSharedPreference();
    print(myUsername);
    await FirebaseFirestore.instance.collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) async {
      if (value != null) {
        print(value.docs[0].data()["points"]);

        setState(() {points= value.docs[0].data()["points"];});


      }
    });
  }


  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,

                body: Form(

                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                          children: [
                            SizedBox(
                              height: 200
                              ,
                            ),

                            SizedBox(
                              height: 20
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),width : 300,child: Text(
                              'You have :',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w300,
                                  color: Colors.white, fontFamily: 'Raleway'

                              ),
                              textAlign: TextAlign.left,
                            ),),

                            SizedBox(
                              height: 30
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),width : 300,child: Text(
                              '     '+points+' points',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w300,
                                  color: Colors.white, fontFamily: 'Raleway'

                              ),
                              textAlign: TextAlign.left,
                            ),),
                            SizedBox(
                              height: 30
                              ,
                            ),
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 80),
                                shape: StadiumBorder(),
                                onPressed: () async {
                                  await HelperFunctions.savepointsSharedPreference('0');
                                  if(test==false){Navigator.of(context).pushNamed(
                                      'Newuser', arguments: '');}
                                  else{Navigator.of(context).pushNamed(
                                      'Olduser', arguments: '');}


                                },
                                child: Text('Back', style: TextStyle(color: Colors
                                    .white, fontSize: 25, fontWeight: FontWeight.w700
                                  ,),),
                                color: Colors.red[800],

                              ),
                            ),





                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ),]
      ),
    );
  }}