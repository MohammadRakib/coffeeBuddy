import 'package:coffee_buddy/Shared/loading.dart';
import 'package:coffee_buddy/Shared/decoration.dart';
import 'package:coffee_buddy/controller/database_controller.dart';
import 'package:coffee_buddy/model/app_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({Key? key}) : super(key: key);

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  final _formKey = GlobalKey<FormState>();
  // final List<String> sugars = ['0', '1', '2', '3', '4'];
  // final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  final DatabaseController _databaseController = DatabaseController();

  // form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    AppUser? _currentUser = Provider.of<AppUser?>(context);
    return _currentUser != null ? Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: textFieldDecoration,
              initialValue: _currentUser.name,
              validator: (val)=>val!.isEmpty?'Please enter your name':null,
              onChanged: (val){
                _currentName = val;
              },
            ),
            SizedBox(height: 5.0,),
            TextFormField(
              decoration: textFieldDecoration,
              initialValue: _currentUser.sugar,
              validator: (val)=>val!.isEmpty?'Please enter suger level':null,
              onChanged: (val){
                _currentSugars = val;
              },
            ),
            SizedBox(height: 5.0,),
            Slider(
                value: (_currentStrength??_currentUser.strength).toDouble(),
                min: 100.0,
                max: 700.0,
                divisions: 6,
                activeColor: Colors.brown[_currentStrength??_currentUser.strength],
                inactiveColor: Colors.brown.shade100,
                onChanged: (val){
                  setState(() {
                    _currentStrength = val.toInt();
                  });
                }
            ),
            ElevatedButton(
              onPressed: ()async{
                _currentUser.name = _currentName ?? _currentUser.name;
                _currentUser.sugar = _currentSugars ?? _currentUser.sugar;
                _currentUser.strength = _currentStrength ?? _currentUser.strength;
                await _databaseController.updateUser(_currentUser);
              },
              child: Text('Update'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.brown.shade300),
              ),
            )
          ],
        ),

      ),
    ) : const Loading();
  }
}
