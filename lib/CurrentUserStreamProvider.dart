import 'package:coffee_buddy/screen/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/database_controller.dart';
import 'model/app_user.dart';

class CurrentUserStreamProvider extends StatelessWidget {
  final DatabaseController _databaseController = DatabaseController();

  @override
  Widget build(BuildContext context) {
    AppUser _currentUser = Provider.of<AppUser>(context);
    return StreamProvider<AppUser?>.value(
        value: _databaseController.currentUserStream(_currentUser),
        catchError: (_, __) => null,
        initialData: null,
        child: Home(),
    );
  }
}
