import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData,username) async {
    FirebaseFirestore.instance.collection("users").doc(username).set(userData).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> CreateRoom(userData,username, String roomname) async {
  FirebaseFirestore.instance.collection(roomname).doc(username).set(userData).catchError((e) {
  print(e.toString());
  });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());

    });
  }

  Future<bool> checkExist(String docID) async {
    bool exist=true;
    try {
      await FirebaseFirestore.instance.doc("users/$docID").get().then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }


  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData){

    FirebaseFirestore.instance.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
      print(e.toString());
    });
  }


  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
  Future<void> friendadded(String username1, String username2) async {
    //String str = await
    //FirebaseFirestore.instance.collection("users").
        //.doc(username1).;
    //QuerySnapshot.docs.length;
    FirebaseFirestore.instance.collection("users")
        .doc(username1).update({
          "friends.1": username2,
        }).then((_) {
          print("success!");
        });
    FirebaseFirestore.instance.collection("users")
        .doc(username2).update({
      "friends.1": username1,
    }).then((_) {
      print("success!");
  });
   //return str;
  }
  Stream<QuerySnapshot> get users {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }



}