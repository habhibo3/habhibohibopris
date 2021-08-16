import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/models/user.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:flutter_loginpage/services/database1.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/Formsignup.dart';
import 'package:flutter_loginpage/widgets/check.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/FormVal.dart';
import '/main.dart';

class Signup extends StatefulWidget {
  @override
  final String data;

  Signup({ Key key,
    @required this.data,

  }):super(key:key);
  _MySignupPageState createState() => _MySignupPageState();
}
class _MySignupPageState  extends State<Signup> {

  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  String error = '' ;
  final res = check();
  var requestsoffriends = new List();
  var friendslist = new List();

  String _sucribestatus = 'Yes';
  Formsignup formsignup = new Formsignup();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  @override


  Future<bool> checks() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where("userName", isEqualTo: formsignup.name)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {

          return true;

          }
        else {
          return false;

        }



      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Form(
                key : _formKeyValue,
                child:  SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20
                        ,
                      ),
                      Container(
                        height: 100,
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 100,
                            height: 100,
                          ),

                        ),
                      ),

                      Container(width: 340,
                        child:
                        Text('Sign up', style: TextStyle(fontSize: 30
                          , color: Colors.white,),
                          textAlign: TextAlign.left,

                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Container(width: 330,
                        child:
                        Text('First name', style: TextStyle(fontSize: 20
                          , color: Colors.red,),
                          textAlign: TextAlign.left,

                        ),),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [Container(

                                  child: Column(children: [ new TextFormField(

                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      border: InputBorder.none,
                                      hintText: 'New Customer',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                          FontAwesomeIcons.user,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      hintStyle: kBodyText,
                                      errorStyle: TextStyle(
                                        fontSize: 16.0,),
                                    ),

                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'name is required';
                    }
                    if (value.trim().length < 4) {
                      return 'Username must be at least 4 characters in length';
                    }
                    if(checks()==true){
                      return 'Username already exists';

                    }

                    // Return null if the entered username is valid
                    return null;
                  },
                  onChanged: (value) => formsignup.name = value,

                                    onSaved: (value) => formsignup.name = value,



                                    style: kBodyText,
                                    textInputAction: TextInputAction.next,


                                  ),
                                    Container(height: 1, color: Colors.white,)
                                  ]
                                  ),),

                                  SizedBox(
                                    height: 20,
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                      Container(width: 330,
                        child:
                        Text('Email', style: TextStyle(fontSize: 20
                          , color: Colors.red,),
                          textAlign: TextAlign.left,

                        ),),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(

                                    child: Column(children: [ new TextFormField(

                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        border: InputBorder.none,
                                        hintText: 'yourname@email.com',
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Icon(
                                            FontAwesomeIcons.envelope,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        hintStyle: kBodyText,
                                        errorStyle: TextStyle(
                                          fontSize: 16.0,),
                                      ),

                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        // Check if the entered email has the right format
                                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        // Return null if the entered email is valid
                                        return null;
                                      },
                                      onChanged: (value) => formsignup.email = value,
                                      onSaved: (value) => formsignup.email = value,


                                      style: kBodyText,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,


                                    ),
                                      Container(height: 1, color: Colors.white,)
                                    ]
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),

                      Container(width: 330,
                        child:
                        Text('Password', style: TextStyle(fontSize: 20
                          , color: Colors.red,),
                          textAlign: TextAlign.left,

                        ),),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(

                          child: Column(children: [ new TextFormField(

                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10),
                              border: InputBorder.none,
                              hintText: '*********',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  FontAwesomeIcons.lock,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              hintStyle: kBodyText,

                              errorStyle: TextStyle(
                                fontSize: 16.0,),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'password is required';
                              }
                              if (value.trim().length < 8) {
                                return 'Password must be at least 8 characters in length';
                              }
                              // Return null if the entered password is valid
                              return null;
                            },
                            onChanged: (value) => formsignup.password = value,
                            onSaved: (value) => formsignup.password = value,


                            style: kBodyText,
                            textInputAction: TextInputAction.done,


                          ),
                            Container(height: 1, color: Colors.white,),
                            SizedBox(
                              height: 15,
                            ),

                            Container( height: 15,child :Text(
    error,
    style: TextStyle(color: Colors.red, fontSize: 14.0),),),
                          ]
                          ),
                        ),

                      ),


                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 80,),
                          shape: StadiumBorder(),
                          onPressed: () async {
                            _formSubmit();



                          },
                          child: Text('Signup', style: TextStyle(color: Colors
                              .white, fontSize: 25, fontWeight: FontWeight.w700
                            ,),),
                          color: Colors.red[600],

                        ),


                      ),


                    ],
                  ),
                ),
              ),
            ),
            ),
        
      ],
    );
  }

  Future<void> _formSubmit() async {
    final FormState formStateVal = _formKeyValue.currentState;
    if (formStateVal.validate()) {
      formStateVal.save();
      dynamic result = await _auth.registerWithEmailAndPassword(formsignup.email, formsignup.password,formsignup.name);
      res.sendOTP(formsignup.email);
      if(result == null) {
        setState(() {
          error = 'Email already registered';
        });

    }
    else {
        await res.sendOTP(formsignup.email);
        Map<String,dynamic> userDataMap = {
          "userName" : formsignup.name,
          "userEmail" : formsignup.email,
          "points" : "0",
          "friends_request" : requestsoffriends,
          "friends" :friendslist,
          "gamerequests" :friendslist,
          "statut" : "online",
        };

        databaseMethods.addUserInfo(userDataMap,formsignup.name,);
        await HelperFunctions.saveUserEmailSharedPreference(formsignup.email);
        await HelperFunctions.saveUserNameSharedPreference(formsignup.name);
        await HelperFunctions.saveUserLoggedInSharedPreference(true);






        Navigator.of(context).pushNamed(
            'Checkyouremail', arguments: formsignup.email);
      }


  }
}}