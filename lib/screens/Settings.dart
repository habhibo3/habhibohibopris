import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();

}

class _SettingsState extends State<Settings> with WidgetsBindingObserver {
  final AuthService _auth = AuthService();
  String myUsername = '';
  List settings = ["Change Password","Terms and Condition","About","Logout"];
  bool test ;


  @override
  void initState() {
    // TODO: implement initState
    fn();
  }

  Future<void> fn() async { myUsername= await HelperFunctions.getUserNameSharedPreference();}


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 0, 0),


        title: Text("Settings"),

      ),
      body:ListView.builder(
          itemCount: settings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  tileColor: Color.fromARGB(255, 169, 73, 73),
                  onTap: () async {
                    if(index==0){Navigator.of(context).pushNamed(
                        'changepassword', arguments: '');};
                    if(index==1){};
                    if(index==2){};
                    if(index==3){_auth.signOut();
                    await HelperFunctions.saveUserLoggedInSharedPreference(false);
                    test=await HelperFunctions.getUserLoggedInSharedPreference();
                    print(test);

                    await FirebaseFirestore.instance.collection('users').doc(myUsername).update({
                      "statut": 'offline',
                    }).catchError((e) {
                      print(e.toString());
                    });

                      Navigator.of(context).pushNamed(
                        'LoginPage', arguments: '');};

                  },
                  title: Text("         "+settings[index],style: TextStyle(color:Colors.white,fontFamily: 'Raleway'),),



                ),

              ),
            );
          }
      ),
    );
  }
}