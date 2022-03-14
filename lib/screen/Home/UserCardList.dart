import 'package:coffee_buddy/model/AppUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserCard.dart';

class UserCardList extends StatelessWidget {
  const UserCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AppUser> userStream = Provider.of<List<AppUser>>(context);
    final user = Provider.of<AppUser?>(context);
    userStream.removeWhere((element) => element.userId == user?.userId);

    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
          itemCount: userStream.length,
          itemBuilder: (context,index) => UserCard(user: userStream[index],currentUser: user),

      ),
    );
  }
}
