import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_loginpage/widgets/ResetVal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class help extends StatefulWidget {
  @override
  final String data;
  help ({ Key key,
    @required this.data,

  }):super(key:key);
  _helpState createState() => _helpState();
}
class _helpState  extends State<help > {


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

                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        width: 500,

                        child: Text(
                          'Help',
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



                    SizedBox(
                      height: 15,
                    ),



                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,),

                          borderRadius: BorderRadius.zero,
                        ),

                          child: Column(children: [ new TextFormField(

                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                border: InputBorder.none,
                                hintText: 'Your Name',
                                hintStyle : TextStyle(fontSize: 20.0, color: Colors.grey),

                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),

                                ),


                                errorStyle: TextStyle(
                                  fontSize: 16.0,),
                              ),




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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,),

                          borderRadius: BorderRadius.zero,
                        ),

                          child: Column(children: [ new TextFormField(

                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                border: InputBorder.none,
                                hintText: 'Your Email',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),

                                ),
                                hintStyle : TextStyle(fontSize: 20.0, color: Colors.grey),

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
                    Container(height: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(decoration: BoxDecoration(

                          border: Border.all(color: Colors.white,),

                          borderRadius: BorderRadius.zero,
                        ),

                          child: Column(children: [ new TextFormField(


                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,),
                                border: InputBorder.none,
                                hintText: 'Description',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5),

                                ),
                                hintStyle : TextStyle(fontSize: 20.0, color: Colors.grey),


                                errorStyle: TextStyle(
                                  fontSize: 16.0,),
                              ),




                              style: kBodyText,
                              textInputAction: TextInputAction.done,




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
                          borderRadius: BorderRadius.circular(0),
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
                        child: Text('Send', style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                          ,),),
                        color: Colors.red[600],

                      ),

                    ),
                    Container(

                      width: 325,
                      height: 200,
                      padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 50),
                        margin :const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20,top: 20),

                      decoration: BoxDecoration(
                          color: Colors.grey[100].withOpacity(0.1),
                          border: Border.all(color: Colors.white,)       ),),/*
                         *
                        child : Column(children: [
                          Container(child :ElevatedButton.icon(
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 10.0,
                        ),
                      label: Text('Login with facebook',
                        style: TextStyle(fontSize: 10),),
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                          ),
                        ],

                        )
                    )*/




                  ],

                ),
              ),
            ),
          ),),
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
        return AlertDialog(title:Text('Phone Alert'),content: Text('email has been successfully sent'),actions: [FlatButton(onPressed: (){Navigator.of(context).pushNamed(
            'LoginPage', arguments: '');}, child: Text('Continue'))],);
      });
    }
  }
}