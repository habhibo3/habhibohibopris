import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_loginpage/route_generator.dart';
import 'package:flutter_loginpage/screens/Loading.dart';
import 'package:flutter_loginpage/services/LocationService.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import './screens/login-page.dart';
import 'models/locationmodel.dart';
import 'models/user.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bubble/bubble.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return
      StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,

       child :MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter LoginPage',
                theme: ThemeData(
//textTheme:
//GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
//home: LoginPage(),
//onGenerateRoute: (settings){
                initialRoute: '/',
                onGenerateRoute: RouteGenerator.generateRoute,



              ),
    );
          //}

// Otherwise, show something whilst waiting for initialization to complete
          //return Loading();
}}
//}