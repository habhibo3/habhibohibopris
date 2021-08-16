import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/models/tags.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });


  // collection reference
  final CollectionReference taglistCollection = FirebaseFirestore.instance.collection('taglist');

  Future<void> updateUserData(String name, var hastagged, var taggedby,var friends) async {
    return await taglistCollection.doc(uid).set({

      'name': [],
      'hastagged':[],
      'taggedby':taggedby,
       'friends' :[],




    });
  }
  /*List<Tags> _tagListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return Tags(

          name: doc.data()["name"].toString() ?? "",
          friend: doc.data()['friends'].toString() ?? "",
          hastagged: doc.data()['hastagged'].toString() ?? "",
          taggedby : doc.data()['taggedby'].toString() ?? "",

      );
    }).toList();
  }*/

  Stream<QuerySnapshot> get taglist {
    return taglistCollection.snapshots();
  }

}