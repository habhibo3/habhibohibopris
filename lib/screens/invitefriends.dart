import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class invitefriends extends StatefulWidget {
  @override
  _invitefriendsState createState() => _invitefriendsState();

}

class _invitefriendsState extends State<invitefriends> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = new List();
  String myUsername='';






  @override


  initState() {
    listMaking();
  }


  Future<void>listMaking() async {



    setState(() {
      isLoading = false;
    });
    myUsername = await HelperFunctions.getUserNameSharedPreference();

    await _firestore
        .collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          userMap = value.docs[0].data();
          myfriends = userMap["friends"];


        }
      });
    });



  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 0, 0),
        actions: [
          ElevatedButton(//height: 5,
            //padding: EdgeInsets.symmetric(
            //vertical: 10, horizontal: 10),


            //shape: StadiumBorder(),
            onPressed: () async {Navigator.of(context).pushNamed(
                'peopleintheroom', arguments: '');



            },
            child: Text('Room', style: TextStyle(color: Colors
                .white, fontSize: 17, fontWeight: FontWeight.w700
              ,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.black12,),

          ),

        ],

        title: Text("invite friends"),

      ),
      body:ListView.builder(
          itemCount:myfriends.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  tileColor: Color.fromARGB(255, 169, 73, 73),
                  onTap: () async {
                    await FirebaseFirestore.instance.collection("users")
                        .doc(myfriends[index]).update({
                      "game_requests": (myUsername+"_room").toString(),
                    }).catchError((e) {
                      print(e.toString());
                    });
                    showDialog(context: context, builder: (context){

                      return AlertDialog(title:Text('Phone Alert'),content: Text('You invited '+myfriends[index] ),actions: [FlatButton(onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => invitefriends()),);}, child: Text('Continue'))],);
                    });



                  },
                  title: Text(myfriends[index]+"                                          invite    ",style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),



                ),

              ),
            );
          }
      ),
    );
  }
}
