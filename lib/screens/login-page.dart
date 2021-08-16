import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/palatte.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:flutter_loginpage/services/database1.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/shared/loadingg.dart';
import 'package:flutter_loginpage/widgets/FormVal.dart';
import 'package:flutter_loginpage/widgets/Formsignup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}
class _MyLoginPageState extends State<LoginPage> {

  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String error ='';
  var requestsoffriends = new List();
  var friendslist = new List();
  String valueText ='';
  TextEditingController _textFieldController = TextEditingController();
  Map<String, dynamic> userMap;
  Map<String, dynamic> userMapmap;

  Formsignup formsignup = new Formsignup();
  DatabaseMethods databaseMethods = new DatabaseMethods();


  String _sucribestatus = 'Yes';
  bool loading = false;
  FormVal formVal=new FormVal();
  Map _userObj ={};
  String codeDialog ='';
  bool zetest;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool testtest = true;
  bool existtest;



  Future<bool> fn() async {zetest =await HelperFunctions.getUserLoggedInSharedPreference();
  return zetest;}

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Phone Alert'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Choose a username"),
            ),
            actions: <Widget>[

              FlatButton(
                color: Colors.red,
                textColor: Colors.black,
                child: Text('Confirm'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return loading ? Loadingg() :  Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key : _formKeyValue,
            child :


               SafeArea(
                child: Column(
                  children: [

                    SizedBox(
                      height: 15
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
                      Text('Login', style: TextStyle(fontSize: 30
                        , color: Colors.white,),
                        textAlign: TextAlign.left,

                      ),),
                    SizedBox(
                      height: 20,
                    ),

                    Container(width: 330,
                      child:
                      Text('Email', style: TextStyle(fontSize: 20
                        , color: Colors.red,),
                        textAlign: TextAlign.left,

                      ),),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 0),

                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

    Container(

    child: Column(children:[ new TextFormField(

    decoration: InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 10),
    border: InputBorder.none,
    hintText: 'yourname@email.com',
    prefixIcon: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
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
      onChanged: (value) => formVal.email = value,
      onSaved: (value) => formVal.email = value,


    style: kBodyText,
      keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,



    ),
    Container(height: 1,color: Colors.white,)
    ]
    ),
    ),



                              SizedBox(
                                height: 20,
                              ),
                              Container(width: 342,
                                child:
                                Text('Password', style: TextStyle(fontSize: 20
                                  , color: Colors.red,),
                                  textAlign: TextAlign.left,

                                ),),
                              Container(

                                child: Column(children:[ new TextFormField(

                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
                                  onChanged: (value) => formVal.password = value,
                                  onSaved: (value) => formVal.password = value,


                                  style: kBodyText,
                                  textInputAction: TextInputAction.done,


                                ),
                                  Container(height: 1,color: Colors.white,)
                                ]
                                ),
                              ),





                              TextButton(
                                  child: Text('Forgot your password?',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        'Resetyourpassword2', arguments: '');
                                  }
                              ),

                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                child:FlatButton( padding: EdgeInsets.symmetric(vertical:5 ,horizontal: 100),
                                  shape: StadiumBorder(),
                                  onPressed:() {_formSubmit();},
                                  child : Text( 'Login',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.w700
                                    ,),),
                                  color : Colors.red[600],

                                ),

                              ),
                              Container(
                                height: 20,
                                child :Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                                ),

                              ),

                              Container(width:175,margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7.0),
                                child: Center(child: Row(children: [
                                  Container(
                                    height: 1, color: Colors.white, width: 80,

                                  ),
                                  Container(child: Text('or',
                                      style: TextStyle(color: Colors.white)),),


                                  Container(
                                    height: 1, color: Colors.white, width: 80,

                                  ),
                                ]),),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              /*FlatButton( padding: EdgeInsets.symmetric(vertical:5 ,horizontal: 100),
                                shape: StadiumBorder(),
                                onPressed:() {},

                                child : Text( 'Login with facebook',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500
                                  ,),),
                                color : Colors.blue[700],

                              ),*/
                              ElevatedButton.icon(
                                icon: Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                label: Text('Login with facebook',
                                  style: TextStyle(fontSize: 20),),
                                onPressed: () async{final LoginResult result = await FacebookAuth.instance.login(
                                  permissions: ['public_profile', 'email'],

                                );
                                // by default we request the email and the public profile
// or FacebookAuth.i.login()
                                if (result.status == LoginStatus.success) {
                                  // you are logged
                                  final AccessToken accessToken = result.accessToken;
                                }
                                final AccessToken accessToken = await FacebookAuth.instance.accessToken;
// or FacebookAuth.i.accessToken
                                if (accessToken != null) {
                                  // user is logged
                                  setState(() async {
                                    final facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken.token);
                                    await _auth.signInWithCredential(facebookAuthCredential);
                                    //await FirebaseFirestore.instance.collection('users');
                                    await HelperFunctions.saveUserLoggedInSharedPreference(true);
                                    await _displayTextInputDialog(context);
                                    await HelperFunctions.saveUserNameSharedPreference(valueText);
    
                                    String username = await HelperFunctions.getUserNameSharedPreference();
                                    existtest = await databaseMethods.checkExist(valueText);
                                    if(existtest==true) {Navigator.of(context).pushNamed(
    'AllowLocation', arguments: '');}
                                    else{Map<String,dynamic> userDataMap = {
                                    "userName" : valueText,
                                    "points" : "0",
                                    "friends_request" : requestsoffriends,
                                    "friends" :friendslist,
                                    "gamerequests" :friendslist,
                                    "statut" : "online",

                                    };


                                    databaseMethods.addUserInfo(userDataMap,valueText,);
                                    Navigator.of(context).pushNamed(
                                    'AllowLocation', arguments: '');}
                                  }






                                  );

                                }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Center(heightFactor: 1, widthFactor: 1,
                                child:
                                Container(width: 300,margin: new EdgeInsets.symmetric(horizontal: 45.0),
                                  child: Row(
                                      children: [


                                        Container(
                                          width: 190,

                                          child: Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(color: Colors.grey,fontSize: 18,),textAlign: TextAlign.center,
                                          ),
                                        ),
                                        TextButton(
                                            child: Text('Singup',
                                              style: TextStyle(fontSize: 18,
                                                color: Colors.red,),textAlign: TextAlign.center,),
                                            onPressed: () async {
                                              //setState(() => loading = true);

                                              Navigator.of(context).pushNamed(
                                                  'Signup', arguments: '');
                                            }
                                        ),
                                      ]),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    )
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
    if(formStateVal.validate()){
      formStateVal.save();
      print('form is saved');
    dynamic result = await _auth.signInWithEmailAndPassword(formVal.email, formVal.password);
    if(result == null) {
      setState(() {
        error = 'Could not sign in with those credentials';

      });}


      else{
      await FirebaseFirestore.instance.
          collection('users')
          .where("userEmail", isEqualTo: formVal.email)
          .get()
          .then((value)  {
          if (value != null) {
            userMap = value.docs[0].data();
    formVal.name = userMap["userName"];  }
          print(formVal.name);

    });
      print("aaaaaaaaaaaaaaaaaaaaa");


      await HelperFunctions.saveUserLoggedInSharedPreference(true);
      await HelperFunctions.saveUserNameSharedPreference(formVal.name);
      await FirebaseFirestore.instance.collection('users').doc(formVal.name).update({
        "statut": 'online',
      }).catchError((e) {
        print(e.toString());
      });
      Navigator.of(context).pushNamed(
          'Newuser', arguments: '');
    }

    }
    }
  }



