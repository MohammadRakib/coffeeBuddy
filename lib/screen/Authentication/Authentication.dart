import 'package:coffee_buddy/screen/Authentication/Register.dart';
import 'package:coffee_buddy/screen/Authentication/SignIn.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool toggleSignInSignUP = true;

  void toggle(){
    setState(() {
      toggleSignInSignUP = !toggleSignInSignUP;
    });
  }


  @override
  Widget build(BuildContext context) {

    return const Signin();
  }
}

