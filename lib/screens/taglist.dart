import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/models/taglistlist.dart';
import 'package:flutter_loginpage/services/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class taglist extends StatelessWidget {
  final String data;
  taglist({
    Key key,
    @required this.data,
  }) : super(key: key);

  get w200 => null;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
    value: DatabaseService().taglist,
    child:Stack(
      children: [
        BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  tagList(),


                ],
              ),
            ),
          ),

        ),

      ],

    ),

    );
  }
}