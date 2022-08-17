import 'package:coffee_buddy/controller/database_controller.dart';
import 'package:coffee_buddy/model/app_user.dart';
import 'package:coffee_buddy/model/buddy.dart';
import 'package:coffee_buddy/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';

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
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context)=>
                  ChatScreen(
                      buddy: widget.buddy,
                      currentUser: widget.currentUser)));
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
          onTap: () async => clickListItem(context),
        ),
      ),
    );
  }


}
