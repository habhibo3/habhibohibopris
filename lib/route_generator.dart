import 'package:flutter/material.dart';
import 'package:flutter_loginpage/models/listbuild.dart';
import 'package:flutter_loginpage/screens/AllowLocation.dart';
import 'package:flutter_loginpage/screens/CreateGame.dart';
import 'package:flutter_loginpage/screens/FriendsInUSerList.dart';
import 'package:flutter_loginpage/screens/GameRules.dart';
import 'package:flutter_loginpage/screens/Loading.dart';
import 'package:flutter_loginpage/screens/Loading3.dart';
import 'package:flutter_loginpage/screens/NearbyFriends.dart';
import 'package:flutter_loginpage/screens/NewGame.dart';
import 'package:flutter_loginpage/screens/Newuser.dart';
import 'package:flutter_loginpage/screens/Olduser.dart';
import 'package:flutter_loginpage/screens/RealGame.dart';
import 'package:flutter_loginpage/screens/Resetyourpassword2.dart';
import 'package:flutter_loginpage/screens/SetDate.dart';
import 'package:flutter_loginpage/screens/Settings.dart';
import 'package:flutter_loginpage/screens/changepassword.dart';
import 'package:flutter_loginpage/screens/doyoureallyjoinroom.dart';
import 'package:flutter_loginpage/screens/empty.dart';
import 'package:flutter_loginpage/screens/friends.dart';
import 'package:flutter_loginpage/screens/friendsrequests.dart';
import 'package:flutter_loginpage/screens/gamestats.dart';
import 'package:flutter_loginpage/screens/help.dart';
import 'package:flutter_loginpage/screens/invitefriends.dart';
import 'package:flutter_loginpage/screens/joinroom.dart';
import 'package:flutter_loginpage/screens/peopleintheroom.dart';
import 'package:flutter_loginpage/screens/shareWithfriends.dart';
import 'package:flutter_loginpage/screens/spetial.dart';
import 'package:flutter_loginpage/screens/spetial2.dart';
import 'package:flutter_loginpage/screens/testtesttest.dart';
import 'package:flutter_loginpage/services/search.dart';
import 'package:flutter_loginpage/try/HomeScreen.dart';
import 'package:flutter_loginpage/try/test.dart';
import 'package:flutter_loginpage/widgets/listmaker.dart';

import '../widgets/widgets.dart';
import 'package:flutter_loginpage/screens/Signup.dart';
import 'package:flutter_loginpage/screens/login-page.dart';
import 'package:flutter_loginpage/screens/Checkyouremail.dart';
import 'package:flutter_loginpage/screens/Resetyourpassword.dart';
import './main.dart';

class RouteGenerator {
  static  Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;


    switch(settings.name) {

      case'/':
        return MaterialPageRoute(builder: (_) =>Loading());
      case'LoginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());


      case 'Signup' :

        if(args is String) {

          return MaterialPageRoute(
              builder: (_) => Signup(
            data : args,
              ),
          );

        }
        return _errorRoute();

      case 'peopleintheroom' :

        if(args is String) {

          return MaterialPageRoute(
            builder: (_) => peopleintheroom(

            ),
          );

        }
        return _errorRoute();

      case 'spetial' :

        if(args is String) {

          return MaterialPageRoute(
            builder: (_) => spetial(
            ),
          );

        }
        return _errorRoute();
      case 'HomeScreen' :

        if(args is String) {

          return MaterialPageRoute(
            builder: (_) => HomeScreen(
            ),
          );

        }
        return _errorRoute();
      case 'joinroom' :

        if(args is String) {

          return MaterialPageRoute(
            builder: (_) => joinroom(
            ),
          );

        }
        return _errorRoute();


      case 'peopleintheroom' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => peopleintheroom(
            ),
          );

        }
        return _errorRoute();
      case 'changepassword' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => changepassword(
            ),
          );

        }
        return _errorRoute();

      case 'Checkyouremail' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Checkyouremail(
            ),
          );

        }
        return _errorRoute();


      case 'NearbyFriends' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => NearbyFriends(

            ),
          );

        }
        return _errorRoute();
      case 'empty' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => empty(

            ),
          );

        }
        return _errorRoute();
      case 'doyoureallyjoinroom' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => doyoureallyjoinroom(

            ),
          );

        }
        return _errorRoute();
      case 'NearbyFriends' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => NearbyFriends(

            ),
          );

        }
        return _errorRoute();

      case 'friends' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => friends(
            ),
          );

        }
        return _errorRoute();

      case 'FriendsInUserList' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => FriendsInUserList(
            ),
          );

        }
        return _errorRoute();

      case 'friendsrequests' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => friendsrequests(
            ),
          );

        }
        return _errorRoute();

      case 'GameRules' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => GameRules(
            ),
          );

        }
        return _errorRoute();

      case 'gamestats' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => gamestats(
            ),
          );

        }
        return _errorRoute();

      case 'help' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => help(
            ),
          );

        }
        return _errorRoute();

        case 'invitefriends' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => invitefriends(
            ),
          );

        }
        return _errorRoute();

      case 'peopleintheroom' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => peopleintheroom(
            ),
          );

        }
        return _errorRoute();

      case 'Loading3' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Loading3(
            ),
          );

        }
        return _errorRoute();

      case 'Newuser' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Newuser(
            ),
          );

        }
        return _errorRoute();

      case 'Olduser' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Olduser(
            ),
          );

        }
        return _errorRoute();

      case 'peopleintheroom' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => peopleintheroom(
            ),
          );

        }
        return _errorRoute();

      case 'RealGame' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => RealGame(
            ),
          );

        }
        return _errorRoute();

      case 'SetDate' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => SetDate(
            ),
          );

        }
        return _errorRoute();

      case 'Settings' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Settings(
            ),
          );

        }
        return _errorRoute();

      case 'shareWithfriends' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => shareWithfriends(
            ),
          );

        }
        return _errorRoute();








      case 'NewGame' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => NewGame(
            ),
          );

        }
        return _errorRoute();
      case 'AllowLocation' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => AllowLocation(

            ),
          );

        }
        return _errorRoute();
      case 'friendsrequests' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => friendsrequests(
            ),
          );

        }
        return _errorRoute();
      case 'Checkyouremail' :
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Checkyouremail(
              data : args,
            ),
          );
        }

        return _errorRoute();
      case 'Resetyourpassword' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Resetyourpassword(
              data : args,
            ),
          );

        }
        return _errorRoute();
      case 'Resetyourpassword2' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => Resetyourpassword2(
              data : args,
            ),
          );

        }
        return _errorRoute();
      case 'CreateGame' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => CreateGame(

            ),
          );

        }
        return _errorRoute();
      case 'NewGame' :

        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => NewGame(

            ),
          );

        }
        return _errorRoute();
      default :
        return _errorRoute();
    }

  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
        body: Center(
          child: Text('error'),
        ),
      );
    });

    }
}


