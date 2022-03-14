import 'package:coffee_buddy/CurrentUserStreamProvider.dart';
import 'package:coffee_buddy/model/AppUser.dart';
import 'package:coffee_buddy/screen/Authentication/Authentication.dart';
import 'package:coffee_buddy/screen/Authentication/SignIn.dart';
import 'package:coffee_buddy/screen/Home/Home.dart';
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
