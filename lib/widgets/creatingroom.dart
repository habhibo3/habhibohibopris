import 'package:cloud_firestore/cloud_firestore.dart';

class CreatingRoom{
  Future<void> CreateRoom(roomname) async {
    FirebaseFirestore.instance.collection("rooms").add(roomname).catchError((e) {
      print(e.toString());
    });
  }
}
