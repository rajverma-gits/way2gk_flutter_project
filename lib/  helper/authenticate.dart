// @dart=2.9

import 'package:chat_app/User_account/signin.dart';
import 'package:chat_app/User_account/signup.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/main.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
       return SignIn(toggleView);
    } else{
      return SignUp(toggleView);
    }
  }
}
