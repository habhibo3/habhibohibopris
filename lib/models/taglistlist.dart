import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class tagList extends StatefulWidget {
  @override
  _tagListState createState() => _tagListState();
}

class _tagListState extends State<tagList> {
  @override
  Widget build(BuildContext context) {

    final taglist = Provider.of<QuerySnapshot>(context);

    //print(brews.documents);
    for (var doc in taglist.docs) {
      print(doc.data());
    }

    return Container(

    );
  }
}