import 'package:flutter_loginpage/services/database1.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/Formsignup.dart';
import 'package:flutter_loginpage/widgets/check.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';
import 'package:email_auth/email_auth.dart';

class Checkyouremail extends StatefulWidget {
  @override
  final String data;

  Checkyouremail({ Key key,
    @required this.data,

  }):super(key:key);
  _CheckyouremailState createState() => _CheckyouremailState();
}



class _CheckyouremailState  extends State<Checkyouremail> {

  get w200 => null;
  String email = '';

  final res = check();
  String error = '' ;
  final TextEditingController _otpController = TextEditingController();
  Formsignup formsignup = new Formsignup();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  void initState(){

    getmail();

  }

  Future<void> getmail() async {
    email= await HelperFunctions.getUserEmailSharedPreference();

  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:  SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 340,
                      child: Text(
                        'Check your email',
                        style: TextStyle(
                          fontSize: 35,fontWeight:FontWeight.w300,
                          color: Colors.white,fontFamily: 'Raleway'
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 340,
                      child: Text(
                        'You’ll recieve a code to verify here so you can reset your account password.',
                        style: TextStyle(
                            fontSize: 17,fontWeight:FontWeight.w300,
                            color: Colors.white,fontFamily: 'Raleway'
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child:
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                            fillColor:  Colors.grey[100].withOpacity(0.1),
                          filled: true,



                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),

                          ),

                        ),
                        obscureText: true,
                        style: kBodyText,
                        textInputAction: TextInputAction.done,
                        controller: _otpController,
                      ),

                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Container( height: 15,child :Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),),),
                    SizedBox(
                      height: 35,
                    ),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 25),
                      child : Text(
                        'If you don’t see an email, don’t panic! Try checking your Spam, Junk, Social or some other folder.',
                        style: TextStyle(
                            fontSize: 17,fontWeight:FontWeight.w300,
                            color: Colors.white,fontFamily: 'Raleway'
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                Container(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child :
                    TextButton(
                        child: Text('Didn’t recieve your code?',
                          style: TextStyle(color: Colors.red,fontSize: 20),),
                        onPressed: () async {print(email);
                          await res.sendOTP(email);



                        }
                    ),),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child:FlatButton( padding: EdgeInsets.symmetric(vertical:5 ,horizontal: 80),
                        shape: StadiumBorder(),
                        onPressed:() async {
                        if(await res.verifyOTP(email,_otpController)){

                          showDialog(context: context, builder: (context){

                            return AlertDialog(title:Text('Phone Alert'),content: Text('account successfully created'),actions: [FlatButton(onPressed: (){Navigator.of(context).pushNamed(
                                'AllowLocation', arguments: '');}, child: Text('Continue'))],);
                          });

                          }
                        else{
                          setState(() {
                            error = 'wrong code';
                          });

                        }},
                        child : Text( 'Hello..it\'s me',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.w700
                          ,),),
                        color : Colors.red[600],

                      ),

                    ),

                  ],
                ),
              ),
          ),
          ),

      ],
    );
  }
}