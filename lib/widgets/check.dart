import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/main.dart';
import 'package:email_auth/email_auth.dart';
class check{



  void sendOTP(String _email) async{
    EmailAuth.sessionName = "emailverification";
    var res = await EmailAuth.sendOtp(receiverMail: _email);
  }
  bool verifyOTP(String _email,TextEditingController _otpController) {
    var res = EmailAuth.validate(receiverMail: _email, userOTP: _otpController.value.text);
    return res;
  }  }