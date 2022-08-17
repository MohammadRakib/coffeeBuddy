import 'package:coffee_buddy/controller/database_controller.dart';
import 'package:coffee_buddy/model/app_user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {

  final AppUser user;
  final AppUser? currentUser;
  UserCard({Key? key, required this.user, required this.currentUser}) : super(key: key);
  final DatabaseController _databaseController = DatabaseController();

  clickListItem(BuildContext context) => showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Buddy'),
      content: Text('Do you want to become buddy with ${user.name}'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await _databaseController.addBuddy(user,currentUser);
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[user.strength],
          ),
          title: Text(user.name),
          subtitle: Text(user.sugar),
          onTap: () async => await clickListItem(context),
        ),
      ),
    );
  }
}
