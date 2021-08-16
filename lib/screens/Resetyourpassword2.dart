import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/ResetVal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class Resetyourpassword2 extends StatefulWidget {
  @override
  final String data;
  Resetyourpassword2 ({ Key key,
    @required this.data,

  }):super(key:key);
  _MyResetyourpassword2State createState() => _MyResetyourpassword2State();
}
class _MyResetyourpassword2State  extends State<Resetyourpassword2 > {


  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  String _sucribestatus = 'Yes';
  ResetVal formsignup = new ResetVal();
  String _email;
  final auth = FirebaseAuth.instance;
  String myUsername='';
  initState() {function();
  print(myUsername);

  }
  Future<void> function()  async {myUsername= await HelperFunctions.getUserNameSharedPreference();
  }


  get w200 => null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKeyValue,
            child:

            SingleChildScrollView(
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
                          'Reset your password',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w300,
                              color: Colors.white, fontFamily: 'Raleway'
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,

                            color: Colors.yellow,

                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            width: 65,
                            height: 100,

                            alignment: Alignment.centerLeft,
                            child: Image(image: AssetImage(
                                'assets/images/will.png')),
                          ),
                          Container(
                            width: 120,
                            height: 100,


                            child: Container(
                              width: 1,
                              height: 1,

                              alignment: Alignment.bottomLeft,
                              child: RichText(
                                text: TextSpan(
                                  //text: 'Hello ',

                                  children:  <TextSpan>[
                                    TextSpan(text: myUsername.toString()
                                        ,
                                        style: TextStyle(fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontFamily: 'Raleway')),
                                    TextSpan(text: myUsername.toString(),
                                      style: TextStyle(fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey
                                          ,
                                          fontFamily: 'Raleway'),),
                                  ],
                                ),


                              ),),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(


                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Quote : Strong passwords include numbers, letters and punctuation marks.'
                                  ,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      fontFamily: 'Raleway')),
                              TextSpan(text: '  Strong, like you',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w300,
                                    color: Colors.red
                                    , fontFamily: 'Raleway'),),
                            ],
                          ),


                        ),

                      ),


                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.centerLeft, width: 315,
                        child: Text('Enter your email', style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Raleway',
                            fontSize: 15),

                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),

                            child: Column(children: [ new TextFormField(

                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                border: InputBorder.none,
                                hintText: '',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),

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
    style: kBodyText,
    textInputAction: TextInputAction.next,



    onChanged: (value) {
    setState(() {
    _email = value.trim();
    });}),





                            ]
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),



                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),


                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),


                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 100),
                          shape: StadiumBorder(),
                          onPressed: () {
                            _formSubmit();




                          },
                          child: Text('Reset', style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700
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

  void _formSubmit() {
    final FormState formStateVal = _formKeyValue.currentState;
    if (formStateVal.validate()) {
      formStateVal.save();
      print('form is saved');
      auth.sendPasswordResetEmail(email: _email);
      showDialog(context: context, builder: (context){
        return AlertDialog(title:Text('Phone Alert'),content: Text('a reset email was sent to your account'),actions: [FlatButton(onPressed: (){Navigator.of(context).pushNamed(
            'LoginPage', arguments: '');}, child: Text('Continue'))],);
      });
    }
  }
}