import 'package:coffee_buddy/model/app_user.dart';
import 'package:coffee_buddy/model/buddy.dart';
import 'package:coffee_buddy/shared/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {

  final Buddy buddy;
  final AppUser? currentUser;

  const ChatScreen({Key? key, required this.buddy, required this.currentUser}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text(widget.buddy.name),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 0, 8),
          child: CircleAvatar(
            backgroundColor: Colors.brown[900],
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: Colors.brown[widget.buddy.strength],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index) => Text(index.toString()),
                reverse: true,
            ),
          ),

          Container(
            color: Colors.brown.shade100,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const SizedBox(width: 8,),
                Expanded(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: textFieldDecoration.copyWith(hintText: 'Message ${widget.buddy.name}'),
                  ),
                ),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.send_rounded,color: Colors.brown.shade900,))
              ],
            ),
          ),

        ],
      ),
    );
  }
}
