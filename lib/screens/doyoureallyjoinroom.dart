import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/locationmodel.dart';
import 'package:flutter_loginpage/screens/joinroom.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'empty.dart';


class doyoureallyjoinroom extends StatefulWidget {
  @override
  _doyoureallyjoinroomState createState() => _doyoureallyjoinroomState();

}

class _doyoureallyjoinroomState extends State<doyoureallyjoinroom> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = new List();
  String myUsername = '';
  String RoomName = '';
  int i = 0;
  var peopleintherome = new List();
  int size = 0;
  var ListofRooms = new List();
  Position _currentPosition = null;
  String kind = 'Tagger';
  String testkind = '';
  bool test = false;


  @override
  initState() {
    listMaking();
  }


  Future<void> listMaking() async {
    myUsername = await HelperFunctions.getUserNameSharedPreference();
    await _firestore
        .collection('users')
        .where(
        "userName", isEqualTo: myUsername)
        .get()
        .then((value) {
      if (value != null) {
        userMap = value.docs[0].data();
        RoomName = userMap["game_requests"];
        ListofRooms.add(RoomName);
        if (RoomName.length != 0) {
          test = true;
        }
      }
    });
    //}
    // );
  }


  @override
  Widget build(BuildContext context) {
    if (test == false) {
      return empty();
    } else {
      return joinroom();
    }
  }


}