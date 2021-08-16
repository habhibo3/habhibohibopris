import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/ResetVal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class changepassword extends StatefulWidget {
  @override
  final String data;
  changepassword ({ Key key,
    @required this.data,

  }):super(key:key);
  _changepasswordState createState() => _changepasswordState();
}
class _changepasswordState  extends State<changepassword > {


  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  String _sucribestatus = 'Yes';
  ResetVal formsignup = new ResetVal();
  String _email;
  final auth = FirebaseAuth.instance;


  get w200 => null;



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKeyValue,
              child:


                 SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,width: 200,
                        child: Center(
                          child: Image.asset(
                            'assets/images/CHANGE PASSWORD.png',
                            width: 350,
                            height: 350,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          width: 500,

                          child: Text(
                            'Change your password',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w300,
                                color: Colors.white, fontFamily: 'Raleway'

                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 0,
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
                        height: 5,
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

  Future<void> _formSubmit() async {
    final FormState formStateVal = _formKeyValue.currentState;
    if (formStateVal.validate()) {
      formStateVal.save();
      print('form is saved');
      await auth.sendPasswordResetEmail(email: _email);
      showDialog(context: context, builder: (context){
        return AlertDialog(title:Text('Phone Alert'),content: Text('a reset email was sent to your account'),actions: [FlatButton(onPressed: (){Navigator.of(context).pushNamed(
            'LoginPage', arguments: '');}, child: Text('Continue'))],);
      });
    }
  }
}