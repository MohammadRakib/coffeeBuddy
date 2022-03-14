import 'package:coffee_buddy/model/Buddy.dart';
import 'package:flutter/material.dart';

import '../../controller/DatabaseController.dart';
import '../../model/AppUser.dart';

class BuddyCard extends StatefulWidget {

  final Buddy buddy;
  final AppUser? currentUser;
  BuddyCard({Key? key, required this.buddy, required this.currentUser}) : super(key: key);
  final DatabaseController _databaseController = DatabaseController();

  @override
  State<BuddyCard> createState() => _BuddyCardState();
}

class _BuddyCardState extends State<BuddyCard> {
  @override
  Widget build(BuildContext context) {
    // Item click Logic
    clickListItem(BuildContext context) {

    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[widget.buddy.strength],
          ),
          title: Text(widget.buddy.name),
          subtitle: Text(widget.buddy.sugar),
          onTap: () async => await clickListItem(context),
        ),
      ),
    );
  }


}
