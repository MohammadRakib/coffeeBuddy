import 'package:coffee_buddy/model/AppUser.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {

  final AppUser user;
  UserCard({required this.user});

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
        ),
      ),
    );
  }
}
