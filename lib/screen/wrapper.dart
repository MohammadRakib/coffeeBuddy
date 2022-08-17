import 'package:coffee_buddy/CurrentUserStreamProvider.dart';
import 'package:coffee_buddy/model/app_user.dart';
import 'package:coffee_buddy/screen/Authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);
    return user != null? CurrentUserStreamProvider():Authentication();
  }
}
