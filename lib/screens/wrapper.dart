
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:provider/provider.dart';

import 'Newuser.dart';
import 'Olduser.dart';
import 'authenticate.dart';
import 'login-page.dart';

class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}
class _WrapperState extends State<Wrapper> {

  Map<String, dynamic> userMap;
  get userData => null;
  var myUsername;

  var RoomName;
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
  var time;
  var day;
  int oldpoints =0;
  String statut ='';
  var testuser;
  bool testgame = false;
  var begin;
  String ss = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;




  initState()  {
    another();
    print(testgame);



  }
  Future<bool> another() async {
    await HelperFunctions.savegameSharedPreference(true);
    testgame=await HelperFunctions.getgameSharedPreference();
    print(testgame);}

  Future<String> myfunction()  async {
    await HelperFunctions.savegameSharedPreference(true);
    myUsername = await HelperFunctions.getUserNameSharedPreference();
    testuser=await HelperFunctions.getUserLoggedInSharedPreference();
    testgame=await HelperFunctions.getgameSharedPreference();
    RoomName= await HelperFunctions.getRoomSharedPreference();
    begin =await HelperFunctions.getdaySharedPreference().toString();
    /*if(begin.runtimeType==String){day = int.parse(begin);}
    print("nnnnnnnnnnnnnnnnnnnnnn");




    begin =await HelperFunctions.gettimeSharedPreference().toString();
    if(begin.runtimeType==String){time = int.parse(begin);}
    print("ssssssssss");
    var currDt = DateTime.now();
    if((time+day)%30==currDt.day){
      FirebaseFirestore.instance.collection(RoomName).doc().delete();
      Navigator.of(context).pushNamed(
        'spetial',);


    }*/
    await FirebaseFirestore.instance
        .collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) async {
      if (value != null) {
        userMap = value.docs[0].data();
        statut = userMap["statut"];




      }
    });

    if(statut=="online"){print("ey");}
    return statut;





  }


  @override
  Widget build(BuildContext context) {

    // return either the Home or Authenticate widget
    print(testgame);
    print("aaaaaaaaaaaa");
    if(_auth.currentUser!= null && testgame){
      return(Olduser());
    }

    if (_auth.currentUser != null){
      return(Newuser());
    }
    else{
      return(LoginPage());
    }




  }
}
