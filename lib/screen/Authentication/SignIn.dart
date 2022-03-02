import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/AuthController.dart';

class Signin extends StatefulWidget {
  Function toggle;
  Signin({required this.toggle});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final AuthController _auth = AuthController();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        actions: [
          ElevatedButton.icon(
              onPressed: (){widget.toggle();},
              icon: const Icon(Icons.person),
              label: const Text('Sign Up'),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0.0),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 15.0,),
            TextFormField(
              validator: (val) => val!.isEmpty ? 'Please enter email':null,
              onChanged: (val){email = val.trim();},
            ),
            const SizedBox(height: 15.0,),
            TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 6,
              obscureText: true,
              validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
              onChanged: (val){password = val.trim();},
            ),
            const SizedBox(height: 15.0,),
            ElevatedButton(
              onPressed: () async{
                if(_formKey.currentState!.validate()) {
                  dynamic user = await _auth.emailPasswordSignIn(email: email, password: password);
                  if(user is String){
                    setState(() {
                      errorMessage = user;
                    });
                  }else{
                    print(user.userId);
                  }
                }
              },
              child: const Text('sign in'),
            ),
            const SizedBox(height: 15.0,),
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
