import 'package:coffee_buddy/controller/AuthController.dart';
import 'package:coffee_buddy/controller/DatabaseController.dart';
import 'package:coffee_buddy/model/AppUser.dart';
import 'package:coffee_buddy/screen/Home/BuddyCardList.dart';
import 'package:coffee_buddy/screen/Home/CurrentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserCardList.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthController _auth = AuthController();
  final DatabaseController _databaseController = DatabaseController();
  List<Widget> states = [UserCardList(), BuddyCardList() ,CurrentUser()];
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AppUser>>.value(
      value: _databaseController.userStream,
      catchError: (_, __) => [],
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          backgroundColor: Colors.brown.shade300,
          title: Text('Home'),
          elevation: 0.0,
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                dynamic signout = await _auth.signOut();
                print(signout ?? signout);
              },
              icon: Icon(Icons.logout),
              label: Text('Sign Out'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor:
                    MaterialStateProperty.all(Colors.brown.shade300),
                overlayColor: MaterialStateProperty.all(Colors.brown.shade200),
              ),
            )
          ],
        ),
        body: states.elementAt(_state),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: "People",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: "Buddy",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(() {
              _state = index;
            });
          },
          selectedItemColor: Colors.brown.shade300,
          currentIndex: _state,
          selectedIconTheme: IconThemeData(
            size: 36.0,
          ),
          unselectedIconTheme: IconThemeData(
            size: 33.0,
          ),
        ),
      ),
    );
  }
}
