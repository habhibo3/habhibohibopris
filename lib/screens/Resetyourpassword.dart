import 'package:flutter_loginpage/widgets/ResetVal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class Resetyourpassword extends StatefulWidget {
  @override
  final String data;
  Resetyourpassword ({ Key key,
    @required this.data,

  }):super(key:key);
  _MyResetyourpasswordState createState() => _MyResetyourpasswordState();
}
class _MyResetyourpasswordState  extends State<Resetyourpassword > {


  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  String _sucribestatus = 'Yes';
  ResetVal formsignup = new ResetVal();


  get w200 => null;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key : _formKeyValue,
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
                          fontSize: 35,fontWeight:FontWeight.w300,
                          color: Colors.white,fontFamily: 'Raleway'
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
                        child : Image(image: AssetImage('assets/images/will.png')),
                      ),
                      Container(
                        width: 120,
                        height: 100,


                        child:Container(
                          width: 1,
                          height: 1,

                          alignment: Alignment.bottomLeft,
                          child:RichText(
                            text: TextSpan(
                              //text: 'Hello ',

                              children: const <TextSpan>[
                                TextSpan(text: 'Perry Ayers  '
                                    , style: TextStyle(fontSize: 17,fontWeight:FontWeight.w300,
                                    color: Colors.white,fontFamily: 'Raleway')),
                                TextSpan(text: ' @perryayers',style:TextStyle(fontSize: 17,fontWeight:FontWeight.w300,
                                    color: Colors.grey
                                    ,fontFamily: 'Raleway' ),),
                              ],
                            ),


          ),),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 25),alignment: Alignment.centerLeft,
                    child:RichText(
                    text: TextSpan(


                      children: const <TextSpan>[
                        TextSpan(text: 'Strong passwords include numbers, letters and punctuation marks.'
                            , style: TextStyle(fontSize: 17,fontWeight:FontWeight.w300,
                                color: Colors.white,fontFamily: 'Raleway')),
                        TextSpan(text: '  Strong, like you',style:TextStyle(fontSize: 17,fontWeight:FontWeight.w300,
                            color: Colors.red
                            ,fontFamily: 'Raleway' ),),
                      ],
                    ),


                  ),

                  ),


                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,width: 315,
                    child:Text('Enter your new password',style: TextStyle(color: Colors.white,fontFamily: 'Raleway',fontSize: 15),

                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:Container(
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
                              padding: const EdgeInsets.symmetric(horizontal: 20),

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
                          textInputAction: TextInputAction.next,


                        ),
                        ]
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,width: 315,
                    child:Text('One more time',style: TextStyle(color: Colors.white,fontFamily: 'Raleway',fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:Container(
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
                              padding: const EdgeInsets.symmetric(horizontal: 20),

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
                            if (value != formsignup.password) {
                              return 'password don\'t much';
                            }


                            // Return null if the entered password is valid
                            return null;
                          },
                          onChanged: (value) => formsignup.password = value,
                          onSaved: (value) => formsignup.password = value,


                          style: kBodyText,
                          textInputAction: TextInputAction.done,


                        ),

                        ]
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),



                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:FlatButton( padding: EdgeInsets.symmetric(vertical:5 ,horizontal: 100),
                      shape: StadiumBorder(),
                      onPressed:() {_formSubmit();},
                      child : Text( 'Reset',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.w700
                        ,),),
                      color : Colors.red[600],

                    ),

                  ),

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
    }
  }
}