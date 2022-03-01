import 'package:flutter/material.dart';
import '../../controller/AuthController.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {

  Function toggle;
  Register({required this.toggle});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthController _auth = AuthController();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        actions: [
          ElevatedButton.icon(
            onPressed: (){widget.toggle();},
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
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
                // dynamic user = await _auth.AnonSignIn();
                // if(user == null){
                //   print('sign in error');
                // }else{
                //   print(user.userId);
                // }
                if(_formKey.currentState!.validate()) {
                  print(email);
                  print(password);
                }
              },
              child: const Text('sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
