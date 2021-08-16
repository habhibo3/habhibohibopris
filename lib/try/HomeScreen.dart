
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/FriendsInUSerList.dart';
import 'package:flutter_loginpage/screens/Newuser.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String usernamefound  = '';
  String emailfound ='';
  bool _visible1 = false;
  bool _visible2 = false;
  var requestsoffriends =new List();
  int i =0;
  String username='';

  bool condition =false;

  @override


  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    condition = true;
    username = await HelperFunctions.getUserNameSharedPreference();
    setState(() {
      isLoading = false;
    });


    await _firestore
        .collection('users')
        .where("userName", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        if(value!=null){
        userMap = value.docs[0].data();
        usernamefound = userMap['userName'];
        if(usernamefound==username || usernamefound.length<3){usernamefound='';};
        emailfound = userMap['userEmail'];
        requestsoffriends  = userMap["friends_request"];}
        else{
          isLoading = false;}
      });
      isLoading = false;
      requestsoffriends.add(username);
      if(condition==true && usernamefound!=''){

        _visible1=true;
        _visible2=false;

      }
      if(condition==true && usernamefound=='' ){

        _visible2=true;
        _visible1=false;
      }




    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 0, 0),
    leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Newuser()),)),

        title: Text("Search"),

      ),
      body:
      isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            height: size.height / 14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              height: size.height / 14,
              width: size.width / 1.15,
              child: TextField(style: TextStyle(color: Colors.white),
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.brown)



                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 50,
          ),
          ElevatedButton(style: ElevatedButton.styleFrom(
          primary: Colors.black12,),
            onPressed: onSearch,
            child: Text("Search",style: TextStyle(color: Colors.white),),



          ),
          SizedBox(
            height: size.height / 30,
          ),

          Visibility(

              visible:_visible1,
              child: Container(
                margin: const EdgeInsets.all(2.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                alignment: Alignment.centerLeft,
                color: Color.fromARGB(255, 169, 73, 73),
                width: 550,
                height: 70,
                child : Center(
                  child: Row(children: [
                  Text("                 "+usernamefound.toString(),style: TextStyle(color: Colors.white,fontSize: 17)),
                    Container(
                      width: 70,
                      height: 10,
                    ),
                    ElevatedButton(//height: 5,
                      //padding: EdgeInsets.symmetric(
                          //vertical: 10, horizontal: 10),


                      //shape: StadiumBorder(),
                      onPressed: () async {
                        String username = await HelperFunctions.getUserNameSharedPreference();
                        await FirebaseFirestore.instance.collection("users")
                          .doc(usernamefound.toString()).update({
                        "friends_request": requestsoffriends,
                      }).catchError((e){
                        print(e.toString());
                      });
                        showDialog(context: context, builder: (context){

                          return AlertDialog(title:Text('Phone Alert'),content: Text('friend request successfully sent'),actions: [FlatButton(onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),);}, child: Text('Continue'))],);
                        });




                      },
                      child: Text('Send request', style: TextStyle(color: Colors
                          .white, fontSize: 17, fontWeight: FontWeight.w700
                        ,),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black12,),

                    ),
                  ],),
                )

                ),

              ),



          Visibility(
            visible:_visible2,
            child: Container(
              width: 500,
              height: 70,
              child: Text("user dont exist",style: TextStyle(color: Colors.red),textAlign: TextAlign.center),
            ),


          )


          ]
      ),
    );
  }



  }

