import 'package:flutter/material.dart';

class BuddyCardList extends StatefulWidget {
  const BuddyCardList({Key? key}) : super(key: key);

  @override
  State<BuddyCardList> createState() => _BuddyCardListState();
}

class _BuddyCardListState extends State<BuddyCardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Buddy'),
    );
  }
}
