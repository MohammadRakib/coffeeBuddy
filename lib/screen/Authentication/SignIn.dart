import 'package:flutter/material.dart';
import '../../controller/AuthController.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    final AuthController _auth = AuthController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            dynamic user = await _auth.AnonSignIn();
            if(user == null){
              print('sign in error');
            }else{
              print(user.userId);
            }
          },
          child: Text('sign in'),
        ),
      ),
    );
  }
}
