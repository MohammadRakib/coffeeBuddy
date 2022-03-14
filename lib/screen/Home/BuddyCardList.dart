import 'package:coffee_buddy/screen/Home/BuddyCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/Loading.dart';
import '../../controller/DatabaseController.dart';
import '../../model/AppUser.dart';
import '../../model/Buddy.dart';

class BuddyCardList extends StatelessWidget {

  final DatabaseController _databaseController = DatabaseController();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppUser?>(context);

    return StreamBuilder<List<Buddy>>(
      stream: _databaseController.buddyStream(currentUser),
      builder: (context,snapshoot) {
        if(snapshoot.hasData){

          List<Buddy>? buddyList = snapshoot.data;

          return buddyList != null && buddyList.isNotEmpty ? Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: buddyList.length,
              itemBuilder: (context,index) => BuddyCard(buddy: buddyList[index], currentUser: currentUser),

            ),
          ) : Center(
                        child: Text('No Buddy',
                               style: TextStyle(
                                 color: Colors.brown.shade300,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 30.0,
                               ),
                        ),
          );
        }else{
          return Loading();
        }
      },
    );
  }
}
