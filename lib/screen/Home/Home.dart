import 'package:coffee_buddy/controller/AuthController.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = AuthController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
              onPressed: () async{
                 dynamic signout = await _auth.signOut();
                 if(signout is String){
                   print(signout);
                 }else{
                   print(signout);
                 }
              },
              icon: Icon(Icons.logout),
              label: Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
