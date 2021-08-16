import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/models/locationmodel.dart';
import 'package:flutter_loginpage/models/locationmodel.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/login-page.dart';
import 'package:flutter_loginpage/screens/wrapper.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '/main.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return testState();
  }
}
class testState extends State<test > {

  Position _currentPosition=null;
  String username ='';
  bool test1 ;





  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Stack(
      children: [
        BackgroundImage1(),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea( child :
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 30),
                  child: Center(
                      child: Image.asset(
                        'assets/images/Loacation.png',
                        width: 500,
                        height: 250,
                      )


                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(padding: const EdgeInsets.symmetric(horizontal: 30),

                  child: Text('App needs your location  to find your nearby friends.',
                    style: TextStyle(
                        color: Colors.grey,fontWeight:FontWeight.w500, fontSize: 20),),

                ),
                SizedBox(
                  height: 30,
                ),



                FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 120),
                  shape: StadiumBorder(),
                  onPressed: () async {
                    await HelperFunctions.savegameSharedPreference(false);
                    test1 = await HelperFunctions.getgameSharedPreference();


                    print(test1);

                  },
                  child: Text('Allow', style: TextStyle(color: Colors
                      .white, fontSize: 25, fontWeight: FontWeight.w700
                    ,),),
                  color: Colors.red[600],

                ),

              ],
            ),
            ),),),
      ],
    );
  }

}































































/*class kkk extends StatefulWidget {
  @override
  _kkkState createState() => _kkkState();

}


class _kkkState extends State<kkk> with WidgetsBindingObserver {

  final _database = FirebaseDatabase.instance.reference();
  String kk ='zefsdf';
  Map<String, dynamic> userMap;
  void initState(){
    super.initState();
    _activateListeners();
  }

  Future<void> _activateListeners() async {
    final habhibo = _database.child('/users/habhibo');
    await habhibo.set({'userName': 'habhibo'});
    print('hhhhhhhhhhhhhhh');

    _database.child('users/habhibo/userName').onValue.listen((event) {String description = event.snapshot.value;
    setState((){kk=description;
    print(description+"aa");});});
    print(kk);

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 0, 0),),


    );
  }

}*/